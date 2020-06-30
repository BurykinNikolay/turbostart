import 'package:built_redux/built_redux.dart';
import 'package:turbostart/feature/auth/domain/login_actions.dart';
import 'package:turbostart/feature/health/health.dart';
import 'package:turbostart/feature/navigation/navigation.dart';

import '../domain.dart';

part 'app_actions.g.dart';

abstract class AppActions extends ReduxActions {
  AppActions._();

  factory AppActions() = _$AppActions;

  NavigationActions get navigation;

  LoginActions get login;

  HealthActions get health;

  ActionDispatcher<AppTab> get updateTab;
}
