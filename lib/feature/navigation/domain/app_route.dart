import 'package:built_value/built_value.dart';
import 'package:flutter/widgets.dart' show BuildContext, NavigatorState;

part 'app_route.g.dart';

abstract class AppRoute implements Built<AppRoute, AppRouteBuilder> {
  AppRoute._();

  factory AppRoute([updates(AppRouteBuilder buider)]) = _$AppRoute;

  String get route;

  @nullable
  String get payload;

  @nullable
  String get screenTitle;

  @BuiltValueField(serialize: false)
  @nullable
  BuildContext get context;

  @BuiltValueField(serialize: false)
  @nullable
  NavigatorState get navigatorState;

  @BuiltValueField(serialize: false)
  @nullable
  Object get bundle;
}
