import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'remote_config.g.dart';

abstract class RemoteConfig
    implements Built<RemoteConfig, RemoteConfigBuilder> {
  RemoteConfig._();

  factory RemoteConfig([updates(RemoteConfigBuilder builder)]) {
    return _$RemoteConfig((builder) => builder
      ..stageApiUrl = '185.12.30.125'
      ..update(updates));
  }

  @nullable
  String get ftApiUrl;

  @nullable
  String get stageApiUrl;

  static Serializer<RemoteConfig> get serializer => _$remoteConfigSerializer;
}
