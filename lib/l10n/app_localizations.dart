import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Financial Assistant'**
  String get appTitle;

  /// No description provided for @appSubtitle.
  ///
  /// In en, this message translates to:
  /// **'High-security Flutter app for financial message analysis.'**
  String get appSubtitle;

  /// No description provided for @analyze.
  ///
  /// In en, this message translates to:
  /// **'Analyze'**
  String get analyze;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @inputLabel.
  ///
  /// In en, this message translates to:
  /// **'Paste the financial message'**
  String get inputLabel;

  /// No description provided for @inputHint.
  ///
  /// In en, this message translates to:
  /// **'SMS, email or bank notification'**
  String get inputHint;

  /// No description provided for @inputError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a message'**
  String get inputError;

  /// No description provided for @offlineAvailable.
  ///
  /// In en, this message translates to:
  /// **'Offline analysis available'**
  String get offlineAvailable;

  /// No description provided for @onlineMode.
  ///
  /// In en, this message translates to:
  /// **'Online mode'**
  String get onlineMode;

  /// No description provided for @riskLevel.
  ///
  /// In en, this message translates to:
  /// **'Risk {level}'**
  String riskLevel(String level);

  /// No description provided for @riskLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get riskLow;

  /// No description provided for @riskMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get riskMedium;

  /// No description provided for @riskHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get riskHigh;

  /// No description provided for @riskCritical.
  ///
  /// In en, this message translates to:
  /// **'Critical'**
  String get riskCritical;

  /// No description provided for @riskLowDesc.
  ///
  /// In en, this message translates to:
  /// **'Message seems safe.'**
  String get riskLowDesc;

  /// No description provided for @riskMediumDesc.
  ///
  /// In en, this message translates to:
  /// **'Be careful. Verify the sender.'**
  String get riskMediumDesc;

  /// No description provided for @riskHighDesc.
  ///
  /// In en, this message translates to:
  /// **'Potential fraud. Do not click links.'**
  String get riskHighDesc;

  /// No description provided for @riskCriticalDesc.
  ///
  /// In en, this message translates to:
  /// **'Scam detected! Do not share personal data.'**
  String get riskCriticalDesc;

  /// No description provided for @suggestedAction.
  ///
  /// In en, this message translates to:
  /// **'Suggested Action'**
  String get suggestedAction;

  /// No description provided for @detailSentiment.
  ///
  /// In en, this message translates to:
  /// **'Sentiment'**
  String get detailSentiment;

  /// No description provided for @detailIntent.
  ///
  /// In en, this message translates to:
  /// **'Intent'**
  String get detailIntent;

  /// No description provided for @detailConfidence.
  ///
  /// In en, this message translates to:
  /// **'Confidence'**
  String get detailConfidence;

  /// No description provided for @detailSource.
  ///
  /// In en, this message translates to:
  /// **'Analysis'**
  String get detailSource;

  /// No description provided for @sourceLocal.
  ///
  /// In en, this message translates to:
  /// **'📱 Local (offline)'**
  String get sourceLocal;

  /// No description provided for @sourceCloud.
  ///
  /// In en, this message translates to:
  /// **'☁️ Cloud'**
  String get sourceCloud;

  /// No description provided for @loadingMessage.
  ///
  /// In en, this message translates to:
  /// **'Analyzing message...'**
  String get loadingMessage;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorTitle;

  /// No description provided for @errorConnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get errorConnection;

  /// No description provided for @errorConsent.
  ///
  /// In en, this message translates to:
  /// **'Cloud analysis not authorized'**
  String get errorConsent;

  /// No description provided for @errorInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid message'**
  String get errorInvalid;

  /// No description provided for @initialHint.
  ///
  /// In en, this message translates to:
  /// **'Paste a financial message above to check if it\'s safe'**
  String get initialHint;

  /// No description provided for @initialExample.
  ///
  /// In en, this message translates to:
  /// **'Example: \"We detected suspicious activity on your account...\"'**
  String get initialExample;

  /// No description provided for @analysisDetails.
  ///
  /// In en, this message translates to:
  /// **'Analysis Details'**
  String get analysisDetails;

  /// No description provided for @detectedKeywords.
  ///
  /// In en, this message translates to:
  /// **'Detected keywords:'**
  String get detectedKeywords;

  /// No description provided for @sentimentPositive.
  ///
  /// In en, this message translates to:
  /// **'Positive'**
  String get sentimentPositive;

  /// No description provided for @sentimentNegative.
  ///
  /// In en, this message translates to:
  /// **'Negative'**
  String get sentimentNegative;

  /// No description provided for @sentimentNeutral.
  ///
  /// In en, this message translates to:
  /// **'Neutral'**
  String get sentimentNeutral;

  /// No description provided for @intentFraud.
  ///
  /// In en, this message translates to:
  /// **'Fraud'**
  String get intentFraud;

  /// No description provided for @intentPayment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get intentPayment;

  /// No description provided for @intentAlert.
  ///
  /// In en, this message translates to:
  /// **'Alert'**
  String get intentAlert;

  /// No description provided for @intentInfo.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get intentInfo;

  /// No description provided for @intentComplaint.
  ///
  /// In en, this message translates to:
  /// **'Complaint'**
  String get intentComplaint;

  /// No description provided for @intentPromotional.
  ///
  /// In en, this message translates to:
  /// **'Promotional'**
  String get intentPromotional;

  /// No description provided for @intentUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get intentUnknown;

  /// No description provided for @confHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get confHigh;

  /// No description provided for @confMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get confMedium;

  /// No description provided for @confLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get confLow;

  /// No description provided for @actionDoNotClickLinksTitle.
  ///
  /// In en, this message translates to:
  /// **'Don\'t click links'**
  String get actionDoNotClickLinksTitle;

  /// No description provided for @actionDoNotClickLinksDesc.
  ///
  /// In en, this message translates to:
  /// **'Access your bank\'s official app directly.'**
  String get actionDoNotClickLinksDesc;

  /// No description provided for @actionDoNotClickLinksAlternative.
  ///
  /// In en, this message translates to:
  /// **'Use the official app or call the service center.'**
  String get actionDoNotClickLinksAlternative;

  /// No description provided for @actionVerifySourceTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify the source'**
  String get actionVerifySourceTitle;

  /// No description provided for @actionVerifySourceDesc.
  ///
  /// In en, this message translates to:
  /// **'Confirm if the message came from an official channel.'**
  String get actionVerifySourceDesc;

  /// No description provided for @actionVerifySourceAlternative.
  ///
  /// In en, this message translates to:
  /// **'Compare the number or email with official channels.'**
  String get actionVerifySourceAlternative;

  /// No description provided for @actionIgnoreMessageTitle.
  ///
  /// In en, this message translates to:
  /// **'Safe to ignore'**
  String get actionIgnoreMessageTitle;

  /// No description provided for @actionIgnoreMessageDesc.
  ///
  /// In en, this message translates to:
  /// **'Message looks safe and informative.'**
  String get actionIgnoreMessageDesc;

  /// No description provided for @actionReportFraudTitle.
  ///
  /// In en, this message translates to:
  /// **'Report as fraud'**
  String get actionReportFraudTitle;

  /// No description provided for @actionReportFraudDesc.
  ///
  /// In en, this message translates to:
  /// **'This message has scam characteristics.'**
  String get actionReportFraudDesc;

  /// No description provided for @actionReportFraudAlternative.
  ///
  /// In en, this message translates to:
  /// **'Block the sender and report to your bank.'**
  String get actionReportFraudAlternative;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
