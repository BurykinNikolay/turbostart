// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_actions.dart';

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides
// ignore_for_file: overridden_fields

class _$NavigationActions extends NavigationActions {
  factory _$NavigationActions() => new _$NavigationActions._();
  _$NavigationActions._() : super._();

  final routeTo = new ActionDispatcher<AppRoute>('NavigationActions-routeTo');
  final showDialog =
      new ActionDispatcher<DialogBundle>('NavigationActions-showDialog');
  final showBottomSheet = new ActionDispatcher<BottomSheetBundle>(
      'NavigationActions-showBottomSheet');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    routeTo.setDispatcher(dispatcher);
    showDialog.setDispatcher(dispatcher);
    showBottomSheet.setDispatcher(dispatcher);
  }
}

class NavigationActionsNames {
  static final routeTo = new ActionName<AppRoute>('NavigationActions-routeTo');
  static final showDialog =
      new ActionName<DialogBundle>('NavigationActions-showDialog');
  static final showBottomSheet =
      new ActionName<BottomSheetBundle>('NavigationActions-showBottomSheet');
}
