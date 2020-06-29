import 'package:built_redux/built_redux.dart';
import 'package:turbostart/domain/domain.dart';
import 'login_actions.dart';
import 'login_screen_status.dart';
import 'login_state.dart';

NestedReducerBuilder<AppState, AppStateBuilder, LoginState, LoginStateBuilder> createLoginReducer() {
  return NestedReducerBuilder<AppState, AppStateBuilder, LoginState, LoginStateBuilder>(
    (state) => state.loginState,
    (builder) => builder.loginState,
  )
    ..add<bool>(LoginActionsNames.setRememberStatus, _setRememberStatus)
    ..add<LoginScreenStatus>(LoginActionsNames.setLoginScreenStatus, _setLoginScreenStatus);
}

void _setRememberStatus(
  LoginState state,
  Action<bool> action,
  LoginStateBuilder builder,
) =>
    builder.rememberStatus = action.payload;

void _setLoginScreenStatus(
  LoginState state,
  Action<LoginScreenStatus> action,
  LoginStateBuilder builder,
) =>
    builder.loginScreenStatus = action.payload;
