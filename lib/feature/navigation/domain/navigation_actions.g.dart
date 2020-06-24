// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_actions.dart';

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides
// ignore_for_file: overridden_fields
// ignore_for_file: type_annotate_public_apis

class _$NavigationActions extends NavigationActions {
  factory _$NavigationActions() => _$NavigationActions._();
  _$NavigationActions._() : super._();

  final routeTo = ActionDispatcher<AppRoute>('NavigationActions-routeTo');
  final showDialog =
      ActionDispatcher<DialogBundle>('NavigationActions-showDialog');
  final showBottomSheet =
      ActionDispatcher<BottomSheetBundle>('NavigationActions-showBottomSheet');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    routeTo.setDispatcher(dispatcher);
    showDialog.setDispatcher(dispatcher);
    showBottomSheet.setDispatcher(dispatcher);
  }
}

class NavigationActionsNames {
  static final routeTo = ActionName<AppRoute>('NavigationActions-routeTo');
  static final showDialog =
      ActionName<DialogBundle>('NavigationActions-showDialog');
  static final showBottomSheet =
      ActionName<BottomSheetBundle>('NavigationActions-showBottomSheet');
}
