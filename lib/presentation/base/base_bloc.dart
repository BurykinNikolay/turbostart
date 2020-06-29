import 'package:built_redux/built_redux.dart';
import 'package:turbostart/di/provider/localization_provider.dart';
import 'package:turbostart/di/provider/store_provider.dart';

import 'package:turbostart/app_starter.dart';
import 'package:turbostart/l10n/localizations.dart';

import '../../domain/domain.dart';

abstract class BaseBloc {
  final StoreProvider _storeProvider = di.singleton<StoreProvider>();
  final LocalizationProvider _localizationProvider = di.singleton<LocalizationProvider>();
  AppLocalizations get localization => _localizationProvider.localization;
  Store<AppState, AppStateBuilder, AppActions> get store => _storeProvider.store;
  AppActions get actions => store.actions;
  void init() {}
  void dispose() {}
}
