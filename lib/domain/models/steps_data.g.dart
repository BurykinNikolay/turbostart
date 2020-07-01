// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steps_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StepsData> _$stepsDataSerializer = new _$StepsDataSerializer();

class _$StepsDataSerializer implements StructuredSerializer<StepsData> {
  @override
  final Iterable<Type> types = const [StepsData, _$StepsData];
  @override
  final String wireName = 'StepsData';

  @override
  Iterable<Object> serialize(Serializers serializers, StepsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.date != null) {
      result
        ..add('date')
        ..add(serializers.serialize(object.date,
            specifiedType: const FullType(String)));
    }
    if (object.steps != null) {
      result
        ..add('steps')
        ..add(serializers.serialize(object.steps,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  StepsData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StepsDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'steps':
          result.steps = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$StepsData extends StepsData {
  @override
  final String date;
  @override
  final String steps;

  factory _$StepsData([void Function(StepsDataBuilder) updates]) =>
      (new StepsDataBuilder()..update(updates)).build();

  _$StepsData._({this.date, this.steps}) : super._();

  @override
  StepsData rebuild(void Function(StepsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StepsDataBuilder toBuilder() => new StepsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StepsData && date == other.date && steps == other.steps;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, date.hashCode), steps.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StepsData')
          ..add('date', date)
          ..add('steps', steps))
        .toString();
  }
}

class StepsDataBuilder implements Builder<StepsData, StepsDataBuilder> {
  _$StepsData _$v;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _steps;
  String get steps => _$this._steps;
  set steps(String steps) => _$this._steps = steps;

  StepsDataBuilder();

  StepsDataBuilder get _$this {
    if (_$v != null) {
      _date = _$v.date;
      _steps = _$v.steps;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StepsData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StepsData;
  }

  @override
  void update(void Function(StepsDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StepsData build() {
    final _$result = _$v ?? new _$StepsData._(date: date, steps: steps);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
