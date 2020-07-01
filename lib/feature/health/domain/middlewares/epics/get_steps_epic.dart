import 'dart:async';

import 'package:built_redux/built_redux.dart';
import 'package:dioc/dioc.dart';
import 'package:turbostart/feature/health/health.dart';
import 'package:turbostart/feature/logger/logger.dart';
import 'package:rxdart/rxdart.dart';

import 'package:turbostart/domain/domain.dart';

class GetStepsEpic {
  GetStepsEpic(this._repository);

  @Inject(mode: InjectMode.singleton)
  final HealthRepository _repository;

  Stream getStepsEpic(Stream<Action<dynamic>> stream, MiddlewareApi<AppState, AppStateBuilder, AppActions> api) {
    return stream.where((action) => action.name == HealthActionsNames.getSteps.name).cast<Action<void>>().switchMap((action) {
      return _repository.getSteps(
        timeout: Duration(seconds: 20),
      );
    }).doOnData((sendStepsResponse) {
      logger.i("SendStepsStatus: ${sendStepsResponse.status}");
      if (sendStepsResponse.status == "success") {
        api.actions.health.setStepsState(sendStepsResponse.data);
      }
    }).handleError((exception) {
      logger.e('SendStepsStatus: $exception');
    });
  }
}
