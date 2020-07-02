import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:turbostart/feature/auth/domain/login_state.dart';
import 'package:turbostart/feature/health/domain/health_state.dart';
import 'package:turbostart/feature/navigation/navigation.dart';
import 'package:turbostart/feature/pedometer/pedometer.dart';

import '../domain.dart';
import '../domain_serializer.dart';
import 'user_state.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  AppState._();

  factory AppState([updates(AppStateBuilder builder)]) {
    return _$AppState((builder) => builder
      ..activeTab = AppTab.pedometer
      ..loginState = LoginState((builder) => builder).toBuilder()
      ..userState = UserState((builder) => builder).toBuilder()
      ..navigationState = NavigationState((builder) => builder).toBuilder()
      ..healthState = HealthState((builder) => builder).toBuilder()
      ..pedometerState = PedometerState((builder) => builder).toBuilder()
      ..stepsState = StepsState((builder) => builder).toBuilder()
      ..apiUrl = "xn--80ab3bgdedecc0h.xn--p1ai"
      ..update(updates));
  }

  AppTab get activeTab;

  NavigationState get navigationState;

  LoginState get loginState;

  UserState get userState;

  HealthState get healthState;

  @nullable
  StepsState get stepsState;

  @nullable
  PedometerState get pedometerState;

  @nullable
  String get apiUrl;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AppState.serializer, this);
  }

  static AppState fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AppState.serializer, json);
  }

  static Serializer<AppState> get serializer => _$appStateSerializer;
}
