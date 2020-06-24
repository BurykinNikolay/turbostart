import 'package:built_value/built_value.dart';
import 'package:turbostart/feature/navigation/navigation.dart';

import '../domain.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  AppState._();

  factory AppState([updates(AppStateBuilder builder)]) {
    return _$AppState((builder) => builder
      ..activeTab = AppTab.about
      ..appTheme = AppTheme.light
      ..navigationState = NavigationState((builder) => builder).toBuilder()
      ..update(updates));
  }

  AppTab get activeTab;

  NavigationState get navigationState;

  AppTheme get appTheme;
}
