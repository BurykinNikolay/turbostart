// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RemoteConfig> _$remoteConfigSerializer =
    new _$RemoteConfigSerializer();

class _$RemoteConfigSerializer implements StructuredSerializer<RemoteConfig> {
  @override
  final Iterable<Type> types = const [RemoteConfig, _$RemoteConfig];
  @override
  final String wireName = 'RemoteConfig';

  @override
  Iterable<Object> serialize(Serializers serializers, RemoteConfig object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.ftApiUrl != null) {
      result
        ..add('ftApiUrl')
        ..add(serializers.serialize(object.ftApiUrl,
            specifiedType: const FullType(String)));
    }
    if (object.stageApiUrl != null) {
      result
        ..add('stageApiUrl')
        ..add(serializers.serialize(object.stageApiUrl,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  RemoteConfig deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RemoteConfigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'ftApiUrl':
          result.ftApiUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'stageApiUrl':
          result.stageApiUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$RemoteConfig extends RemoteConfig {
  @override
  final String ftApiUrl;
  @override
  final String stageApiUrl;

  factory _$RemoteConfig([void Function(RemoteConfigBuilder) updates]) =>
      (new RemoteConfigBuilder()..update(updates)).build();

  _$RemoteConfig._({this.ftApiUrl, this.stageApiUrl}) : super._();

  @override
  RemoteConfig rebuild(void Function(RemoteConfigBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoteConfigBuilder toBuilder() => new RemoteConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoteConfig &&
        ftApiUrl == other.ftApiUrl &&
        stageApiUrl == other.stageApiUrl;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, ftApiUrl.hashCode), stageApiUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RemoteConfig')
          ..add('ftApiUrl', ftApiUrl)
          ..add('stageApiUrl', stageApiUrl))
        .toString();
  }
}

class RemoteConfigBuilder
    implements Builder<RemoteConfig, RemoteConfigBuilder> {
  _$RemoteConfig _$v;

  String _ftApiUrl;
  String get ftApiUrl => _$this._ftApiUrl;
  set ftApiUrl(String ftApiUrl) => _$this._ftApiUrl = ftApiUrl;

  String _stageApiUrl;
  String get stageApiUrl => _$this._stageApiUrl;
  set stageApiUrl(String stageApiUrl) => _$this._stageApiUrl = stageApiUrl;

  RemoteConfigBuilder();

  RemoteConfigBuilder get _$this {
    if (_$v != null) {
      _ftApiUrl = _$v.ftApiUrl;
      _stageApiUrl = _$v.stageApiUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoteConfig other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RemoteConfig;
  }

  @override
  void update(void Function(RemoteConfigBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RemoteConfig build() {
    final _$result = _$v ??
        new _$RemoteConfig._(ftApiUrl: ftApiUrl, stageApiUrl: stageApiUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
