import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';

import 'package:turbostart/domain/domain.dart';
import 'package:health/health.dart';
import 'package:turbostart/domain/models/steps.dart';
import 'package:turbostart/feature/health/domain/health_actions.dart';
import 'package:turbostart/feature/health/health.dart';
import 'package:turbostart/feature/logger/logger.dart';
import 'package:intl/intl.dart';

MiddlewareBuilder<AppState, AppStateBuilder, AppActions> healthMiddleware() {
  return MiddlewareBuilder<AppState, AppStateBuilder, AppActions>()
    ..add(HealthActionsNames.getStepsForAllTime, _getStepsForAllTime)
    ..add(HealthActionsNames.getStepsForCurrentDay, _getStepsForCurrentDay)
    ..add(HealthActionsNames.setSteps, _setSteps)
    ..add(HealthActionsNames.getStepsForLastTwoWeek, _getStepsForLastTwoWeek);
}

void _getStepsForAllTime(MiddlewareApi<AppState, AppStateBuilder, AppActions> api, ActionHandler next, Action<void> action) async {
  next(action);

  List<HealthDataType> types = [
    HealthDataType.STEPS,
  ];

  DateTime startDate = DateTime.utc(2020, 04, 01);
  DateTime endDate = DateTime.now();

  List<HealthDataPoint> healthData = await _getData(startDate, endDate);

  if (healthData != null) {
    final date = DateTime.fromMillisecondsSinceEpoch(healthData.first.dateFrom).toIso8601String();
  }
}

void _getStepsForLastTwoWeek(MiddlewareApi<AppState, AppStateBuilder, AppActions> api, ActionHandler next, Action<void> action) async {
  next(action);
  List<HealthDataType> types = [
    HealthDataType.STEPS,
  ];
  DateTime today = DateTime.now();
  DateTime twoWeekAgo = today.subtract(new Duration(days: 14));
  List<HealthDataPoint> healthData = await _getData(twoWeekAgo, today);

  if (healthData != null) {
    List<Steps> stepsList = calculateStepsByDays(twoWeekAgo, today, healthData);
    api.actions.health.setSteps(
      BuiltList<Steps>.from(stepsList),
    );
  }
}

List<Steps> calculateStepsByDays(DateTime startDate, DateTime endDate, List<HealthDataPoint> healthData) {
  List<Steps> stepsList = [];
  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    final checkDay = endDate.subtract(new Duration(days: i));
    final datasFromCheckDay = healthData.where((data) {
      final dataDate = (DateFormat.yMd().format(DateTime.fromMillisecondsSinceEpoch(data.dateFrom)));
      final checkDate = DateFormat.yMd().format(checkDay);
      return checkDate == dataDate;
    });
    int countOfSteps = 0;
    datasFromCheckDay.forEach((data) {
      countOfSteps = countOfSteps + data.value.toInt();
    });
    final steps = Steps((builder) => builder
      ..date = checkDay.millisecondsSinceEpoch
      ..steps = countOfSteps);
    //logger.i("${DateTime.fromMillisecondsSinceEpoch(steps.date)} ${steps.steps}");
    stepsList.add(steps);
  }
  return stepsList;
}

void _getStepsForCurrentDay(MiddlewareApi<AppState, AppStateBuilder, AppActions> api, ActionHandler next, Action<void> action) async {
  next(action);
  List<HealthDataType> types = [
    HealthDataType.STEPS,
  ];

  DateTime today = new DateTime.now();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  List<HealthDataPoint> healthData = await _getData(startDate, endDate);

  if (healthData != null) {}
}

Future<List<HealthDataPoint>> _getData(DateTime startDate, DateTime endDate) async {
  bool isAuthorized = await Health.requestAuthorization();
  if (isAuthorized) {
    try {
      List<HealthDataPoint> healthData = await Health.getHealthDataFromType(startDate, endDate, HealthDataType.STEPS);
      return healthData;
    } catch (exception) {
      _onError(exception);
      return null;
    }
  } else {
    return null;
  }
}

void _setSteps(MiddlewareApi<AppState, AppStateBuilder, AppActions> api, ActionHandler next, Action<BuiltList<Steps>> action) async {
  next(action);

  final request = SendStepsRequest((builder) => builder.data.replace(action.payload));
  api.actions.health.sendSteps(request);
}

void _onError(error) => logger.e("Health Error: $error");
