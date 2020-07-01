import 'package:built_redux/built_redux.dart';

import 'package:turbostart/domain/domain.dart';
import 'package:turbostart/feature/auth/domain/login_domain.dart';
import 'package:turbostart/feature/health/health.dart';

import '../../../app_starter.dart' as starter;

MiddlewareBuilder<AppState, AppStateBuilder, AppActions> dbMiddleware() {
  return MiddlewareBuilder<AppState, AppStateBuilder, AppActions>()
    ..add(LoginActionsNames.setLoginResponse, _saveState)
    ..add(LoginActionsNames.logout, _saveState)
    ..add(LoginActionsNames.setUserInfo, _saveState)
    ..add(HealthActionsNames.setStepsState, _saveState)
    ..add(AppActionsNames.updateTab, _saveState);
}

void _saveState(MiddlewareApi<AppState, AppStateBuilder, AppActions> api, ActionHandler next, Action action) async {
  next(action);

  await starter.dbStorage.saveAppState(api.state);
}
