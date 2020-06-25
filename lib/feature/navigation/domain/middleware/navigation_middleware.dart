import 'package:built_redux/built_redux.dart';
import 'package:turbostart/domain/domain.dart';

import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import 'package:turbostart/feature/home/home.dart';
import 'package:turbostart/feature/onboarding/onboarding.dart';

import '../../navigation.dart';

//ignore_for_file: unawaited_futures

MiddlewareBuilder<AppState, AppStateBuilder, AppActions> navigationMiddleware() {
  return MiddlewareBuilder<AppState, AppStateBuilder, AppActions>()..add(NavigationActionsNames.routeTo, routeTo);
}

//NavigatorState get navigator => ;

void routeTo(MiddlewareApi<AppState, AppStateBuilder, AppActions> api, ActionHandler next, Action<AppRoute> action) async {
  next(action);
  final payload = action.payload;
  final rootNavigator = api.state.navigationState.rootNavigatorKey.currentState;

  switch (payload.route) {
    case Routes.home:
      await rootNavigator.pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) => HomeScreen(), settings: RouteSettings(name: Routes.home)),
        (route) {
          return false;
        },
      );
      break;
    case Routes.onboarding:
      await rootNavigator.pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) => OnboardingScreen(), settings: RouteSettings(name: Routes.onboarding)),
        (route) {
          return false;
        },
      );
      break;
    case Routes.pop:
      rootNavigator.maybePop();
      break;

    default:
      break;
  }
}
