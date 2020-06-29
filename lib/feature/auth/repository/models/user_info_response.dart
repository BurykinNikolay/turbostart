import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:turbostart/data/network/models/base_model.dart';
import 'package:turbostart/domain/models/user_info.dart';

part 'user_info_response.g.dart';

abstract class UserInfoResponse implements BaseModel, Built<UserInfoResponse, UserInfoResponseBuilder> {
  UserInfoResponse._();

  factory UserInfoResponse([updates(UserInfoResponseBuilder builder)]) = _$UserInfoResponse;

  @nullable
  String get message;

  @nullable
  String get timestamp;

  @nullable
  @BuiltValueField(wireName: 'status')
  String get status;

  @nullable
  UserInfo get userInfo;

  static Serializer<UserInfoResponse> get serializer => _$userInfoResponseSerializer;
}
