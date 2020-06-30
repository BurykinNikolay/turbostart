// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_steps_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SendStepsResponse> _$sendStepsResponseSerializer =
    new _$SendStepsResponseSerializer();

class _$SendStepsResponseSerializer
    implements StructuredSerializer<SendStepsResponse> {
  @override
  final Iterable<Type> types = const [SendStepsResponse, _$SendStepsResponse];
  @override
  final String wireName = 'SendStepsResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, SendStepsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.request != null) {
      result
        ..add('request')
        ..add(serializers.serialize(object.request,
            specifiedType: const FullType(SendStepsRequest)));
    }
    if (object.message != null) {
      result
        ..add('message')
        ..add(serializers.serialize(object.message,
            specifiedType: const FullType(String)));
    }
    if (object.timestamp != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(object.timestamp,
            specifiedType: const FullType(String)));
    }
    if (object.status != null) {
      result
        ..add('status')
        ..add(serializers.serialize(object.status,
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
  SendStepsResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SendStepsResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'request':
          result.request.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SendStepsRequest))
              as SendStepsRequest);
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
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

class _$SendStepsResponse extends SendStepsResponse {
  @override
  final SendStepsRequest request;
  @override
  final String message;
  @override
  final String timestamp;
  @override
  final String status;
  @override
  final Meta meta;
  @override
  final ErrorModel error;
  @override
  final int httpCode;

  factory _$SendStepsResponse(
          [void Function(SendStepsResponseBuilder) updates]) =>
      (new SendStepsResponseBuilder()..update(updates)).build();

  _$SendStepsResponse._(
      {this.request,
      this.message,
      this.timestamp,
      this.status,
      this.meta,
      this.error,
      this.httpCode})
      : super._();

  @override
  SendStepsResponse rebuild(void Function(SendStepsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SendStepsResponseBuilder toBuilder() =>
      new SendStepsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SendStepsResponse &&
        request == other.request &&
        message == other.message &&
        timestamp == other.timestamp &&
        status == other.status &&
        meta == other.meta &&
        error == other.error &&
        httpCode == other.httpCode;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, request.hashCode), message.hashCode),
                        timestamp.hashCode),
                    status.hashCode),
                meta.hashCode),
            error.hashCode),
        httpCode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SendStepsResponse')
          ..add('request', request)
          ..add('message', message)
          ..add('timestamp', timestamp)
          ..add('status', status)
          ..add('meta', meta)
          ..add('error', error)
          ..add('httpCode', httpCode))
        .toString();
  }
}

class SendStepsResponseBuilder
    implements
        Builder<SendStepsResponse, SendStepsResponseBuilder>,
        BaseModelBuilder {
  _$SendStepsResponse _$v;

  SendStepsRequestBuilder _request;
  SendStepsRequestBuilder get request =>
      _$this._request ??= new SendStepsRequestBuilder();
  set request(SendStepsRequestBuilder request) => _$this._request = request;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  String _timestamp;
  String get timestamp => _$this._timestamp;
  set timestamp(String timestamp) => _$this._timestamp = timestamp;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  MetaBuilder _meta;
  MetaBuilder get meta => _$this._meta ??= new MetaBuilder();
  set meta(MetaBuilder meta) => _$this._meta = meta;

  ErrorModelBuilder _error;
  ErrorModelBuilder get error => _$this._error ??= new ErrorModelBuilder();
  set error(ErrorModelBuilder error) => _$this._error = error;

  int _httpCode;
  int get httpCode => _$this._httpCode;
  set httpCode(int httpCode) => _$this._httpCode = httpCode;

  SendStepsResponseBuilder();

  SendStepsResponseBuilder get _$this {
    if (_$v != null) {
      _request = _$v.request?.toBuilder();
      _message = _$v.message;
      _timestamp = _$v.timestamp;
      _status = _$v.status;
      _meta = _$v.meta?.toBuilder();
      _error = _$v.error?.toBuilder();
      _httpCode = _$v.httpCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SendStepsResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SendStepsResponse;
  }

  @override
  void update(void Function(SendStepsResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SendStepsResponse build() {
    _$SendStepsResponse _$result;
    try {
      _$result = _$v ??
          new _$SendStepsResponse._(
              request: _request?.build(),
              message: message,
              timestamp: timestamp,
              status: status,
              meta: _meta?.build(),
              error: _error?.build(),
              httpCode: httpCode);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'request';
        _request?.build();

        _$failedField = 'meta';
        _meta?.build();
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SendStepsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
