import tensorflow as tf
import numpy as np
import pandas as pd
import os
import json

def train_and_export():
    # Resolver caminhos relativos ao projeto
    current_dir = os.path.dirname(os.path.abspath(__file__))
    project_root = os.path.dirname(current_dir)
    
    dataset_path = os.path.join(project_root, 'data', 'dataset.csv')
    labels_path = os.path.join(project_root, 'data', 'labels.json')
    model_dir = os.path.join(project_root, 'android', 'app', 'src', 'main', 'assets')
    model_path = os.path.join(model_dir, 'financial_model.tflite')

    # 1. Carregar dados
    if not os.path.exists(dataset_path):
        print(f"Erro: Dataset não encontrado em {dataset_path}")
        print("Execute 'python scripts/generate_data.py' primeiro.")
        return

    df = pd.read_csv(dataset_path)
    texts = df['text'].astype(str).values
    labels = df['label'].values
    
    # 2. Mapeamento de labels
    label_map = {"fraud": 0, "payment": 1, "alert": 2, "info": 3}
    y = np.array([label_map[l] for l in labels])
    
    # 3. Criar Dataset
    dataset = tf.data.Dataset.from_tensor_slices((texts, y))
    dataset = dataset.shuffle(1000).batch(32)
    
    # 4. Vetorização de Texto
    max_tokens = 5000
    sequence_length = 64
    
    vectorize_layer = tf.keras.layers.TextVectorization(
        max_tokens=max_tokens,
        output_mode='int',
        output_sequence_length=sequence_length
    )
    vectorize_layer.adapt(texts)
    
    # 5. Criar Modelo
    model = tf.keras.Sequential([
        tf.keras.Input(shape=(1,), dtype=tf.string),
        vectorize_layer,
        tf.keras.layers.Embedding(max_tokens, 16),
        tf.keras.layers.GlobalAveragePooling1D(),
        tf.keras.layers.Dense(16, activation='relu'),
        tf.keras.layers.Dense(4, activation='softmax')
    ])
    
    model.compile(
        loss='sparse_categorical_crossentropy',
        optimizer='adam',
        metrics=['accuracy']
    )
    
    # 6. Treinar usando Dataset
    print("Iniciando treinamento...")
    # Precisamos que o dataset retorne o formato que o modelo espera (batch, 1) ou (batch,)
    # Como model.input é (1,), o dataset deve retornar (batch, 1)
    ds_final = dataset.map(lambda x, y: (tf.expand_dims(x, axis=-1), y))
    
    model.fit(ds_final, epochs=40, verbose=1)
    
    # 7. Salvar labels
    with open(labels_path, 'w') as f:
        json.dump(label_map, f)
        
    # 8. Exportar para TFLite
    print("Exportando para TFLite...")
    converter = tf.lite.TFLiteConverter.from_keras_model(model)
    # Ativar suporte para ops do TF necessárias para TextVectorization se necessário
    converter.target_spec.supported_ops = [
        tf.lite.OpsSet.TFLITE_BUILTINS, # enable TFLite ops.
        tf.lite.OpsSet.SELECT_TF_OPS # enable TF ops.
    ]
    
    tflite_model = converter.convert()
    
    os.makedirs(model_dir, exist_ok=True)
    with open(model_path, 'wb') as f:
        f.write(tflite_model)
        
    print(f"Modelo exportado com sucesso para {model_path}")

if __name__ == "__main__":
    train_and_export()
