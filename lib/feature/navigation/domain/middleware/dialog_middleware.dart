import 'package:built_redux/built_redux.dart';
import 'package:turbostart/domain/domain.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import 'package:turbostart/ui_library/library.dart';

import '../../navigation.dart';

//ignore_for_file: unawaited_futures

MiddlewareBuilder<AppState, AppStateBuilder, AppActions> dialogMiddleware() {
  return MiddlewareBuilder<AppState, AppStateBuilder, AppActions>()..add(NavigationActionsNames.showDialog, _showDialog);
}

void _showDialog(MiddlewareApi<AppState, AppStateBuilder, AppActions> api, ActionHandler next, Action<DialogBundle> action) async {
  next(action);
  final payload = action.payload;
  final rootNavigator = api.state.navigationState.rootNavigatorKey.currentState;

  switch (payload.dialog) {
    case Dialogs.alert:
      await rootNavigator.push(
        DialogRoute(
          pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
            return Builder(builder: (BuildContext context) {
              return TurboAlertDialog(content: payload.bundle);
            });
          },
        ),
      );
      break;
    default:
      break;
  }
}
