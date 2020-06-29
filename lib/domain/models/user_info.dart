import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_info.g.dart';

abstract class UserInfo implements Built<UserInfo, UserInfoBuilder> {
  UserInfo._();
  factory UserInfo([updates(UserInfoBuilder builder)]) = _$UserInfo;

  @nullable
  int get id;
  @nullable
  String get login;

  @nullable
  String get avatarLink;

  static Serializer<UserInfo> get serializer => _$userInfoSerializer;
}
