import 'package:built_redux/built_redux.dart';
import 'package:turbostart/domain/domain.dart';
import 'package:turbostart/feature/health/health.dart';

part 'health_actions.g.dart';

abstract class HealthActions extends ReduxActions {
  HealthActions._();

  factory HealthActions() = _$HealthActions;

  ActionDispatcher<void> get getStepsForAllTime;
  ActionDispatcher<void> get getStepsForCurrentDay;
  ActionDispatcher<void> get getLocalStepsAndSend;
  ActionDispatcher<StepsState> get setStepsState;
  ActionDispatcher<SendStepsRequest> get sendSteps;
  ActionDispatcher<void> get getSteps;
}
