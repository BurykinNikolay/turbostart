// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedometer_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PedometerState> _$pedometerStateSerializer =
    new _$PedometerStateSerializer();

class _$PedometerStateSerializer
    implements StructuredSerializer<PedometerState> {
  @override
  final Iterable<Type> types = const [PedometerState, _$PedometerState];
  @override
  final String wireName = 'PedometerState';

  @override
  Iterable<Object> serialize(Serializers serializers, PedometerState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.timePeriod != null) {
      result
        ..add('timePeriod')
        ..add(serializers.serialize(object.timePeriod,
            specifiedType: const FullType(TimePeriodTypes)));
    }
    if (object.pedometerType != null) {
      result
        ..add('pedometerType')
        ..add(serializers.serialize(object.pedometerType,
            specifiedType: const FullType(PedometerTypes)));
    }
    return result;
  }

  @override
  PedometerState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PedometerStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'timePeriod':
          result.timePeriod = serializers.deserialize(value,
                  specifiedType: const FullType(TimePeriodTypes))
              as TimePeriodTypes;
          break;
        case 'pedometerType':
          result.pedometerType = serializers.deserialize(value,
              specifiedType: const FullType(PedometerTypes)) as PedometerTypes;
          break;
      }
    }

    return result.build();
  }
}

class _$PedometerState extends PedometerState {
  @override
  final TimePeriodTypes timePeriod;
  @override
  final PedometerTypes pedometerType;

  factory _$PedometerState([void Function(PedometerStateBuilder) updates]) =>
      (new PedometerStateBuilder()..update(updates)).build();

  _$PedometerState._({this.timePeriod, this.pedometerType}) : super._();

  @override
  PedometerState rebuild(void Function(PedometerStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PedometerStateBuilder toBuilder() =>
      new PedometerStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PedometerState &&
        timePeriod == other.timePeriod &&
        pedometerType == other.pedometerType;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, timePeriod.hashCode), pedometerType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PedometerState')
          ..add('timePeriod', timePeriod)
          ..add('pedometerType', pedometerType))
        .toString();
  }
}

class PedometerStateBuilder
    implements Builder<PedometerState, PedometerStateBuilder> {
  _$PedometerState _$v;

  TimePeriodTypes _timePeriod;
  TimePeriodTypes get timePeriod => _$this._timePeriod;
  set timePeriod(TimePeriodTypes timePeriod) => _$this._timePeriod = timePeriod;

  PedometerTypes _pedometerType;
  PedometerTypes get pedometerType => _$this._pedometerType;
  set pedometerType(PedometerTypes pedometerType) =>
      _$this._pedometerType = pedometerType;

  PedometerStateBuilder();

  PedometerStateBuilder get _$this {
    if (_$v != null) {
      _timePeriod = _$v.timePeriod;
      _pedometerType = _$v.pedometerType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PedometerState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PedometerState;
  }

  @override
  void update(void Function(PedometerStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PedometerState build() {
    final _$result = _$v ??
        new _$PedometerState._(
            timePeriod: timePeriod, pedometerType: pedometerType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
