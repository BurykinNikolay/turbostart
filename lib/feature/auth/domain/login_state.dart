import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'login_screen_status.dart';

part 'login_state.g.dart';

abstract class LoginState implements Built<LoginState, LoginStateBuilder> {
  LoginState._();

  factory LoginState([Function(LoginStateBuilder builder) updates]) {
    return _$LoginState(
      (builder) => builder
        ..rememberStatus = true
        ..loginScreenStatus = LoginScreenStatus.wait
        ..update(updates),
    );
  }

  @nullable
  @BuiltValueField(serialize: false)
  LoginScreenStatus get loginScreenStatus;

  bool get rememberStatus;

  static Serializer<LoginState> get serializer => _$loginStateSerializer;
}
