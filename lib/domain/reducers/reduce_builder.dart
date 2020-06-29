import 'package:built_redux/built_redux.dart';
import 'package:turbostart/domain/reducers/user_reducer.dart';
import 'package:turbostart/feature/auth/domain/login_reducer.dart';

import '../domain.dart';

final reducerBuilder = ReducerBuilder<AppState, AppStateBuilder>()
  ..combineNested(createAppStateReducer())
  ..combineNested(createLoginReducer())
  ..combineNested(createUserStateReducer());
final reducers = reducerBuilder.build();
