import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:turbostart/data/network/models/base_model.dart';

part 'set_push_token_response.g.dart';

abstract class SetPushTokenResponse implements BaseModel, Built<SetPushTokenResponse, SetPushTokenResponseBuilder> {
  SetPushTokenResponse._();

  factory SetPushTokenResponse([updates(SetPushTokenResponseBuilder builder)]) = _$SetPushTokenResponse;

  @nullable
  String get message;

  @nullable
  String get timestamp;

  @nullable
  @BuiltValueField(wireName: 'status')
  String get status;

  static Serializer<SetPushTokenResponse> get serializer => _$setPushTokenResponseSerializer;
}
