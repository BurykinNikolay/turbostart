import 'package:built_redux/built_redux.dart';
import 'package:turbostart/feature/navigation/navigation.dart';

import '../domain.dart';

final List<void Function(Action<dynamic>) Function(void Function(Action<dynamic>)) Function(MiddlewareApi<AppState, AppStateBuilder, AppActions>)> middlewares = [
  navigationMiddleware().build(),
  dialogMiddleware().build(),
  bottomSheetMiddleware().build()
];
