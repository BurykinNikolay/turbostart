import 'package:built_redux/built_redux.dart';
import 'package:turbostart/domain/domain.dart';

import 'health_state.dart';

NestedReducerBuilder<AppState, AppStateBuilder, HealthState, HealthStateBuilder> createHealthStateReducer() {
  return NestedReducerBuilder<AppState, AppStateBuilder, HealthState, HealthStateBuilder>(
    (state) => state.healthState,
    (builder) => builder.healthState,
  );
}
