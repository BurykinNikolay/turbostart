import 'package:built_redux/built_redux.dart';
import 'package:turbostart/domain/domain.dart';
import 'package:turbostart/feature/pedometer/pedometer.dart';

NestedReducerBuilder<AppState, AppStateBuilder, PedometerState, PedometerStateBuilder> createPedometerStateReducer() {
  return NestedReducerBuilder<AppState, AppStateBuilder, PedometerState, PedometerStateBuilder>(
    (state) => state.pedometerState,
    (builder) => builder.pedometerState,
  )
    ..add(PedometerActionsNames.setPedometerType, _setPedometerType)
    ..add(PedometerActionsNames.setTimePeriodType, _setTimePeriodType);
}

void _setPedometerType(
  PedometerState state,
  Action<PedometerTypes> action,
  PedometerStateBuilder builder,
) =>
    builder.pedometerType = action.payload;

void _setTimePeriodType(
  PedometerState state,
  Action<TimePeriodTypes> action,
  PedometerStateBuilder builder,
) =>
    builder.timePeriod = action.payload;
