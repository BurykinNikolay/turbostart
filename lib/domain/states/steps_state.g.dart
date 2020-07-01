// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steps_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StepsState> _$stepsStateSerializer = new _$StepsStateSerializer();

class _$StepsStateSerializer implements StructuredSerializer<StepsState> {
  @override
  final Iterable<Type> types = const [StepsState, _$StepsState];
  @override
  final String wireName = 'StepsState';

  @override
  Iterable<Object> serialize(Serializers serializers, StepsState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.stepsUserToday != null) {
      result
        ..add('steps_user_today')
        ..add(serializers.serialize(object.stepsUserToday,
            specifiedType: const FullType(int)));
    }
    if (object.stepsUserAll != null) {
      result
        ..add('steps_user_all')
        ..add(serializers.serialize(object.stepsUserAll,
            specifiedType: const FullType(int)));
    }
    if (object.stepsMacroregionToday != null) {
      result
        ..add('steps_macroregion_today')
        ..add(serializers.serialize(object.stepsMacroregionToday,
            specifiedType: const FullType(int)));
    }
    if (object.stepsMacroregionAll != null) {
      result
        ..add('steps_macroregion_all')
        ..add(serializers.serialize(object.stepsMacroregionAll,
            specifiedType: const FullType(int)));
    }
    if (object.stepsUserData != null) {
      result
        ..add('steps_user_data')
        ..add(serializers.serialize(object.stepsUserData,
            specifiedType:
                const FullType(BuiltList, const [const FullType(StepsData)])));
    }
    if (object.stepsMacroregionData != null) {
      result
        ..add('steps_macroregion_data')
        ..add(serializers.serialize(object.stepsMacroregionData,
            specifiedType:
                const FullType(BuiltList, const [const FullType(StepsData)])));
    }
    return result;
  }

  @override
  StepsState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StepsStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'steps_user_today':
          result.stepsUserToday = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'steps_user_all':
          result.stepsUserAll = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'steps_macroregion_today':
          result.stepsMacroregionToday = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'steps_macroregion_all':
          result.stepsMacroregionAll = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'steps_user_data':
          result.stepsUserData.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(StepsData)]))
              as BuiltList<dynamic>);
          break;
        case 'steps_macroregion_data':
          result.stepsMacroregionData.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(StepsData)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$StepsState extends StepsState {
  @override
  final int id;
  @override
  final int stepsUserToday;
  @override
  final int stepsUserAll;
  @override
  final int stepsMacroregionToday;
  @override
  final int stepsMacroregionAll;
  @override
  final BuiltList<StepsData> stepsUserData;
  @override
  final BuiltList<StepsData> stepsMacroregionData;

  factory _$StepsState([void Function(StepsStateBuilder) updates]) =>
      (new StepsStateBuilder()..update(updates)).build();

  _$StepsState._(
      {this.id,
      this.stepsUserToday,
      this.stepsUserAll,
      this.stepsMacroregionToday,
      this.stepsMacroregionAll,
      this.stepsUserData,
      this.stepsMacroregionData})
      : super._();

  @override
  StepsState rebuild(void Function(StepsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StepsStateBuilder toBuilder() => new StepsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StepsState &&
        id == other.id &&
        stepsUserToday == other.stepsUserToday &&
        stepsUserAll == other.stepsUserAll &&
        stepsMacroregionToday == other.stepsMacroregionToday &&
        stepsMacroregionAll == other.stepsMacroregionAll &&
        stepsUserData == other.stepsUserData &&
        stepsMacroregionData == other.stepsMacroregionData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), stepsUserToday.hashCode),
                        stepsUserAll.hashCode),
                    stepsMacroregionToday.hashCode),
                stepsMacroregionAll.hashCode),
            stepsUserData.hashCode),
        stepsMacroregionData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StepsState')
          ..add('id', id)
          ..add('stepsUserToday', stepsUserToday)
          ..add('stepsUserAll', stepsUserAll)
          ..add('stepsMacroregionToday', stepsMacroregionToday)
          ..add('stepsMacroregionAll', stepsMacroregionAll)
          ..add('stepsUserData', stepsUserData)
          ..add('stepsMacroregionData', stepsMacroregionData))
        .toString();
  }
}

class StepsStateBuilder implements Builder<StepsState, StepsStateBuilder> {
  _$StepsState _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _stepsUserToday;
  int get stepsUserToday => _$this._stepsUserToday;
  set stepsUserToday(int stepsUserToday) =>
      _$this._stepsUserToday = stepsUserToday;

  int _stepsUserAll;
  int get stepsUserAll => _$this._stepsUserAll;
  set stepsUserAll(int stepsUserAll) => _$this._stepsUserAll = stepsUserAll;

  int _stepsMacroregionToday;
  int get stepsMacroregionToday => _$this._stepsMacroregionToday;
  set stepsMacroregionToday(int stepsMacroregionToday) =>
      _$this._stepsMacroregionToday = stepsMacroregionToday;

  int _stepsMacroregionAll;
  int get stepsMacroregionAll => _$this._stepsMacroregionAll;
  set stepsMacroregionAll(int stepsMacroregionAll) =>
      _$this._stepsMacroregionAll = stepsMacroregionAll;

  ListBuilder<StepsData> _stepsUserData;
  ListBuilder<StepsData> get stepsUserData =>
      _$this._stepsUserData ??= new ListBuilder<StepsData>();
  set stepsUserData(ListBuilder<StepsData> stepsUserData) =>
      _$this._stepsUserData = stepsUserData;

  ListBuilder<StepsData> _stepsMacroregionData;
  ListBuilder<StepsData> get stepsMacroregionData =>
      _$this._stepsMacroregionData ??= new ListBuilder<StepsData>();
  set stepsMacroregionData(ListBuilder<StepsData> stepsMacroregionData) =>
      _$this._stepsMacroregionData = stepsMacroregionData;

  StepsStateBuilder();

  StepsStateBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _stepsUserToday = _$v.stepsUserToday;
      _stepsUserAll = _$v.stepsUserAll;
      _stepsMacroregionToday = _$v.stepsMacroregionToday;
      _stepsMacroregionAll = _$v.stepsMacroregionAll;
      _stepsUserData = _$v.stepsUserData?.toBuilder();
      _stepsMacroregionData = _$v.stepsMacroregionData?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StepsState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StepsState;
  }

  @override
  void update(void Function(StepsStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StepsState build() {
    _$StepsState _$result;
    try {
      _$result = _$v ??
          new _$StepsState._(
              id: id,
              stepsUserToday: stepsUserToday,
              stepsUserAll: stepsUserAll,
              stepsMacroregionToday: stepsMacroregionToday,
              stepsMacroregionAll: stepsMacroregionAll,
              stepsUserData: _stepsUserData?.build(),
              stepsMacroregionData: _stepsMacroregionData?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'stepsUserData';
        _stepsUserData?.build();
        _$failedField = 'stepsMacroregionData';
        _stepsMacroregionData?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'StepsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
