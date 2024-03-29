import 'package:built_redux/built_redux.dart';

import 'package:turbostart/domain/domain.dart';
import 'package:turbostart/feature/auth/domain/login_screen_status.dart';
import 'package:turbostart/feature/auth/repository/login_repository.dart';
import 'package:turbostart/feature/navigation/domain/app_route.dart';
import 'package:turbostart/feature/navigation/navigation.dart';
import 'package:turbostart/feature/push_service/push_service.dart';

import '../login_actions.dart';

const _success = "success";

MiddlewareBuilder<AppState, AppStateBuilder, AppActions> loginMiddleware() {
  return MiddlewareBuilder<AppState, AppStateBuilder, AppActions>()
    ..add(LoginActionsNames.setLoginResponse, _setLoginResponse)
    ..add(LoginActionsNames.loginRequest, _loginRequest)
    ..add(LoginActionsNames.setUserInfoResponse, _setUserInfoResponse)
    ..add(LoginActionsNames.logout, _logout);
}

void _loginRequest(MiddlewareApi<AppState, AppStateBuilder, AppActions> api, ActionHandler next, Action<LoginRequest> action) async {
  next(action);
  api.actions.login.setLoginScreenStatus(LoginScreenStatus.progress);
}

void _setLoginResponse(MiddlewareApi<AppState, AppStateBuilder, AppActions> api, ActionHandler next, Action<LoginResponse> action) {
  next(action);

  final loginResponse = action.payload;

  api.actions.login.setLoginScreenStatus(LoginScreenStatus.wait);

  if (loginResponse.status == _success) {
    final token = loginResponse.authKey;
    api.actions.login.setLoginCredentials(token);
    api.actions.navigation.routeTo(
      AppRoute((builder) => builder..route = Routes.onboarding),
    );
    api.actions.login.getUserInfo();
    PushService().init();
  } else {
    api.actions.navigation.showDialog(DialogBundle((builder) => builder
      ..dialog = Dialogs.alert
      ..bundle = loginResponse.message));
  }
}

void _setUserInfoResponse(MiddlewareApi<AppState, AppStateBuilder, AppActions> api, ActionHandler next, Action<UserInfoResponse> action) async {
  next(action);

  final userInfoResponse = action.payload;

  if (userInfoResponse.status == _success) {
    api.actions.login.setUserInfo(userInfoResponse.userInfo);
  }
}

void _logout(MiddlewareApi<AppState, AppStateBuilder, AppActions> api, ActionHandler next, Action<void> action) async {
  next(action);

  api.actions.navigation.routeTo(AppRoute((builder) => builder.route = Routes.login));
}
