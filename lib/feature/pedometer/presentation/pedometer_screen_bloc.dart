import 'dart:async';
import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:turbostart/domain/domain.dart';
import 'package:turbostart/domain/models/steps.dart';
import 'package:turbostart/feature/health/domain/health_state.dart';
import 'package:turbostart/presentation/base/base_bloc.dart';

class PedometerScreenBloc extends BaseBloc {
  int get countOfTodaySteps => healthState.steps?.first?.steps ?? 0;

  Steps get todaySteps => healthState.steps?.first;

  List<Steps> get lastWeekSteps => steps?.getRange(0, DateTime.now().weekday)?.toList() ?? <Steps>[];

  HealthState get healthState => store?.state?.healthState;

  BuiltList<Steps> get steps => healthState?.steps;

  StreamController<BuiltList<Steps>> stepsStreamController;

  StreamSubscription _stepsSubscription;

  @override
  void init() {
    super.init();
    stepsStreamController = StreamController<BuiltList<Steps>>.broadcast();
    _stepsSubscription = store.nextSubstate((AppState state) => state.healthState.steps).listen((_) async {
      _sinkStepsCountInfo();
    });
    _sinkStepsCountInfo();
  }

  @override
  void dispose() {
    super.dispose();
    stepsStreamController?.close();
    _stepsSubscription?.cancel();
  }

  void _sinkStepsCountInfo() {
    stepsStreamController.add((steps));
  }

  List<Point> getChartData() {
    List<Point> chartData = <Point>[];
    final reverse = lastWeekSteps.reversed.toList();
    reverse.forEach((steps) {
      chartData.add(Point(steps.steps, DateTime.fromMillisecondsSinceEpoch(steps.date).weekday));
    });

    return chartData;
  }
}
