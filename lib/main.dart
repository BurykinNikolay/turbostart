import 'package:built_redux/built_redux.dart';
import 'package:dioc/dioc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'di/di_container.dart';
import 'domain/domain.dart';
import 'feature/auth/presentation/auth_screen.dart';
import 'feature/profile/profile.dart';
import 'l10n/localizations.dart';
import 'other/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final store = Store<AppState, AppStateBuilder, AppActions>(
    reducers,
    AppState(),
    AppActions(),
    middleware: middlewares,
  );

  @override
  void initState() {
    super.initState();
    diContainer.register<Store<AppState, AppStateBuilder, AppActions>>(
      (container) => store,
      defaultMode: InjectMode.singleton,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ReduxProvider(
      store: store,
      child: StoreConnection<AppState, AppActions, AppTheme>(
        connect: (appState) => appState.appTheme,
        builder: (ctx, appTheme, actions) => MaterialApp(
          navigatorKey: store.state.navigationState.rootNavigatorKey,
          title: 'Turbostart',
          theme: appTheme == AppTheme.dark ? darkTheme(context) : lightTheme(context),
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
          home: ProfileScreen(),
        ),
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
