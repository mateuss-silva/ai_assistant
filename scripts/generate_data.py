import pandas as pd
import random
import os

def generate_data():
    # Resolver caminhos relativos ao projeto
    current_dir = os.path.dirname(os.path.abspath(__file__))
    project_root = os.path.dirname(current_dir)
    dataset_dir = os.path.join(project_root, 'data')
    dataset_path = os.path.join(dataset_dir, 'dataset.csv')

    data = []
    
    # === PORTUGUESE TEMPLATES ===

    # FRAUD CATEGORY (PT)
    fraud_templates_pt = [
        "Urgente: Sua conta foi bloqueada. Clique no link para regularizar: {link}",
        "Detectamos uma tentativa de invasão. Confirme seus dados agora: {link}",
        "Sua senha expira em 24h. Atualize aqui para evitar bloqueio: {link}",
        "Parabéns! Você ganhou um prêmio. Resgate clicando no link: {link}",
        "Aviso: Transferência suspeita de R$ {value} detectada. Se não foi você, clique: {link}",
        "Recebemos um pedido de alteração de dados. Não foi você? {link}",
        "Sua conta {bank} precisa de verificação imediata. Acesse: {link}",
        "Alerta de segurança: Novo dispositivo conectado. Desconheça aqui: {link}"
    ]
    
    # PAYMENT CATEGORY (PT)
    payment_templates_pt = [
        "Seu boleto de R$ {value} vence amanhã. Pague agora e evite juros.",
        "Confirmação de pagamento via PIX no valor de R$ {value} para {name}.",
        "Sua fatura do mês {month} já está disponível para pagamento.",
        "Recebemos seu depósito de R$ {value}. O saldo será atualizado em breve.",
        "Transferência agendada com sucesso para {name} no dia {date}.",
        "Seu cartão de crédito final {card} foi aprovado. Limite de R$ {value}.",
        "Débito automático de R$ {value} realizado hoje.",
        "Use o QR Code abaixo para realizar seu pagamento na {store}."
    ]
    
    # ALERT CATEGORY (PT)
    alert_templates_pt = [
        "Aviso: O limite do seu cartão está próximo do fim.",
        "Notificação: Manutenção programada no sistema no dia {date}.",
        "Alerta: Detectamos uma oscilação na sua conexão com o banco.",
        "Atenção: Novas regras de segurança para transferências via PIX.",
        "Comunicado importante sobre as taxas da sua conta corrente.",
        "Lembrete: Atualize seu endereço no aplicativo para continuar recebendo faturas.",
        "Informativo: Sua conta agora tem acesso a novos fundos de investimento.",
        "Dica de segurança: Nunca forneça sua senha a terceiros por telefone."
    ]
    
    # INFO CATEGORY (PT)
    info_templates_pt = [
        "Olá, como posso ajudar você hoje?",
        "Consulte seu extrato detalhado no menu 'Finanças'.",
        "Deseja saber mais sobre nossos planos de previdência?",
        "O banco {bank} deseja um ótimo dia para você!",
        "Saiba como economizar usando nossa nova ferramenta de metas.",
        "Informação: O horário de atendimento foi estendido até as 20h.",
        "Descubra as vantagens de ser um cliente Premium.",
        "Veja aqui o resumo dos seus gastos no último mês."
    ]

    # === ENGLISH TEMPLATES ===

    # FRAUD CATEGORY (EN)
    fraud_templates_en = [
        "Urgent: Your account has been blocked. Click the link to resolve: {link}",
        "We detected an intrusion attempt. Confirm your data now: {link}",
        "Your password expires in 24h. Update here to avoid being locked out: {link}",
        "Congratulations! You won a prize. Claim it by clicking the link: {link}",
        "Warning: Suspicious transfer of ${value} detected. If it wasn't you, click: {link}",
        "We received a request to change your data. Wasn't you? {link}",
        "Your {bank} account requires immediate verification. Access: {link}",
        "Security alert: New device connected. Unlink it here: {link}"
    ]

    # PAYMENT CATEGORY (EN)
    payment_templates_en = [
        "Your bill of ${value} is due tomorrow. Pay now to avoid late fees.",
        "Payment confirmation via wire transfer of ${value} to {name}.",
        "Your {month} statement is now available for payment.",
        "We received your deposit of ${value}. The balance will be updated shortly.",
        "Transfer scheduled successfully to {name} on {date}.",
        "Your credit card ending in {card} has been approved. Limit: ${value}.",
        "Automatic debit of ${value} processed today.",
        "Use the QR Code below to complete your payment at {store}."
    ]

    # ALERT CATEGORY (EN)
    alert_templates_en = [
        "Notice: Your card limit is almost reached.",
        "Notification: Scheduled maintenance on {date}.",
        "Alert: We detected a fluctuation in your connection to the bank.",
        "Attention: New security rules for wire transfers.",
        "Important notice about your checking account fees.",
        "Reminder: Update your address in the app to keep receiving statements.",
        "Your account now has access to new investment funds.",
        "Security tip: Never share your password with third parties over the phone."
    ]

    # INFO CATEGORY (EN)
    info_templates_en = [
        "Hello, how can I help you today?",
        "Check your detailed statement in the 'Finances' menu.",
        "Would you like to know more about our retirement plans?",
        "{bank} Bank wishes you a great day!",
        "Learn how to save using our new goal-tracking tool.",
        "Information: Business hours have been extended until 8 PM.",
        "Discover the advantages of being a Premium client.",
        "See here a summary of your spending last month."
    ]

    # Shared data for template filling
    banks = ["Banco do Brasil", "Itaú", "Bradesco", "Santander", "Nubank", "Inter"]
    banks_en = ["Bank of America", "Chase", "Wells Fargo", "Citibank", "Capital One", "HSBC"]
    names = ["João Silva", "Maria Oliveira", "Carlos Souza", "Ana Costa"]
    names_en = ["John Smith", "Mary Johnson", "James Brown", "Sarah Davis"]
    links = ["bit.ly/seguranca-ban", "linkp.site/verificar", "seguro.vcc.com/atualizar"]
    months_pt = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho"]
    months_en = ["January", "February", "March", "April", "May", "June"]
    stores = ["Amazon", "Mercado Livre", "Magazine Luiza", "Posto Shell"]
    stores_en = ["Amazon", "Walmart", "Best Buy", "Target"]

    # Generate Portuguese samples (250 per category)
    for _ in range(250):
        t = random.choice(fraud_templates_pt)
        data.append({"text": t.format(link=random.choice(links), value=random.randint(500, 5000), bank=random.choice(banks)), "label": "fraud"})
        
        t = random.choice(payment_templates_pt)
        data.append({"text": t.format(value=random.randint(10, 1000), name=random.choice(names), month=random.choice(months_pt), date="15/05/2026", card=random.randint(1000, 9999), store=random.choice(stores)), "label": "payment"})
        
        t = random.choice(alert_templates_pt)
        data.append({"text": t.format(date="sábado", bank=random.choice(banks)), "label": "alert"})
        
        t = random.choice(info_templates_pt)
        data.append({"text": t.format(bank=random.choice(banks)), "label": "info"})

    # Generate English samples (250 per category)
    for _ in range(250):
        t = random.choice(fraud_templates_en)
        data.append({"text": t.format(link=random.choice(links), value=random.randint(500, 5000), bank=random.choice(banks_en)), "label": "fraud"})
        
        t = random.choice(payment_templates_en)
        data.append({"text": t.format(value=random.randint(10, 1000), name=random.choice(names_en), month=random.choice(months_en), date="05/15/2026", card=random.randint(1000, 9999), store=random.choice(stores_en)), "label": "payment"})
        
        t = random.choice(alert_templates_en)
        data.append({"text": t.format(date="Saturday", bank=random.choice(banks_en)), "label": "alert"})
        
        t = random.choice(info_templates_en)
        data.append({"text": t.format(bank=random.choice(banks_en)), "label": "info"})

    df = pd.DataFrame(data)
    df = df.sample(frac=1).reset_index(drop=True) # Shuffle
    
    os.makedirs(dataset_dir, exist_ok=True)
    df.to_csv(dataset_path, index=False)
    print(f"Bilingual dataset generated with {len(df)} examples in {dataset_path}")

if __name__ == "__main__":
    generate_data()
