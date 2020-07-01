library user_info;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_info.g.dart';

abstract class UserInfo implements Built<UserInfo, UserInfoBuilder> {
  UserInfo._();

  factory UserInfo([updates(UserInfoBuilder b)]) = _$UserInfo;

  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;
  @nullable
  @BuiltValueField(wireName: 'login')
  String get login;
  @nullable
  @BuiltValueField(wireName: 'name')
  String get name;
  @nullable
  @BuiltValueField(wireName: 'img')
  String get img;
  @nullable
  @BuiltValueField(wireName: 'rating')
  int get rating;
  @nullable
  @BuiltValueField(wireName: 'place')
  int get place;
  @nullable
  @BuiltValueField(wireName: 'steps')
  int get steps;
  @nullable
  @BuiltValueField(wireName: 'macroregion_id')
  int get macroregionId;
  @nullable
  @BuiltValueField(wireName: 'macroregion_name')
  String get macroregionName;

  @nullable
  @BuiltValueField(wireName: 'macroregion_avatars')
  BuiltList<String> get macroregionAvatars;

  static Serializer<UserInfo> get serializer => _$userInfoSerializer;
}
