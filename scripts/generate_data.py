import pandas as pd
import random
import os

def generate_data():
    data = []
    
    # FRAUD CATEGORY
    fraud_templates = [
        "Urgente: Sua conta foi bloqueada. Clique no link para regularizar: {link}",
        "Detectamos uma tentativa de invasão. Confirme seus dados agora: {link}",
        "Sua senha expira em 24h. Atualize aqui para evitar bloqueio: {link}",
        "Parabéns! Você ganhou um prêmio. Resgate clicando no link: {link}",
        "Aviso: Transferência suspeita de R$ {value} detectada. Se não foi você, clique: {link}",
        "Recebemos um pedido de alteração de dados. Não foi você? {link}",
        "Sua conta {bank} precisa de verificação imediata. Acesse: {link}",
        "Alerta de segurança: Novo dispositivo conectado. Desconheça aqui: {link}"
    ]
    
    # PAYMENT CATEGORY
    payment_templates = [
        "Seu boleto de R$ {value} vence amanhã. Pague agora e evite juros.",
        "Confirmação de pagamento via PIX no valor de R$ {value} para {name}.",
        "Sua fatura do mês {month} já está disponível para pagamento.",
        "Recebemos seu depósito de R$ {value}. O saldo será atualizado em breve.",
        "Transferência agendada com sucesso para {name} no dia {date}.",
        "Seu cartão de crédito final {card} foi aprovado. Limite de R$ {value}.",
        "Débito automático de R$ {value} realizado hoje.",
        "Use o QR Code abaixo para realizar seu pagamento na {store}."
    ]
    
    # ALERT CATEGORY
    alert_templates = [
        "Aviso: O limite do seu cartão está próximo do fim.",
        "Notificação: Manutenção programada no sistema no dia {date}.",
        "Alerta: Detectamos uma oscilação na sua conexão com o banco.",
        "Atenção: Novas regras de segurança para transferências via PIX.",
        "Comunicado importante sobre as taxas da sua conta corrente.",
        "Lembrete: Atualize seu endereço no aplicativo para continuar recebendo faturas.",
        "Informativo: Sua conta agora tem acesso a novos fundos de investimento.",
        "Dica de segurança: Nunca forneça sua senha a terceiros por telefone."
    ]
    
    # INFO CATEGORY
    info_templates = [
        "Olá, como posso ajudar você hoje?",
        "Consulte seu extrato detalhado no menu 'Finanças'.",
        "Deseja saber mais sobre nossos planos de previdência?",
        "O banco {bank} deseja um ótimo dia para você!",
        "Saiba como economizar usando nossa nova ferramenta de metas.",
        "Informação: O horário de atendimento foi estendido até as 20h.",
        "Descubra as vantagens de ser um cliente Premium.",
        "Veja aqui o resumo dos seus gastos no último mês."
    ]
    
    banks = ["Banco do Brasil", "Itaú", "Bradesco", "Santander", "Nubank", "Inter"]
    names = ["João Silva", "Maria Oliveira", "Carlos Souza", "Ana Costa"]
    links = ["bit.ly/seguranca-ban", "linkp.site/verificar", "seguro.vcc.com/atualizar"]
    months = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho"]
    stores = ["Amazon", "Mercado Livre", "Magazine Luiza", "Posto Shell"]

    for _ in range(250):
        t = random.choice(fraud_templates)
        data.append({"text": t.format(link=random.choice(links), value=random.randint(500, 5000), bank=random.choice(banks)), "label": "fraud"})
        
        t = random.choice(payment_templates)
        data.append({"text": t.format(value=random.randint(10, 1000), name=random.choice(names), month=random.choice(months), date="15/05/2026", card=random.randint(1000, 9999), store=random.choice(stores)), "label": "payment"})
        
        t = random.choice(alert_templates)
        data.append({"text": t.format(date="sábado", bank=random.choice(banks)), "label": "alert"})
        
        t = random.choice(info_templates)
        data.append({"text": t.format(bank=random.choice(banks)), "label": "info"})

    df = pd.DataFrame(data)
    df = df.sample(frac=1).reset_index(drop=True) # Shuffle
    
    os.makedirs('data', exist_ok=True)
    df.to_csv('data/dataset.csv', index=False)
    print(f"Dataset gerado com {len(df)} exemplos em data/dataset.csv")

if __name__ == "__main__":
    generate_data()
