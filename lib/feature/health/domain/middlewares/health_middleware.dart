import 'package:built_redux/built_redux.dart';
import 'package:flutter/foundation.dart';

import 'package:turbostart/domain/domain.dart';
import 'package:health/health.dart';
import 'package:turbostart/domain/models/steps.dart';
import 'package:turbostart/feature/health/domain/health_actions.dart';
import 'package:turbostart/feature/health/health.dart';
import 'package:turbostart/feature/logger/logger.dart';
import 'package:intl/intl.dart';

MiddlewareBuilder<AppState, AppStateBuilder, AppActions> healthMiddleware() {
  return MiddlewareBuilder<AppState, AppStateBuilder, AppActions>()..add(HealthActionsNames.getLocalStepsAndSend, _getLocalStepsAndSend);
}

void _getLocalStepsAndSend(MiddlewareApi<AppState, AppStateBuilder, AppActions> api, ActionHandler next, Action<void> action) {
  next(action);
  List<HealthDataType> types = [
    HealthDataType.STEPS,
  ];
  DateTime today = DateTime.now();
  DateTime twoWeekAgo = today.subtract(new Duration(days: 14));
  _getData(twoWeekAgo, today).then((healthData) {
    compute(calculateStepsByDays, _BundleData(startDate: twoWeekAgo, endDate: today, healthData: healthData)).then(
      (stepsList) {
        if (healthData != null) {
          final request = SendStepsRequest((builder) => builder.data.replace(stepsList));
          api.actions.health.sendSteps(request);
        }
      },
    );
  });
}

List<Steps> calculateStepsByDays(_BundleData data) {
  List<Steps> stepsList = [];
  final endDate = data.endDate;
  final healthData = data.healthData;
  final startDate = data.startDate;
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
    stepsList.add(steps);
  }
  return stepsList;
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

void _onError(error) => logger.e("Health Error: $error");

class _BundleData {
  _BundleData({this.startDate, this.endDate, this.healthData});
  final DateTime startDate;
  final DateTime endDate;
  final List<HealthDataPoint> healthData;
}
