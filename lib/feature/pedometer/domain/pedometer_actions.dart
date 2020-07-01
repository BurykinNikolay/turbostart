import 'package:built_redux/built_redux.dart';

import 'pedometer_types.dart';
import 'time_period_types.dart';

part 'pedometer_actions.g.dart';

abstract class PedometerActions extends ReduxActions {
  PedometerActions._();

  factory PedometerActions() = _$PedometerActions;

  ActionDispatcher<PedometerTypes> get setPedometerType;

  ActionDispatcher<TimePeriodTypes> get setTimePeriodType;
}
