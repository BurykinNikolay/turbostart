// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserState> _$userStateSerializer = new _$UserStateSerializer();

class _$UserStateSerializer implements StructuredSerializer<UserState> {
  @override
  final Iterable<Type> types = const [UserState, _$UserState];
  @override
  final String wireName = 'UserState';

  @override
  Iterable<Object> serialize(Serializers serializers, UserState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.token != null) {
      result
        ..add('token')
        ..add(serializers.serialize(object.token,
            specifiedType: const FullType(String)));
    }
    if (object.userInfo != null) {
      result
        ..add('userInfo')
        ..add(serializers.serialize(object.userInfo,
            specifiedType: const FullType(UserInfo)));
    }
    return result;
  }

  @override
  UserState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userInfo':
          result.userInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserInfo)) as UserInfo);
          break;
      }
    }

    return result.build();
  }
}

class _$UserState extends UserState {
  @override
  final String token;
  @override
  final UserInfo userInfo;

  factory _$UserState([void Function(UserStateBuilder) updates]) =>
      (new UserStateBuilder()..update(updates)).build();

  _$UserState._({this.token, this.userInfo}) : super._();

  @override
  UserState rebuild(void Function(UserStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStateBuilder toBuilder() => new UserStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserState &&
        token == other.token &&
        userInfo == other.userInfo;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, token.hashCode), userInfo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserState')
          ..add('token', token)
          ..add('userInfo', userInfo))
        .toString();
  }
}

class UserStateBuilder implements Builder<UserState, UserStateBuilder> {
  _$UserState _$v;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  UserInfoBuilder _userInfo;
  UserInfoBuilder get userInfo => _$this._userInfo ??= new UserInfoBuilder();
  set userInfo(UserInfoBuilder userInfo) => _$this._userInfo = userInfo;

  UserStateBuilder();

  UserStateBuilder get _$this {
    if (_$v != null) {
      _token = _$v.token;
      _userInfo = _$v.userInfo?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserState;
  }

  @override
  void update(void Function(UserStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserState build() {
    _$UserState _$result;
    try {
      _$result =
          _$v ?? new _$UserState._(token: token, userInfo: _userInfo?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'userInfo';
        _userInfo?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
