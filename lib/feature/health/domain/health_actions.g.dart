// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_actions.dart';

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides
// ignore_for_file: overridden_fields

class _$HealthActions extends HealthActions {
  factory _$HealthActions() => new _$HealthActions._();
  _$HealthActions._() : super._();

  final getStepsForAllTime =
      new ActionDispatcher<void>('HealthActions-getStepsForAllTime');
  final getStepsForCurrentDay =
      new ActionDispatcher<void>('HealthActions-getStepsForCurrentDay');
  final getStepsForLastTwoWeek =
      new ActionDispatcher<void>('HealthActions-getStepsForLastTwoWeek');
  final setSteps =
      new ActionDispatcher<BuiltList<Steps>>('HealthActions-setSteps');
  final sendSteps =
      new ActionDispatcher<SendStepsRequest>('HealthActions-sendSteps');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    getStepsForAllTime.setDispatcher(dispatcher);
    getStepsForCurrentDay.setDispatcher(dispatcher);
    getStepsForLastTwoWeek.setDispatcher(dispatcher);
    setSteps.setDispatcher(dispatcher);
    sendSteps.setDispatcher(dispatcher);
  }
}

class HealthActionsNames {
  static final getStepsForAllTime =
      new ActionName<void>('HealthActions-getStepsForAllTime');
  static final getStepsForCurrentDay =
      new ActionName<void>('HealthActions-getStepsForCurrentDay');
  static final getStepsForLastTwoWeek =
      new ActionName<void>('HealthActions-getStepsForLastTwoWeek');
  static final setSteps =
      new ActionName<BuiltList<Steps>>('HealthActions-setSteps');
  static final sendSteps =
      new ActionName<SendStepsRequest>('HealthActions-sendSteps');
}
