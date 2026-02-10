// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Assistente Financeiro IA';

  @override
  String get appSubtitle =>
      'Aplicativo Flutter de alta segurança para análise de mensagens.';

  @override
  String get analyze => 'Analisar';

  @override
  String get clear => 'Limpar';

  @override
  String get inputLabel => 'Cole a mensagem financeira';

  @override
  String get inputHint => 'SMS, email ou notificação do banco';

  @override
  String get inputError => 'Por favor, insira uma mensagem';

  @override
  String get offlineAvailable => 'Análise offline disponível';

  @override
  String get onlineMode => 'Modo online';

  @override
  String riskLevel(String level) {
    return 'Risco $level';
  }

  @override
  String get riskLow => 'Baixo';

  @override
  String get riskMedium => 'Médio';

  @override
  String get riskHigh => 'Alto';

  @override
  String get riskCritical => 'Crítico';

  @override
  String get riskLowDesc => 'Mensagem parece segura.';

  @override
  String get riskMediumDesc => 'Cuidado. Verifique o remetente.';

  @override
  String get riskHighDesc => 'Potencial fraude. Não clique em links.';

  @override
  String get riskCriticalDesc => 'Golpe detectado! Não forneça dados pessoais.';

  @override
  String get suggestedAction => 'Ação Sugerida';

  @override
  String get detailSentiment => 'Sentimento';

  @override
  String get detailIntent => 'Intenção';

  @override
  String get detailConfidence => 'Precisão';

  @override
  String get detailSource => 'Análise';

  @override
  String get sourceLocal => '📱 Local (offline)';

  @override
  String get sourceCloud => '☁️ Nuvem';

  @override
  String get loadingMessage => 'Analisando mensagem...';

  @override
  String get errorTitle => 'Erro';

  @override
  String get errorConnection => 'Sem conexão com a internet';

  @override
  String get errorConsent => 'Análise em nuvem não autorizada';

  @override
  String get errorInvalid => 'Mensagem inválida';

  @override
  String get initialHint =>
      'Cole uma mensagem financeira acima para verificar se é segura';

  @override
  String get initialExample =>
      'Exemplo: \"Detectamos atividade suspeita em sua conta...\"';

  @override
  String get analysisDetails => 'Detalhes da Análise';

  @override
  String get detectedKeywords => 'Palavras-chave detectadas:';

  @override
  String get sentimentPositive => 'Positivo';

  @override
  String get sentimentNegative => 'Negativo';

  @override
  String get sentimentNeutral => 'Neutro';

  @override
  String get intentFraud => 'Fraude';

  @override
  String get intentPayment => 'Pagamento';

  @override
  String get intentAlert => 'Alerta';

  @override
  String get intentInfo => 'Info';

  @override
  String get intentComplaint => 'Reclamação';

  @override
  String get intentPromotional => 'Promocional';

  @override
  String get intentUnknown => 'Desconhecido';

  @override
  String get confHigh => 'Alta';

  @override
  String get confMedium => 'Média';

  @override
  String get confLow => 'Baixa';

  @override
  String get actionDoNotClickLinksTitle => 'Não clique em links';

  @override
  String get actionDoNotClickLinksDesc =>
      'Acesse o aplicativo oficial do seu banco diretamente.';

  @override
  String get actionDoNotClickLinksAlternative =>
      'Use o app oficial ou ligue para a central de atendimento.';

  @override
  String get actionVerifySourceTitle => 'Verifique a origem';

  @override
  String get actionVerifySourceDesc =>
      'Confirme se a mensagem veio de um canal oficial.';

  @override
  String get actionVerifySourceAlternative =>
      'Compare o número ou email com os canais oficiais.';

  @override
  String get actionIgnoreMessageTitle => 'Pode ignorar';

  @override
  String get actionIgnoreMessageDesc => 'Mensagem parece segura e informativa.';

  @override
  String get actionReportFraudTitle => 'Denuncie como fraude';

  @override
  String get actionReportFraudDesc =>
      'Esta mensagem tem características de golpe.';

  @override
  String get actionReportFraudAlternative =>
      'Bloqueie o remetente e denuncie ao seu banco.';
}
