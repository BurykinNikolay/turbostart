import 'dart:async';

import 'package:built_redux/built_redux.dart';
import 'package:dioc/dioc.dart';
import 'package:turbostart/feature/health/health.dart';
import 'package:turbostart/feature/logger/logger.dart';
import 'package:rxdart/rxdart.dart';

import 'package:turbostart/domain/domain.dart';

class SendStepsEpic {
  SendStepsEpic(this._repository);

  @Inject(mode: InjectMode.singleton)
  final HealthRepository _repository;

  Stream sendStepsEpic(Stream<Action<dynamic>> stream, MiddlewareApi<AppState, AppStateBuilder, AppActions> api) {
    return stream.where((action) => action.name == HealthActionsNames.sendSteps.name).cast<Action<SendStepsRequest>>().switchMap((action) {
      return _repository.sendSteps(
        request: action.payload,
        timeout: Duration(seconds: 20),
      );
    }).doOnData((sendStepsResponse) {
      logger.i("SendStepsStatus: ${sendStepsResponse.status}");
      api.actions.health.getSteps();
    }).handleError((exception) {
      logger.e('SendStepsStatus: $exception');
    });
  }
}
