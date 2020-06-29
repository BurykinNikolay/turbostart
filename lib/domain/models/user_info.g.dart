// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserInfo> _$userInfoSerializer = new _$UserInfoSerializer();

class _$UserInfoSerializer implements StructuredSerializer<UserInfo> {
  @override
  final Iterable<Type> types = const [UserInfo, _$UserInfo];
  @override
  final String wireName = 'UserInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, UserInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.login != null) {
      result
        ..add('login')
        ..add(serializers.serialize(object.login,
            specifiedType: const FullType(String)));
    }
    if (object.avatarLink != null) {
      result
        ..add('avatarLink')
        ..add(serializers.serialize(object.avatarLink,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserInfo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserInfoBuilder();

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
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'avatarLink':
          result.avatarLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserInfo extends UserInfo {
  @override
  final int id;
  @override
  final String login;
  @override
  final String avatarLink;

  factory _$UserInfo([void Function(UserInfoBuilder) updates]) =>
      (new UserInfoBuilder()..update(updates)).build();

  _$UserInfo._({this.id, this.login, this.avatarLink}) : super._();

  @override
  UserInfo rebuild(void Function(UserInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserInfoBuilder toBuilder() => new UserInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserInfo &&
        id == other.id &&
        login == other.login &&
        avatarLink == other.avatarLink;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), login.hashCode), avatarLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserInfo')
          ..add('id', id)
          ..add('login', login)
          ..add('avatarLink', avatarLink))
        .toString();
  }
}

class UserInfoBuilder implements Builder<UserInfo, UserInfoBuilder> {
  _$UserInfo _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  String _avatarLink;
  String get avatarLink => _$this._avatarLink;
  set avatarLink(String avatarLink) => _$this._avatarLink = avatarLink;

  UserInfoBuilder();

  UserInfoBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _login = _$v.login;
      _avatarLink = _$v.avatarLink;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserInfo;
  }

  @override
  void update(void Function(UserInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserInfo build() {
    final _$result =
        _$v ?? new _$UserInfo._(id: id, login: login, avatarLink: avatarLink);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
