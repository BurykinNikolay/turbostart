// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steps.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Steps> _$stepsSerializer = new _$StepsSerializer();

class _$StepsSerializer implements StructuredSerializer<Steps> {
  @override
  final Iterable<Type> types = const [Steps, _$Steps];
  @override
  final String wireName = 'Steps';

  @override
  Iterable<Object> serialize(Serializers serializers, Steps object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.steps != null) {
      result
        ..add('steps')
        ..add(serializers.serialize(object.steps,
            specifiedType: const FullType(int)));
    }
    if (object.date != null) {
      result
        ..add('date')
        ..add(serializers.serialize(object.date,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Steps deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StepsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'steps':
          result.steps = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Steps extends Steps {
  @override
  final int steps;
  @override
  final int date;

  factory _$Steps([void Function(StepsBuilder) updates]) =>
      (new StepsBuilder()..update(updates)).build();

  _$Steps._({this.steps, this.date}) : super._();

  @override
  Steps rebuild(void Function(StepsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StepsBuilder toBuilder() => new StepsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Steps && steps == other.steps && date == other.date;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, steps.hashCode), date.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Steps')
          ..add('steps', steps)
          ..add('date', date))
        .toString();
  }
}

class StepsBuilder implements Builder<Steps, StepsBuilder> {
  _$Steps _$v;

  int _steps;
  int get steps => _$this._steps;
  set steps(int steps) => _$this._steps = steps;

  int _date;
  int get date => _$this._date;
  set date(int date) => _$this._date = date;

  StepsBuilder();

  StepsBuilder get _$this {
    if (_$v != null) {
      _steps = _$v.steps;
      _date = _$v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Steps other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Steps;
  }

  @override
  void update(void Function(StepsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Steps build() {
    final _$result = _$v ?? new _$Steps._(steps: steps, date: date);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
