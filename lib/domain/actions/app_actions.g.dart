// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_actions.dart';

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides
// ignore_for_file: overridden_fields

class _$AppActions extends AppActions {
  factory _$AppActions() => new _$AppActions._();
  _$AppActions._() : super._();

  final updateTab = new ActionDispatcher<AppTab>('AppActions-updateTab');

  final navigation = new NavigationActions();
  final login = new LoginActions();
  final health = new HealthActions();
  final pedometer = new PedometerActions();

  @override
  void setDispatcher(Dispatcher dispatcher) {
    updateTab.setDispatcher(dispatcher);

    navigation.setDispatcher(dispatcher);
    login.setDispatcher(dispatcher);
    health.setDispatcher(dispatcher);
    pedometer.setDispatcher(dispatcher);
  }
}

class AppActionsNames {
  static final updateTab = new ActionName<AppTab>('AppActions-updateTab');
}
