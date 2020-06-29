import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:turbostart/domain/models/user_info.dart';

import '../domain_serializer.dart';

part 'user_state.g.dart';

abstract class UserState implements Built<UserState, UserStateBuilder> {
  UserState._();
  factory UserState([Function(UserStateBuilder builder) updates]) {
    return _$UserState(
      (builder) => builder..update(updates),
    );
  }

  @nullable
  String get token;

  @nullable
  UserInfo get userInfo;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(UserState.serializer, this);
  }

  static UserState fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserState.serializer, json);
  }

  static Serializer<UserState> get serializer => _$userStateSerializer;
}
