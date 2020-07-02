import 'package:built_redux/built_redux.dart';
import 'package:turbostart/domain/models/user_info.dart';
import 'package:turbostart/domain/states/user_state.dart';
import 'package:turbostart/feature/auth/domain/login_domain.dart';
import 'package:turbostart/feature/health/health.dart';
import 'package:turbostart/feature/pedometer/pedometer.dart';

import '../domain.dart';

NestedReducerBuilder<AppState, AppStateBuilder, AppState, AppStateBuilder> createAppStateReducer() {
  return NestedReducerBuilder<AppState, AppStateBuilder, AppState, AppStateBuilder>(
    (state) => state,
    (builder) => builder,
  )
    ..add(AppActionsNames.updateTab, _updateTab)
    ..add<UserInfo>(LoginActionsNames.setUserInfo, _setUserInfo)
    ..add<StepsState>(HealthActionsNames.setStepsState, _setStepsState)
    ..add(LoginActionsNames.logout, _logout);
}

void _updateTab(
  AppState state,
  Action<AppTab> action,
  AppStateBuilder builder,
) =>
    builder.activeTab = action.payload;

void _logout(
  AppState state,
  Action<void> action,
  AppStateBuilder builder,
) =>
    builder..userState.replace(UserState())..stepsState.replace(StepsState())..pedometerState.replace(PedometerState());
void _setUserInfo(
  AppState state,
  Action<UserInfo> action,
  AppStateBuilder builder,
) =>
    builder.userState..userInfo.replace(action.payload);

void _setStepsState(
  AppState state,
  Action<StepsState> action,
  AppStateBuilder builder,
) =>
    builder.stepsState.replace(action.payload);
