import 'package:built_value/built_value.dart';
import 'package:turbostart/feature/auth/domain/login_state.dart';
import 'package:turbostart/feature/navigation/navigation.dart';

import '../domain.dart';
import 'user_state.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  AppState._();

  factory AppState([updates(AppStateBuilder builder)]) {
    return _$AppState((builder) => builder
      ..activeTab = AppTab.pedometer
      ..appTheme = AppTheme.light
      ..loginState = LoginState((builder) => builder).toBuilder()
      ..userState = UserState((builder) => builder).toBuilder()
      ..navigationState = NavigationState((builder) => builder).toBuilder()
      ..apiUrl = "xn--80ab3bgdedecc0h.xn--p1ai"
      ..update(updates));
  }

  AppTab get activeTab;

  NavigationState get navigationState;

  AppTheme get appTheme;

  LoginState get loginState;

  UserState get userState;

  @nullable
  String get apiUrl;
}
