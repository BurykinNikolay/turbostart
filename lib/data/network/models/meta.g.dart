// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Meta> _$metaSerializer = new _$MetaSerializer();

class _$MetaSerializer implements StructuredSerializer<Meta> {
  @override
  final Iterable<Type> types = const [Meta, _$Meta];
  @override
  final String wireName = 'Meta';

  @override
  Iterable<Object> serialize(Serializers serializers, Meta object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.uuid != null) {
      result
        ..add('uuid')
        ..add(serializers.serialize(object.uuid,
            specifiedType: const FullType(String)));
    }
    if (object.token != null) {
      result
        ..add('token')
        ..add(serializers.serialize(object.token,
            specifiedType: const FullType(String)));
    }
    if (object.refreshToken != null) {
      result
        ..add('refreshToken')
        ..add(serializers.serialize(object.refreshToken,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Meta deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MetaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uuid':
          result.uuid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'refreshToken':
          result.refreshToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Meta extends Meta {
  @override
  final String uuid;
  @override
  final String token;
  @override
  final String refreshToken;

  factory _$Meta([void Function(MetaBuilder) updates]) =>
      (new MetaBuilder()..update(updates)).build();

  _$Meta._({this.uuid, this.token, this.refreshToken}) : super._();

  @override
  Meta rebuild(void Function(MetaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MetaBuilder toBuilder() => new MetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Meta &&
        uuid == other.uuid &&
        token == other.token &&
        refreshToken == other.refreshToken;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, uuid.hashCode), token.hashCode), refreshToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Meta')
          ..add('uuid', uuid)
          ..add('token', token)
          ..add('refreshToken', refreshToken))
        .toString();
  }
}

class MetaBuilder implements Builder<Meta, MetaBuilder> {
  _$Meta _$v;

  String _uuid;
  String get uuid => _$this._uuid;
  set uuid(String uuid) => _$this._uuid = uuid;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  String _refreshToken;
  String get refreshToken => _$this._refreshToken;
  set refreshToken(String refreshToken) => _$this._refreshToken = refreshToken;

  MetaBuilder();

  MetaBuilder get _$this {
    if (_$v != null) {
      _uuid = _$v.uuid;
      _token = _$v.token;
      _refreshToken = _$v.refreshToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Meta other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Meta;
  }

  @override
  void update(void Function(MetaBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Meta build() {
    final _$result = _$v ??
        new _$Meta._(uuid: uuid, token: token, refreshToken: refreshToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
