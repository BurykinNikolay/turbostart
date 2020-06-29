import 'package:built_redux/built_redux.dart';
import 'package:turbostart/domain/domain.dart';

import 'package:turbostart/app_starter.dart' as starter;

abstract class StoreProvider {
  Store<AppState, AppStateBuilder, AppActions> get store;
}

class StoreProviderImpl implements StoreProvider {
  @override
  Store<AppState, AppStateBuilder, AppActions> get store => starter.store;
}
