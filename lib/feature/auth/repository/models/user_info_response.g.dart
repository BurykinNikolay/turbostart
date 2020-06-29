// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserInfoResponse> _$userInfoResponseSerializer =
    new _$UserInfoResponseSerializer();

class _$UserInfoResponseSerializer
    implements StructuredSerializer<UserInfoResponse> {
  @override
  final Iterable<Type> types = const [UserInfoResponse, _$UserInfoResponse];
  @override
  final String wireName = 'UserInfoResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, UserInfoResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
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
    if (object.userInfo != null) {
      result
        ..add('userInfo')
        ..add(serializers.serialize(object.userInfo,
            specifiedType: const FullType(UserInfo)));
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
  UserInfoResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserInfoResponseBuilder();

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
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userInfo':
          result.userInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserInfo)) as UserInfo);
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

class _$UserInfoResponse extends UserInfoResponse {
  @override
  final String message;
  @override
  final String timestamp;
  @override
  final String status;
  @override
  final UserInfo userInfo;
  @override
  final Meta meta;
  @override
  final ErrorModel error;
  @override
  final int httpCode;

  factory _$UserInfoResponse(
          [void Function(UserInfoResponseBuilder) updates]) =>
      (new UserInfoResponseBuilder()..update(updates)).build();

  _$UserInfoResponse._(
      {this.message,
      this.timestamp,
      this.status,
      this.userInfo,
      this.meta,
      this.error,
      this.httpCode})
      : super._();

  @override
  UserInfoResponse rebuild(void Function(UserInfoResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserInfoResponseBuilder toBuilder() =>
      new UserInfoResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserInfoResponse &&
        message == other.message &&
        timestamp == other.timestamp &&
        status == other.status &&
        userInfo == other.userInfo &&
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
                    $jc($jc($jc(0, message.hashCode), timestamp.hashCode),
                        status.hashCode),
                    userInfo.hashCode),
                meta.hashCode),
            error.hashCode),
        httpCode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserInfoResponse')
          ..add('message', message)
          ..add('timestamp', timestamp)
          ..add('status', status)
          ..add('userInfo', userInfo)
          ..add('meta', meta)
          ..add('error', error)
          ..add('httpCode', httpCode))
        .toString();
  }
}

class UserInfoResponseBuilder
    implements
        Builder<UserInfoResponse, UserInfoResponseBuilder>,
        BaseModelBuilder {
  _$UserInfoResponse _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  String _timestamp;
  String get timestamp => _$this._timestamp;
  set timestamp(String timestamp) => _$this._timestamp = timestamp;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  UserInfoBuilder _userInfo;
  UserInfoBuilder get userInfo => _$this._userInfo ??= new UserInfoBuilder();
  set userInfo(UserInfoBuilder userInfo) => _$this._userInfo = userInfo;

  MetaBuilder _meta;
  MetaBuilder get meta => _$this._meta ??= new MetaBuilder();
  set meta(MetaBuilder meta) => _$this._meta = meta;

  ErrorModelBuilder _error;
  ErrorModelBuilder get error => _$this._error ??= new ErrorModelBuilder();
  set error(ErrorModelBuilder error) => _$this._error = error;

  int _httpCode;
  int get httpCode => _$this._httpCode;
  set httpCode(int httpCode) => _$this._httpCode = httpCode;

  UserInfoResponseBuilder();

  UserInfoResponseBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _timestamp = _$v.timestamp;
      _status = _$v.status;
      _userInfo = _$v.userInfo?.toBuilder();
      _meta = _$v.meta?.toBuilder();
      _error = _$v.error?.toBuilder();
      _httpCode = _$v.httpCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserInfoResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserInfoResponse;
  }

  @override
  void update(void Function(UserInfoResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserInfoResponse build() {
    _$UserInfoResponse _$result;
    try {
      _$result = _$v ??
          new _$UserInfoResponse._(
              message: message,
              timestamp: timestamp,
              status: status,
              userInfo: _userInfo?.build(),
              meta: _meta?.build(),
              error: _error?.build(),
              httpCode: httpCode);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'userInfo';
        _userInfo?.build();
        _$failedField = 'meta';
        _meta?.build();
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserInfoResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
