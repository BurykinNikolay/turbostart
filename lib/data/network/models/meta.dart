import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'meta.g.dart';

abstract class Meta implements Built<Meta, MetaBuilder> {
  Meta._();

  factory Meta([updates(MetaBuilder builder)]) = _$Meta;

  @nullable
  String get uuid;

  @nullable
  String get token;

  @nullable
  String get refreshToken;

  static Serializer<Meta> get serializer => _$metaSerializer;
}
