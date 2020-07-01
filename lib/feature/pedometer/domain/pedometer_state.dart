import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:turbostart/feature/pedometer/pedometer.dart';

import 'time_period_types.dart';

part 'pedometer_state.g.dart';

abstract class PedometerState implements Built<PedometerState, PedometerStateBuilder> {
  PedometerState._();

  factory PedometerState([Function(PedometerStateBuilder builder) updates]) {
    return _$PedometerState(
      (builder) => builder
        ..timePeriod = TimePeriodTypes.week
        ..pedometerType = PedometerTypes.iam
        ..update(updates),
    );
  }

  @nullable
  TimePeriodTypes get timePeriod;
  @nullable
  PedometerTypes get pedometerType;

  static Serializer<PedometerState> get serializer => _$pedometerStateSerializer;
}
