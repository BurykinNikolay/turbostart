import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';
import 'package:turbostart/domain/domain.dart';
import 'package:turbostart/domain/models/steps.dart';
import 'package:turbostart/feature/health/domain/health_actions.dart';

import 'health_state.dart';

NestedReducerBuilder<AppState, AppStateBuilder, HealthState, HealthStateBuilder> createHealthStateReducer() {
  return NestedReducerBuilder<AppState, AppStateBuilder, HealthState, HealthStateBuilder>(
    (state) => state.healthState,
    (builder) => builder.healthState,
  )..add(HealthActionsNames.setSteps, _setSteps);
}

void _setSteps(
  HealthState state,
  Action<BuiltList<Steps>> action,
  HealthStateBuilder builder,
) =>
    builder.steps.replace(action.payload);
