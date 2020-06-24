import 'package:built_redux/built_redux.dart';
import 'package:turbostart/domain/domain.dart';

import 'package:flutter/material.dart' hide Action;
import 'package:turbostart/feature/auth/auth.dart';
import 'package:turbostart/ui_library/bottom_sheet.dart';

import '../../navigation.dart';

//ignore_for_file: unawaited_futures

MiddlewareBuilder<AppState, AppStateBuilder, AppActions> bottomSheetMiddleware() {
  return MiddlewareBuilder<AppState, AppStateBuilder, AppActions>()..add(NavigationActionsNames.showBottomSheet, _showBottomSheet);
}

//NavigatorState get navigator => ;

void _showBottomSheet(MiddlewareApi<AppState, AppStateBuilder, AppActions> api, ActionHandler next, Action<BottomSheetBundle> action) async {
  next(action);
  final payload = action.payload;
  final rootNavigator = api.state.navigationState.rootNavigatorKey.currentState;

  switch (payload.bottomSheet) {
    case BottomSheets.auth:
      await rootNavigator.push(
        BottomSheetRoute(
          settings: RouteSettings(name: payload.bottomSheet),
          builder: (BuildContext context) {
            return TurboBottomSheet(body: AuthSheet());
          },
        ),
      );
      break;

    case BottomSheets.register:
      await rootNavigator.push(
        BottomSheetRoute(
          settings: RouteSettings(name: payload.bottomSheet),
          builder: (BuildContext context) {
            return TurboBottomSheet(body: RegisterSheet());
          },
        ),
      );
      break;

    default:
      break;
  }
}
