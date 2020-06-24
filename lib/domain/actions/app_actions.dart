import 'package:built_redux/built_redux.dart';
import 'package:turbostart/feature/navigation/navigation.dart';

import '../domain.dart';

part 'app_actions.g.dart';

abstract class AppActions extends ReduxActions {
  AppActions._();

  factory AppActions() = _$AppActions;

  NavigationActions get navigation;

  ActionDispatcher<AppTab> get updateTab;
  ActionDispatcher<AppTheme> get setAppTheme;
}
