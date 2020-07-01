import 'dart:async';

import 'package:turbostart/domain/domain.dart';
import 'package:turbostart/presentation/base/base_bloc.dart';

class PedometerScreenBloc extends BaseBloc {
  StepsState get stepsState => store?.state?.stepsState;

  StreamController<StepsState> stepsStateStreamController;

  StreamSubscription _stepsStateSubscription;

  @override
  void init() {
    super.init();
    stepsStateStreamController = StreamController<StepsState>.broadcast();
    _stepsStateSubscription = store.nextSubstate((AppState state) => state.healthState.steps).listen((_) async {
      _sinkStepsCountInfo();
    });
    _sinkStepsCountInfo();
  }

  @override
  void dispose() {
    super.dispose();
    stepsStateStreamController?.close();
    _stepsStateSubscription?.cancel();
  }

  void _sinkStepsCountInfo() {
    stepsStateStreamController.add((stepsState));
  }
}
