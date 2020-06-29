// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_actions.dart';

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides
// ignore_for_file: overridden_fields

class _$LoginActions extends LoginActions {
  factory _$LoginActions() => new _$LoginActions._();
  _$LoginActions._() : super._();

  final loginRequest =
      new ActionDispatcher<LoginRequest>('LoginActions-loginRequest');
  final setRememberStatus =
      new ActionDispatcher<bool>('LoginActions-setRememberStatus');
  final setLoginError =
      new ActionDispatcher<ErrorModel>('LoginActions-setLoginError');
  final setLoginResponse =
      new ActionDispatcher<LoginResponse>('LoginActions-setLoginResponse');
  final setUserInfoResponse = new ActionDispatcher<UserInfoResponse>(
      'LoginActions-setUserInfoResponse');
  final setLoginCredentials =
      new ActionDispatcher<String>('LoginActions-setLoginCredentials');
  final setLoginScreenStatus = new ActionDispatcher<LoginScreenStatus>(
      'LoginActions-setLoginScreenStatus');
  final getUserInfo = new ActionDispatcher<void>('LoginActions-getUserInfo');
  final setUserInfo =
      new ActionDispatcher<UserInfo>('LoginActions-setUserInfo');
  final logout = new ActionDispatcher<void>('LoginActions-logout');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    loginRequest.setDispatcher(dispatcher);
    setRememberStatus.setDispatcher(dispatcher);
    setLoginError.setDispatcher(dispatcher);
    setLoginResponse.setDispatcher(dispatcher);
    setUserInfoResponse.setDispatcher(dispatcher);
    setLoginCredentials.setDispatcher(dispatcher);
    setLoginScreenStatus.setDispatcher(dispatcher);
    getUserInfo.setDispatcher(dispatcher);
    setUserInfo.setDispatcher(dispatcher);
    logout.setDispatcher(dispatcher);
  }
}

class LoginActionsNames {
  static final loginRequest =
      new ActionName<LoginRequest>('LoginActions-loginRequest');
  static final setRememberStatus =
      new ActionName<bool>('LoginActions-setRememberStatus');
  static final setLoginError =
      new ActionName<ErrorModel>('LoginActions-setLoginError');
  static final setLoginResponse =
      new ActionName<LoginResponse>('LoginActions-setLoginResponse');
  static final setUserInfoResponse =
      new ActionName<UserInfoResponse>('LoginActions-setUserInfoResponse');
  static final setLoginCredentials =
      new ActionName<String>('LoginActions-setLoginCredentials');
  static final setLoginScreenStatus =
      new ActionName<LoginScreenStatus>('LoginActions-setLoginScreenStatus');
  static final getUserInfo = new ActionName<void>('LoginActions-getUserInfo');
  static final setUserInfo =
      new ActionName<UserInfo>('LoginActions-setUserInfo');
  static final logout = new ActionName<void>('LoginActions-logout');
}
