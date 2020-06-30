import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';
import 'package:turbostart/domain/models/steps.dart';
import 'package:turbostart/feature/health/health.dart';

part 'health_actions.g.dart';

abstract class HealthActions extends ReduxActions {
  HealthActions._();

  factory HealthActions() = _$HealthActions;

  ActionDispatcher<void> get getStepsForAllTime;
  ActionDispatcher<void> get getStepsForCurrentDay;
  ActionDispatcher<void> get getStepsForLastTwoWeek;
  ActionDispatcher<BuiltList<Steps>> get setSteps;
  ActionDispatcher<SendStepsRequest> get sendSteps;
}
