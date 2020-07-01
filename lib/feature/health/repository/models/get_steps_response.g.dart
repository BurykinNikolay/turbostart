// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_steps_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetStepsResponse> _$getStepsResponseSerializer =
    new _$GetStepsResponseSerializer();

class _$GetStepsResponseSerializer
    implements StructuredSerializer<GetStepsResponse> {
  @override
  final Iterable<Type> types = const [GetStepsResponse, _$GetStepsResponse];
  @override
  final String wireName = 'GetStepsResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, GetStepsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.status != null) {
      result
        ..add('status')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(String)));
    }
    if (object.data != null) {
      result
        ..add('data')
        ..add(serializers.serialize(object.data,
            specifiedType: const FullType(StepsState)));
    }
    if (object.message != null) {
      result
        ..add('message')
        ..add(serializers.serialize(object.message,
            specifiedType: const FullType(String)));
    }
    if (object.meta != null) {
      result
        ..add('meta')
        ..add(serializers.serialize(object.meta,
            specifiedType: const FullType(Meta)));
    }
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(ErrorModel)));
    }
    if (object.httpCode != null) {
      result
        ..add('httpCode')
        ..add(serializers.serialize(object.httpCode,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GetStepsResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetStepsResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(StepsState)) as StepsState);
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'meta':
          result.meta.replace(serializers.deserialize(value,
              specifiedType: const FullType(Meta)) as Meta);
          break;
        case 'error':
          result.error.replace(serializers.deserialize(value,
              specifiedType: const FullType(ErrorModel)) as ErrorModel);
          break;
        case 'httpCode':
          result.httpCode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GetStepsResponse extends GetStepsResponse {
  @override
  final String status;
  @override
  final StepsState data;
  @override
  final String message;
  @override
  final Meta meta;
  @override
  final ErrorModel error;
  @override
  final int httpCode;

  factory _$GetStepsResponse(
          [void Function(GetStepsResponseBuilder) updates]) =>
      (new GetStepsResponseBuilder()..update(updates)).build();

  _$GetStepsResponse._(
      {this.status,
      this.data,
      this.message,
      this.meta,
      this.error,
      this.httpCode})
      : super._();

  @override
  GetStepsResponse rebuild(void Function(GetStepsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetStepsResponseBuilder toBuilder() =>
      new GetStepsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetStepsResponse &&
        status == other.status &&
        data == other.data &&
        message == other.message &&
        meta == other.meta &&
        error == other.error &&
        httpCode == other.httpCode;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, status.hashCode), data.hashCode),
                    message.hashCode),
                meta.hashCode),
            error.hashCode),
        httpCode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GetStepsResponse')
          ..add('status', status)
          ..add('data', data)
          ..add('message', message)
          ..add('meta', meta)
          ..add('error', error)
          ..add('httpCode', httpCode))
        .toString();
  }
}

class GetStepsResponseBuilder
    implements
        Builder<GetStepsResponse, GetStepsResponseBuilder>,
        BaseModelBuilder {
  _$GetStepsResponse _$v;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  StepsStateBuilder _data;
  StepsStateBuilder get data => _$this._data ??= new StepsStateBuilder();
  set data(StepsStateBuilder data) => _$this._data = data;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  MetaBuilder _meta;
  MetaBuilder get meta => _$this._meta ??= new MetaBuilder();
  set meta(MetaBuilder meta) => _$this._meta = meta;

  ErrorModelBuilder _error;
  ErrorModelBuilder get error => _$this._error ??= new ErrorModelBuilder();
  set error(ErrorModelBuilder error) => _$this._error = error;

  int _httpCode;
  int get httpCode => _$this._httpCode;
  set httpCode(int httpCode) => _$this._httpCode = httpCode;

  GetStepsResponseBuilder();

  GetStepsResponseBuilder get _$this {
    if (_$v != null) {
      _status = _$v.status;
      _data = _$v.data?.toBuilder();
      _message = _$v.message;
      _meta = _$v.meta?.toBuilder();
      _error = _$v.error?.toBuilder();
      _httpCode = _$v.httpCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant GetStepsResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GetStepsResponse;
  }

  @override
  void update(void Function(GetStepsResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GetStepsResponse build() {
    _$GetStepsResponse _$result;
    try {
      _$result = _$v ??
          new _$GetStepsResponse._(
              status: status,
              data: _data?.build(),
              message: message,
              meta: _meta?.build(),
              error: _error?.build(),
              httpCode: httpCode);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();

        _$failedField = 'meta';
        _meta?.build();
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GetStepsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
