import 'package:built_redux/built_redux.dart';
import 'package:turbostart/domain/states/user_state.dart';
import 'package:turbostart/feature/auth/domain/login_actions.dart';

import '../domain.dart';

NestedReducerBuilder<AppState, AppStateBuilder, UserState, UserStateBuilder> createUserStateReducer() {
  return NestedReducerBuilder<AppState, AppStateBuilder, UserState, UserStateBuilder>(
    (state) => state.userState,
    (builder) => builder.userState,
  )..add(LoginActionsNames.setLoginCredentials, _setLoginCredentials);
}

void _setLoginCredentials(
  UserState state,
  Action<String> action,
  UserStateBuilder builder,
) =>
    builder.token = action.payload;
