import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'My App';

  @override
  String get login => 'Login';

  @override
  String get signup => 'Sign Up';

  @override
  String get homeWelcome => 'Welcome to Home Page';

  @override
  String get onboardingMessage => 'Welcome! Get Started';
}
