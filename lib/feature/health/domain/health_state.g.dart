// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HealthState> _$healthStateSerializer = new _$HealthStateSerializer();

class _$HealthStateSerializer implements StructuredSerializer<HealthState> {
  @override
  final Iterable<Type> types = const [HealthState, _$HealthState];
  @override
  final String wireName = 'HealthState';

  @override
  Iterable<Object> serialize(Serializers serializers, HealthState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.steps != null) {
      result
        ..add('steps')
        ..add(serializers.serialize(object.steps,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Steps)])));
    }
    return result;
  }

  @override
  HealthState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HealthStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'steps':
          result.steps.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Steps)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$HealthState extends HealthState {
  @override
  final BuiltList<Steps> steps;

  factory _$HealthState([void Function(HealthStateBuilder) updates]) =>
      (new HealthStateBuilder()..update(updates)).build();

  _$HealthState._({this.steps}) : super._();

  @override
  HealthState rebuild(void Function(HealthStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthStateBuilder toBuilder() => new HealthStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthState && steps == other.steps;
  }

  @override
  int get hashCode {
    return $jf($jc(0, steps.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HealthState')..add('steps', steps))
        .toString();
  }
}

class HealthStateBuilder implements Builder<HealthState, HealthStateBuilder> {
  _$HealthState _$v;

  ListBuilder<Steps> _steps;
  ListBuilder<Steps> get steps => _$this._steps ??= new ListBuilder<Steps>();
  set steps(ListBuilder<Steps> steps) => _$this._steps = steps;

  HealthStateBuilder();

  HealthStateBuilder get _$this {
    if (_$v != null) {
      _steps = _$v.steps?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HealthState;
  }

  @override
  void update(void Function(HealthStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HealthState build() {
    _$HealthState _$result;
    try {
      _$result = _$v ?? new _$HealthState._(steps: _steps?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'steps';
        _steps?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HealthState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
