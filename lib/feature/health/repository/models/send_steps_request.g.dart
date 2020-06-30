// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_steps_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SendStepsRequest> _$sendStepsRequestSerializer =
    new _$SendStepsRequestSerializer();

class _$SendStepsRequestSerializer
    implements StructuredSerializer<SendStepsRequest> {
  @override
  final Iterable<Type> types = const [SendStepsRequest, _$SendStepsRequest];
  @override
  final String wireName = 'SendStepsRequest';

  @override
  Iterable<Object> serialize(Serializers serializers, SendStepsRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.data != null) {
      result
        ..add('data')
        ..add(serializers.serialize(object.data,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Steps)])));
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
  SendStepsRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SendStepsRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Steps)]))
              as BuiltList<dynamic>);
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

class _$SendStepsRequest extends SendStepsRequest {
  @override
  final BuiltList<Steps> data;
  @override
  final Meta meta;
  @override
  final ErrorModel error;
  @override
  final int httpCode;

  factory _$SendStepsRequest(
          [void Function(SendStepsRequestBuilder) updates]) =>
      (new SendStepsRequestBuilder()..update(updates)).build();

  _$SendStepsRequest._({this.data, this.meta, this.error, this.httpCode})
      : super._();

  @override
  SendStepsRequest rebuild(void Function(SendStepsRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SendStepsRequestBuilder toBuilder() =>
      new SendStepsRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SendStepsRequest &&
        data == other.data &&
        meta == other.meta &&
        error == other.error &&
        httpCode == other.httpCode;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, data.hashCode), meta.hashCode), error.hashCode),
        httpCode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SendStepsRequest')
          ..add('data', data)
          ..add('meta', meta)
          ..add('error', error)
          ..add('httpCode', httpCode))
        .toString();
  }
}

class SendStepsRequestBuilder
    implements
        Builder<SendStepsRequest, SendStepsRequestBuilder>,
        BaseModelBuilder {
  _$SendStepsRequest _$v;

  ListBuilder<Steps> _data;
  ListBuilder<Steps> get data => _$this._data ??= new ListBuilder<Steps>();
  set data(ListBuilder<Steps> data) => _$this._data = data;

  MetaBuilder _meta;
  MetaBuilder get meta => _$this._meta ??= new MetaBuilder();
  set meta(MetaBuilder meta) => _$this._meta = meta;

  ErrorModelBuilder _error;
  ErrorModelBuilder get error => _$this._error ??= new ErrorModelBuilder();
  set error(ErrorModelBuilder error) => _$this._error = error;

  int _httpCode;
  int get httpCode => _$this._httpCode;
  set httpCode(int httpCode) => _$this._httpCode = httpCode;

  SendStepsRequestBuilder();

  SendStepsRequestBuilder get _$this {
    if (_$v != null) {
      _data = _$v.data?.toBuilder();
      _meta = _$v.meta?.toBuilder();
      _error = _$v.error?.toBuilder();
      _httpCode = _$v.httpCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SendStepsRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SendStepsRequest;
  }

  @override
  void update(void Function(SendStepsRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SendStepsRequest build() {
    _$SendStepsRequest _$result;
    try {
      _$result = _$v ??
          new _$SendStepsRequest._(
              data: _data?.build(),
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
            'SendStepsRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
