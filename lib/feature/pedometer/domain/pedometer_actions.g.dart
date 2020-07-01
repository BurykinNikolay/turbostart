// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedometer_actions.dart';

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides
// ignore_for_file: overridden_fields

class _$PedometerActions extends PedometerActions {
  factory _$PedometerActions() => new _$PedometerActions._();
  _$PedometerActions._() : super._();

  final setPedometerType =
      new ActionDispatcher<PedometerTypes>('PedometerActions-setPedometerType');
  final setTimePeriodType = new ActionDispatcher<TimePeriodTypes>(
      'PedometerActions-setTimePeriodType');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    setPedometerType.setDispatcher(dispatcher);
    setTimePeriodType.setDispatcher(dispatcher);
  }
}

class PedometerActionsNames {
  static final setPedometerType =
      new ActionName<PedometerTypes>('PedometerActions-setPedometerType');
  static final setTimePeriodType =
      new ActionName<TimePeriodTypes>('PedometerActions-setTimePeriodType');
}
