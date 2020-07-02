import 'package:built_redux/built_redux.dart';

import 'package:turbostart/data/network/models/base_model.dart';
import 'package:turbostart/domain/models/user_info.dart';
import 'package:turbostart/feature/auth/repository/login_repository.dart';

import 'login_screen_status.dart';

part 'login_actions.g.dart';

abstract class LoginActions extends ReduxActions {
  LoginActions._();

  factory LoginActions() = _$LoginActions;

  ActionDispatcher<LoginRequest> get loginRequest;
  ActionDispatcher<bool> get setRememberStatus;

  ActionDispatcher<ErrorModel> get setLoginError;
  ActionDispatcher<LoginResponse> get setLoginResponse;
  ActionDispatcher<UserInfoResponse> get setUserInfoResponse;
  ActionDispatcher<String> get setLoginCredentials;
  ActionDispatcher<LoginScreenStatus> get setLoginScreenStatus;
  ActionDispatcher<void> get getUserInfo;
  ActionDispatcher<UserInfo> get setUserInfo;
  ActionDispatcher<void> get logout;
  ActionDispatcher<String> get setPushToken;
}
