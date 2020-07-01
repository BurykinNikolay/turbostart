// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_period_types.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const TimePeriodTypes _$week = const TimePeriodTypes._('week');
const TimePeriodTypes _$month = const TimePeriodTypes._('month');
const TimePeriodTypes _$allTime = const TimePeriodTypes._('allTime');

TimePeriodTypes _$timePeriodTypesValueOf(String name) {
  switch (name) {
    case 'week':
      return _$week;
    case 'month':
      return _$month;
    case 'allTime':
      return _$allTime;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<TimePeriodTypes> _$timePeriodTypesValues =
    new BuiltSet<TimePeriodTypes>(const <TimePeriodTypes>[
  _$week,
  _$month,
  _$allTime,
]);

Serializer<TimePeriodTypes> _$timePeriodTypesSerializer =
    new _$TimePeriodTypesSerializer();

class _$TimePeriodTypesSerializer
    implements PrimitiveSerializer<TimePeriodTypes> {
  @override
  final Iterable<Type> types = const <Type>[TimePeriodTypes];
  @override
  final String wireName = 'TimePeriodTypes';

  @override
  Object serialize(Serializers serializers, TimePeriodTypes object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  TimePeriodTypes deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      TimePeriodTypes.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
