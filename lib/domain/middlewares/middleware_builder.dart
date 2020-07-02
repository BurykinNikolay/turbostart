import 'package:built_redux/built_redux.dart';

import 'package:turbostart/feature/auth/domain/middleware/epics/login_epic.dart';
import 'package:turbostart/feature/auth/domain/middleware/login_middleware.dart';
import 'package:turbostart/feature/db/middleware/db_middleware.dart';
import 'package:turbostart/feature/navigation/navigation.dart';

import 'package:turbostart/feature/health/health.dart';

import 'package:turbostart/app_starter.dart' as starter;
import 'package:turbostart/packages/built_redux_rx.dart';

import '../domain.dart';

final _diContainer = starter.di;

final _loginEpic = _diContainer.singleton<LoginEpic>();
final _sendStepsEpic = _diContainer.singleton<SendStepsEpic>();
final _getStepsEpic = _diContainer.singleton<GetStepsEpic>();

final List<void Function(Action<dynamic>) Function(void Function(Action<dynamic>)) Function(MiddlewareApi<AppState, AppStateBuilder, AppActions>)> middlewares = [
  navigationMiddleware().build(),
  dialogMiddleware().build(),
  bottomSheetMiddleware().build(),
  loginMiddleware().build(),
  healthMiddleware().build(),
  dbMiddleware().build(),
  createEpicMiddleware([
    _loginEpic.loginEpic,
    _loginEpic.getUserInfo,
    _loginEpic.setPushToken,
    _sendStepsEpic.sendStepsEpic,
    _getStepsEpic.getStepsEpic,
  ])
];
