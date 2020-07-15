import 'dart:async';

import 'package:turbostart/domain/domain.dart';
import 'package:turbostart/presentation/base/base_bloc.dart';

import 'package:intl/intl.dart';

import '../pedometer.dart';

class PedometerScreenBloc extends BaseBloc {
  StepsState get stepsState => store?.state?.stepsState;

  PedometerState get pedometerState => store?.state?.pedometerState;

  TimePeriodTypes get timePeriodTypes => pedometerState?.timePeriod;

  PedometerTypes get pedometerType => pedometerState?.pedometerType;

  int cupertinoTabBarValueGetter() => pedometerType == PedometerTypes.iam ? 0 : 1;

  StreamController<ChartModel> chartModelStreamController;

  StreamController<StepsState> stepsStateStreamController;

  StreamSubscription<PedometerState> _pedometerStateSubscription;

  StreamController<PedometerState> pedometerStateStreamController;

  StreamSubscription _stepsStateSubscription;

  StreamSubscription pedometerTypeSubscription;
  StreamSubscription timePerionTypeSubscription;

  @override
  void init() {
    super.init();
    stepsStateStreamController = StreamController<StepsState>.broadcast();

    pedometerStateStreamController = StreamController<PedometerState>.broadcast();

    chartModelStreamController = StreamController<ChartModel>.broadcast();

    _stepsStateSubscription = store.nextSubstate((AppState state) => state.stepsState).listen((_) async {
      _sinkPedometerState();
      _sinkStepsState();
      _sinkChartModel();
    });

    _pedometerStateSubscription = store.nextSubstate((AppState state) => state.pedometerState).listen((_) async {
      _sinkPedometerState();
      _sinkStepsState();
    });

    pedometerTypeSubscription = store.nextSubstate((AppState state) => state.pedometerState.pedometerType).listen((_) async {
      _sinkChartModel();
    });

    timePerionTypeSubscription = store.nextSubstate((AppState state) => state.pedometerState.timePeriod).listen((_) async {
      _sinkChartModel();
    });

    _sinkChartModel();
    _sinkPedometerState();
    _sinkStepsState();
  }

  @override
  void dispose() {
    super.dispose();
    stepsStateStreamController?.close();
    pedometerStateStreamController?.close();
    chartModelStreamController?.close();

    pedometerTypeSubscription?.cancel();
    timePerionTypeSubscription?.cancel();
    _pedometerStateSubscription?.cancel();
    _stepsStateSubscription?.cancel();
  }

  void _sinkStepsState() {
    stepsStateStreamController.add((stepsState));
  }

  void _sinkPedometerState() {
    pedometerStateStreamController.add(pedometerState);
  }

  void setPedometerType(int index) {
    actions.pedometer.setPedometerType(PedometerTypes.fromIndex(index));
  }

  void setTimePeriodType(TimePeriodTypes type) {
    actions.pedometer.setTimePeriodType(type);
  }

  void _sinkChartModel() {
    chartModelStreamController.add(generateChartModel());
  }

  ChartModel generateChartModel() {
    List<StepsData> stepsData;
    DateFormat dateFormat;
    double interval;
    switch (pedometerType) {
      case PedometerTypes.iam:
        stepsData = stepsState?.stepsUserData?.reversed?.toList() ?? <StepsData>[];
        break;
      case PedometerTypes.macroregion:
        stepsData = stepsState.stepsMacroregionData.reversed.toList() ?? <StepsData>[];
        break;
    }
    switch (timePeriodTypes) {
      case TimePeriodTypes.week:
        if (stepsData.length > 8) {
          stepsData = stepsData.getRange(0, 8).toList();
          interval = 1.0;
        }
        dateFormat = DateFormat(DateFormat.ABBR_WEEKDAY);
        break;
      case TimePeriodTypes.month:
        if (stepsData.length > 30) {
          stepsData = stepsData.getRange(0, 30).toList();
        }
        dateFormat = DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY);
        break;
      case TimePeriodTypes.allTime:
        dateFormat = DateFormat.yMd();
        break;
    }
    return ChartModel(dateFormat, stepsData, interval);
  }
}

// void _getLocalStepsAndSend(MiddlewareApi<AppState, AppStateBuilder, AppActions> api, ActionHandler next, Action<void> action) {
//   next(action);
//   List<HealthDataType> types = [
//     HealthDataType.STEPS,
//   ];
//   DateTime today = DateTime.now();
//   DateTime twoWeekAgo = today.subtract(new Duration(days: 14));
//   _getData(twoWeekAgo, today).then((healthData) {
//     compute(calculateStepsByDays, _BundleData(startDate: twoWeekAgo, endDate: today, healthData: healthData)).then(
//       (stepsList) {
//         if (healthData != null) {
//           final request = SendStepsRequest((builder) => builder.data.replace(stepsList));
//           api.actions.health.sendSteps(request);
//         }
//       },
//     );
//   });
// }

// List<Steps> calculateStepsByDays(_BundleData data) {
//   List<Steps> stepsList = [];
//   final endDate = data.endDate;
//   final healthData = data.healthData;
//   final startDate = data.startDate;
//   for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
//     final checkDay = endDate.subtract(new Duration(days: i));
//     final datasFromCheckDay = healthData.where((data) {
//       final dataDate = (DateFormat.yMd().format(DateTime.fromMillisecondsSinceEpoch(data.dateFrom)));
//       final checkDate = DateFormat.yMd().format(checkDay);
//       return checkDate == dataDate;
//     });
//     int countOfSteps = 0;
//     datasFromCheckDay.forEach((data) {
//       countOfSteps = countOfSteps + data.value.toInt();
//     });
//     final steps = Steps((builder) => builder
//       ..date = checkDay.millisecondsSinceEpoch
//       ..steps = countOfSteps);
//     stepsList.add(steps);
//   }
//   return stepsList;
// }

class ChartModel {
  final DateFormat dateFormat;
  final List<StepsData> stepsData;
  final double interval;

  ChartModel(this.dateFormat, this.stepsData, this.interval);
}
