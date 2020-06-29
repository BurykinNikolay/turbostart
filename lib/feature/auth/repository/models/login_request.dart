import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_request.g.dart';

abstract class LoginRequest implements Built<LoginRequest, LoginRequestBuilder> {
  LoginRequest._();

  factory LoginRequest([updates(LoginRequestBuilder builder)]) = _$LoginRequest;

  @nullable
  String get userName;
  @nullable
  String get password;

  static Serializer<LoginRequest> get serializer => _$loginRequestSerializer;
}
