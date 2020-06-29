import 'package:built_redux/built_redux.dart';
import 'package:dioc/dioc.dart' as dioc;
import 'package:turbostart/domain/domain.dart';
import 'package:turbostart/l10n/localizations.dart';


import 'di/bootstrap.dart';

dioc.Container di;

Store<AppState, AppStateBuilder, AppActions> _store;

Store<AppState, AppStateBuilder, AppActions> get store => _store;

// AppLocalizations
AppLocalizations localizations;

Future<void> startApp() async {
  //init Bootstrapper
  di = AppBootstrapperBuilder.instance.production();

  localizations = AppLocalizations();

  var savedState = AppState();
  //init storage
  _store = Store<AppState, AppStateBuilder, AppActions>(
    reducers,
    savedState,
    AppActions(),
    middleware: middlewares,
  );

  //init storage
}
