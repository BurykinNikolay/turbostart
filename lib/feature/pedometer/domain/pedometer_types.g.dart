// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedometer_types.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PedometerTypes _$iam = const PedometerTypes._('iam');
const PedometerTypes _$macroregion = const PedometerTypes._('macroregion');

PedometerTypes _$pedometerTypesValueOf(String name) {
  switch (name) {
    case 'iam':
      return _$iam;
    case 'macroregion':
      return _$macroregion;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<PedometerTypes> _$pedometerTypesValues =
    new BuiltSet<PedometerTypes>(const <PedometerTypes>[
  _$iam,
  _$macroregion,
]);

Serializer<PedometerTypes> _$pedometerTypesSerializer =
    new _$PedometerTypesSerializer();

class _$PedometerTypesSerializer
    implements PrimitiveSerializer<PedometerTypes> {
  @override
  final Iterable<Type> types = const <Type>[PedometerTypes];
  @override
  final String wireName = 'PedometerTypes';

  @override
  Object serialize(Serializers serializers, PedometerTypes object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  PedometerTypes deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PedometerTypes.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
