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
  final getLocalStepsAndSend =
      new ActionDispatcher<void>('HealthActions-getLocalStepsAndSend');
  final setStepsState =
      new ActionDispatcher<StepsState>('HealthActions-setStepsState');
  final sendSteps =
      new ActionDispatcher<SendStepsRequest>('HealthActions-sendSteps');
  final getSteps = new ActionDispatcher<void>('HealthActions-getSteps');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    getStepsForAllTime.setDispatcher(dispatcher);
    getStepsForCurrentDay.setDispatcher(dispatcher);
    getLocalStepsAndSend.setDispatcher(dispatcher);
    setStepsState.setDispatcher(dispatcher);
    sendSteps.setDispatcher(dispatcher);
    getSteps.setDispatcher(dispatcher);
  }
}

class HealthActionsNames {
  static final getStepsForAllTime =
      new ActionName<void>('HealthActions-getStepsForAllTime');
  static final getStepsForCurrentDay =
      new ActionName<void>('HealthActions-getStepsForCurrentDay');
  static final getLocalStepsAndSend =
      new ActionName<void>('HealthActions-getLocalStepsAndSend');
  static final setStepsState =
      new ActionName<StepsState>('HealthActions-setStepsState');
  static final sendSteps =
      new ActionName<SendStepsRequest>('HealthActions-sendSteps');
  static final getSteps = new ActionName<void>('HealthActions-getSteps');
}
