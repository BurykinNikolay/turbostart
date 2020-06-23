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