// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'AI Financial Assistant';

  @override
  String get appSubtitle =>
      'High-security Flutter app for financial message analysis.';

  @override
  String get analyze => 'Analyze';

  @override
  String get clear => 'Clear';

  @override
  String get inputLabel => 'Paste the financial message';

  @override
  String get inputHint => 'SMS, email or bank notification';

  @override
  String get inputError => 'Please enter a message';

  @override
  String get offlineAvailable => 'Offline analysis available';

  @override
  String get onlineMode => 'Online mode';

  @override
  String riskLevel(String level) {
    return 'Risk $level';
  }

  @override
  String get riskLow => 'Low';

  @override
  String get riskMedium => 'Medium';

  @override
  String get riskHigh => 'High';

  @override
  String get riskCritical => 'Critical';

  @override
  String get riskLowDesc => 'Message seems safe.';

  @override
  String get riskMediumDesc => 'Be careful. Verify the sender.';

  @override
  String get riskHighDesc => 'Potential fraud. Do not click links.';

  @override
  String get riskCriticalDesc => 'Scam detected! Do not share personal data.';

  @override
  String get suggestedAction => 'Suggested Action';

  @override
  String get detailSentiment => 'Sentiment';

  @override
  String get detailIntent => 'Intent';

  @override
  String get detailConfidence => 'Confidence';

  @override
  String get detailSource => 'Analysis';

  @override
  String get sourceLocal => '📱 Local (offline)';

  @override
  String get sourceCloud => '☁️ Cloud';

  @override
  String get loadingMessage => 'Analyzing message...';

  @override
  String get errorTitle => 'Error';

  @override
  String get errorConnection => 'No internet connection';

  @override
  String get errorConsent => 'Cloud analysis not authorized';

  @override
  String get errorInvalid => 'Invalid message';

  @override
  String get initialHint =>
      'Paste a financial message above to check if it\'s safe';

  @override
  String get initialExample =>
      'Example: \"We detected suspicious activity on your account...\"';

  @override
  String get analysisDetails => 'Analysis Details';

  @override
  String get detectedKeywords => 'Detected keywords:';

  @override
  String get sentimentPositive => 'Positive';

  @override
  String get sentimentNegative => 'Negative';

  @override
  String get sentimentNeutral => 'Neutral';

  @override
  String get intentFraud => 'Fraud';

  @override
  String get intentPayment => 'Payment';

  @override
  String get intentAlert => 'Alert';

  @override
  String get intentInfo => 'Info';

  @override
  String get intentComplaint => 'Complaint';

  @override
  String get intentPromotional => 'Promotional';

  @override
  String get intentUnknown => 'Unknown';

  @override
  String get confHigh => 'High';

  @override
  String get confMedium => 'Medium';

  @override
  String get confLow => 'Low';

  @override
  String get actionDoNotClickLinksTitle => 'Don\'t click links';

  @override
  String get actionDoNotClickLinksDesc =>
      'Access your bank\'s official app directly.';

  @override
  String get actionDoNotClickLinksAlternative =>
      'Use the official app or call the service center.';

  @override
  String get actionVerifySourceTitle => 'Verify the source';

  @override
  String get actionVerifySourceDesc =>
      'Confirm if the message came from an official channel.';

  @override
  String get actionVerifySourceAlternative =>
      'Compare the number or email with official channels.';

  @override
  String get actionIgnoreMessageTitle => 'Safe to ignore';

  @override
  String get actionIgnoreMessageDesc => 'Message looks safe and informative.';

  @override
  String get actionReportFraudTitle => 'Report as fraud';

  @override
  String get actionReportFraudDesc => 'This message has scam characteristics.';

  @override
  String get actionReportFraudAlternative =>
      'Block the sender and report to your bank.';
}
