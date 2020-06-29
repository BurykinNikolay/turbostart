library app_tab;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart';
import 'package:turbostart/other/turbostart_icons.dart';

part 'app_tab.g.dart';

class AppTab extends EnumClass {
  static const AppTab pedometer = _$pedometer;
  static const AppTab profile = _$profile;

  const AppTab._(String name) : super(name);

  static BuiltSet<AppTab> get values => _$appTabValues;

  static AppTab valueOf(String name) => _$appTabValueOf(name);

  static AppTab fromIndex(int index) {
    switch (index) {
      case 0:
        return AppTab.pedometer;
      case 1:
        return AppTab.profile;
      default:
        return AppTab.pedometer;
    }
  }

  static int toIndex(AppTab tab) {
    switch (tab) {
      case AppTab.pedometer:
        return 0;
      case AppTab.profile:
        return 1;
      default:
        return 0;
    }
  }

  static IconData activeIconByTab(AppTab tab) {
    switch (tab) {
      case AppTab.pedometer:
        return TurbostartIcons.pedometer;
      case AppTab.profile:
        return TurbostartIcons.profile;

      default:
        return null;
    }
  }

  static IconData passiveIconByTab(AppTab tab) {
    switch (tab) {
      case AppTab.pedometer:
        return TurbostartIcons.pedometer;
      case AppTab.profile:
        return TurbostartIcons.profile;
      default:
        return null;
    }
  }

  static Serializer<AppTab> get serializer => _$appTabSerializer;
}
