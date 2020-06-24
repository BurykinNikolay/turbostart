import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/widgets.dart' show NavigatorState, GlobalKey;

part 'navigation_state.g.dart';

abstract class NavigationState implements Built<NavigationState, NavigationStateBuilder> {
  NavigationState._();

  factory NavigationState([Function(NavigationStateBuilder builder) updates]) {
    return _$NavigationState(
      (builder) => builder
        ..rootNavigatorKey = GlobalKey<NavigatorState>()
        ..update(updates),
    );
  }

  @nullable
  @BuiltValueField(serialize: false)
  GlobalKey<NavigatorState> get rootNavigatorKey;

  static Serializer<NavigationState> get serializer => _$navigationStateSerializer;
}

//https://medium.com/flutter-community/creating-custom-built-value-serializers-with-builtvalueserializer-46a52c75d4c5
// class GlobalKeySerializer  implements StructuredSerializer<CustomValue> {}
