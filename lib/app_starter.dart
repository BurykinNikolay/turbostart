import 'dart:io';

import 'package:built_redux/built_redux.dart';
import 'package:dioc/dioc.dart' as dioc;
import 'package:path_provider/path_provider.dart';

import 'package:turbostart/domain/domain.dart';
import 'package:turbostart/l10n/localizations.dart';

import 'di/bootstrap.dart';
import 'feature/db/db_storage.dart';

dioc.Container di;

Store<AppState, AppStateBuilder, AppActions> _store;

Store<AppState, AppStateBuilder, AppActions> get store => _store;

// AppLocalizations
AppLocalizations localizations;

DbStorage dbStorage;

Future<void> startApp() async {
  //init Bootstrapper
  di = AppBootstrapperBuilder.instance.production();

  var appDocDir = Platform.isWindows ? "../fda_mobile_data/db" : (await getApplicationDocumentsDirectory()).path + "/db";

  dbStorage = DbStorage(appDocDir);
  await dbStorage.init();

  localizations = AppLocalizations();

  var savedState = await dbStorage.getAppState(AppState());
  //init storage
  _store = Store<AppState, AppStateBuilder, AppActions>(
    reducers,
    savedState,
    AppActions(),
    middleware: middlewares,
  );

  //init storage
}
