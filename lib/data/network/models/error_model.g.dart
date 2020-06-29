// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ErrorModel> _$errorModelSerializer = new _$ErrorModelSerializer();

class _$ErrorModelSerializer implements StructuredSerializer<ErrorModel> {
  @override
  final Iterable<Type> types = const [ErrorModel, _$ErrorModel];
  @override
  final String wireName = 'ErrorModel';

  @override
  Iterable<Object> serialize(Serializers serializers, ErrorModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.message != null) {
      result
        ..add('message')
        ..add(serializers.serialize(object.message,
            specifiedType: const FullType(String)));
    }
    if (object.code != null) {
      result
        ..add('code')
        ..add(serializers.serialize(object.code,
            specifiedType: const FullType(int)));
    }
    if (object.httpCode != null) {
      result
        ..add('httpCode')
        ..add(serializers.serialize(object.httpCode,
            specifiedType: const FullType(int)));
    }
    if (object.errorTime != null) {
      result
        ..add('errorTime')
        ..add(serializers.serialize(object.errorTime,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ErrorModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ErrorModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'httpCode':
          result.httpCode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'errorTime':
          result.errorTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ErrorModel extends ErrorModel {
  @override
  final String message;
  @override
  final int code;
  @override
  final int httpCode;
  @override
  final String errorTime;

  factory _$ErrorModel([void Function(ErrorModelBuilder) updates]) =>
      (new ErrorModelBuilder()..update(updates)).build();

  _$ErrorModel._({this.message, this.code, this.httpCode, this.errorTime})
      : super._();

  @override
  ErrorModel rebuild(void Function(ErrorModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ErrorModelBuilder toBuilder() => new ErrorModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ErrorModel &&
        message == other.message &&
        code == other.code &&
        httpCode == other.httpCode &&
        errorTime == other.errorTime;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, message.hashCode), code.hashCode), httpCode.hashCode),
        errorTime.hashCode));
  }
}

class ErrorModelBuilder implements Builder<ErrorModel, ErrorModelBuilder> {
  _$ErrorModel _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  int _code;
  int get code => _$this._code;
  set code(int code) => _$this._code = code;

  int _httpCode;
  int get httpCode => _$this._httpCode;
  set httpCode(int httpCode) => _$this._httpCode = httpCode;

  String _errorTime;
  String get errorTime => _$this._errorTime;
  set errorTime(String errorTime) => _$this._errorTime = errorTime;

  ErrorModelBuilder();

  ErrorModelBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _code = _$v.code;
      _httpCode = _$v.httpCode;
      _errorTime = _$v.errorTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ErrorModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ErrorModel;
  }

  @override
  void update(void Function(ErrorModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ErrorModel build() {
    final _$result = _$v ??
        new _$ErrorModel._(
            message: message,
            code: code,
            httpCode: httpCode,
            errorTime: errorTime);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
