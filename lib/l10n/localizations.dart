import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'messages_all.dart';

/// Used to encapsulates the resources
class AppLocalizations {
  /// Function will load the string resources from the desired Locale
  static Future<AppLocalizations> load(Locale locale) {
    final name = locale.countryCode == null ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  /// Function will be a helper like any other InheritedWidget to facilitate the access to any string from any part of the app code
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get simpleText {
    return Intl.message('Simple Text', name: 'simpleText');
  }

  String get signIn {
    return Intl.message('Sign In', name: 'signIn');
  }

  String get emptyField {
    return Intl.message('The field cannot be empty', name: 'emptyField');
  }

  String get password {
    return Intl.message('Password', name: 'password');
  }

  String get login {
    return Intl.message('Login', name: 'login');
  }

  String get remember {
    return Intl.message('Remember', name: 'remember');
  }

  String get help {
    return Intl.message('Help', name: 'help');
  }

  String get setCurrentLogin {
    return Intl.message('Set current Login', name: 'setCurrentLogin');
  }

  String get passwordContainsInvalidCharacters {
    return Intl.message('Password contains invalid characters', name: 'passwordContainsInvalidCharacters');
  }

  String get correspondent {
    return Intl.message('Correspondent', name: 'correspondent');
  }

  String get backToTaskList {
    return Intl.message('Back to task list', name: 'backToTaskList');
  }

  String get error {
    return Intl.message('Error', name: 'error');
  }

  String get ok {
    return Intl.message('Ok', name: 'ok');
  }

  String get skip {
    return Intl.message('Skip', name: 'skip');
  }

  String get moveAndAccumulateSteps {
    return Intl.message('Move and accumulate steps', name: 'moveAndAccumulateSteps');
  }

  String get allStepsAreSetOff {
    return Intl.message('All steps are set off', name: 'allStepsAreSetOff');
  }

  String get teamVictoryYourVictory {
    return Intl.message('Team victory — your victory!', name: 'teamVictoryYourVictory');
  }

  String get allStepsAreConvertedIntoRublesAndGoToACharityFund {
    return Intl.message('All steps are converted into rubles and go to a charity fund', name: 'allStepsAreConvertedIntoRublesAndGoToACharityFund');
  }

  String get together {
    return Intl.message('Together', name: 'together');
  }

  String get turbostarts {
    return Intl.message('Turbostarts', name: 'turbostarts');
  }

  String get auth {
    return Intl.message('Auth', name: 'auth');
  }

  String get register {
    return Intl.message('Register', name: 'register');
  }

  String get processOfRegister {
    return Intl.message('Process of register', name: 'processOfRegister');
  }

  String get afterRegister {
    return Intl.message('After register', name: 'afterRegister');
  }

  String get haveAProblem {
    return Intl.message('Have a problem?', name: 'haveAProblem');
  }

  String get forgotPassword {
    return Intl.message('Forgot password?', name: 'forgotPassword');
  }

  String get email {
    return Intl.message('Email', name: 'email');
  }

  String get profile {
    return Intl.message('Profile', name: 'profile');
  }

  String get rating {
    return Intl.message('Rating', name: 'rating');
  }

  String get macroregion {
    return Intl.message('Macroregion', name: 'macroregion');
  }

  String get myMacroregion {
    return Intl.message('My macroregion', name: 'myMacroregion');
  }

  String get place {
    return Intl.message('Place', name: 'place');
  }

  String get placeInGeneralSetOff {
    return Intl.message('place in general set-off', name: 'placeInGeneralSetOff');
  }

  String get pedometer {
    return Intl.message('Pedometer', name: 'pedometer');
  }

  String get iam {
    return Intl.message('I\'am', name: 'iam');
  }

  String get today {
    return Intl.message('Today', name: 'today');
  }

  String get total {
    return Intl.message('Total', name: 'total');
  }

  String get mySteps {
    return Intl.message('My steps', name: 'mySteps');
  }

  String get stepsOfMacroregion {
    return Intl.message('Steps of macroregion', name: 'stepsOfMacroregion');
  }

  String get week {
    return Intl.message('Week', name: 'week');
  }

  String get month {
    return Intl.message('Month', name: 'month');
  }

  String get allTime {
    return Intl.message('All time', name: 'allTime');
  }

  String get steps {
    return Intl.message('Steps', name: 'steps');
  }

  String get tenThousand {
    return Intl.message('Every 10,000 steps are converted into 1 ruble, and all the funds raised go to a charity fund to support children with disabilities.', name: 'tenThousand');
  }

  String get makeYourContribution {
    return Intl.message('Make your contribution to a big deal!', name: 'makeYourContribution');
  }
}

/// Used to provide resources to app
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['ru', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
