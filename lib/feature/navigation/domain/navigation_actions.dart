import 'package:built_redux/built_redux.dart';

import 'app_route.dart';
import 'bottom_sheet_bundle.dart';
import 'dialog_bundle.dart';

part 'navigation_actions.g.dart';

abstract class NavigationActions extends ReduxActions {
  NavigationActions._();

  factory NavigationActions() = _$NavigationActions;

  ActionDispatcher<AppRoute> get routeTo;
  ActionDispatcher<DialogBundle> get showDialog;
  ActionDispatcher<BottomSheetBundle> get showBottomSheet;
}
