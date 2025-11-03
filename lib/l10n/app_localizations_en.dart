// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get register => 'Register';

  @override
  String get text_register => 'Login';

  @override
  String get button_register => 'Register';

  @override
  String get register_successful => 'Registration Successful';

  @override
  String get login => 'Login';

  @override
  String get text_login => 'Register';

  @override
  String get button_login => 'Login';

  @override
  String get login_successful => 'Login successful';

  @override
  String get login_incorrect => 'Incorrect username or password! Please try again';

  @override
  String get homepage => 'Dashboard';

  @override
  String get text_db => 'Dashboard';

  @override
  String hello(String username) {
    return 'Hello, $username';
  }

  @override
  String get list => 'Journey Notebook';

  @override
  String get settings => 'Setting';

  @override
  String get text_st => 'Setting';

  @override
  String get about => 'About us';

  @override
  String get text_about => 'About Us';

  @override
  String get logout => 'Logout';

  @override
  String get text_logout => 'Logout Successful';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String page(int _pageNumber) {
    return 'Page $_pageNumber';
  }

  @override
  String get nopages => 'No pages have been created yet';

  @override
  String get date => 'Date';

  @override
  String get nodiary => 'No diary yet';

  @override
  String get savediary => 'Saved';

  @override
  String get nosaveddiary => 'Not Saved';

  @override
  String get removediary => 'Remove Diary';
}
