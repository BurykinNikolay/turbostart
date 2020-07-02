import 'package:built_redux/built_redux.dart';
import 'package:turbostart/domain/reducers/user_reducer.dart';
import 'package:turbostart/feature/auth/domain/login_reducer.dart';
import 'package:turbostart/feature/health/domain/health_reducer.dart';
import 'package:turbostart/feature/pedometer/domain/pedometer_reducer.dart';

import '../domain.dart';

final reducerBuilder = ReducerBuilder<AppState, AppStateBuilder>()
  ..combineNested(createAppStateReducer())
  ..combineNested(createLoginReducer())
  ..combineNested(createHealthStateReducer())
  ..combineNested(createUserStateReducer())
  ..combineNested(createPedometerStateReducer());
final reducers = reducerBuilder.build();
