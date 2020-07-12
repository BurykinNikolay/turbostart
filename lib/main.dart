import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logger/logger.dart';
import 'package:turbostart/feature/home/home.dart';

import 'app_starter.dart' as starter;
import 'feature/auth/presentation/auth_screen.dart';
import 'feature/logger/logger.dart';
import 'l10n/localizations.dart';
import 'other/theme.dart';

void main({bool useDeviceSimulator = false, bool useReduxRemote = false}) {
  FlutterError.onError = (FlutterErrorDetails details) async {
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };

  runZonedGuarded<void>(
    () => _run(useDeviceSimulator: useDeviceSimulator, useReduxRemote: useReduxRemote),
    (error, stackTrace) async {
      logger.e('Unexpected error: $error\n$stackTrace');
    },
  );
}

/// main runner
Future<void> _run({bool useDeviceSimulator, bool useReduxRemote}) async {
  WidgetsFlutterBinding.ensureInitialized();

  //set LogLevel
  Logger.level = Level.debug;

  // after init
  await starter.startApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ReduxProvider(
      store: starter.store,
      child: MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            child: child,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          );
        },
        debugShowCheckedModeBanner: false,
        navigatorKey: starter.store.state.navigationState.rootNavigatorKey,
        title: 'Turbostart',
        theme: lightTheme(context),
        localizationsDelegates: [
          AppLocalizationsDelegate(),
          FallbackCupertinoLocalisationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('ru'),
          // Locale("en"),
        ],
        home: starter.store?.state?.userState?.token != null ? HomeScreen() : AuthScreen(),
      ),
    );
  }
}

class FallbackCupertinoLocalisationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'ru',
        'en',
      ].contains(locale.languageCode);

  @override
  Future<CupertinoLocalizations> load(Locale locale) => SynchronousFuture<_DefaultCupertinoLocalizations>(_DefaultCupertinoLocalizations(locale));

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}

class _DefaultCupertinoLocalizations extends DefaultCupertinoLocalizations {
  _DefaultCupertinoLocalizations(this.locale);

  final Locale locale;

  final monthEs = [
    '',
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre',
  ];

  @override
  String datePickerMonth(int monthIndex) {
    if (locale.languageCode == 'ru') {
      return monthEs[monthIndex];
    }

    return super.datePickerMonth(monthIndex);
  }

  @override
  String get alertDialogLabel => locale.languageCode == 'ru' ? 'Внимание' : 'Alert';
}
