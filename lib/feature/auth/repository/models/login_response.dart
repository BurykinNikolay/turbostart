import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:turbostart/data/network/models/base_model.dart';

import 'login_request.dart';

part 'login_response.g.dart';

abstract class LoginResponse implements BaseModel, Built<LoginResponse, LoginResponseBuilder> {
  LoginResponse._();

  factory LoginResponse([updates(LoginResponseBuilder builder)]) = _$LoginResponse;

  @nullable
  LoginRequest get request;

  @nullable
  String get message;

  @nullable
  String get timestamp;

  @nullable
  @BuiltValueField(wireName: 'status')
  String get status;
  @nullable
  @BuiltValueField(wireName: 'auth_key')
  String get authKey;

  static Serializer<LoginResponse> get serializer => _$loginResponseSerializer;
}
