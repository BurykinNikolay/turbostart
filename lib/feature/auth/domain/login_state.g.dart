// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LoginState> _$loginStateSerializer = new _$LoginStateSerializer();

class _$LoginStateSerializer implements StructuredSerializer<LoginState> {
  @override
  final Iterable<Type> types = const [LoginState, _$LoginState];
  @override
  final String wireName = 'LoginState';

  @override
  Iterable<Object> serialize(Serializers serializers, LoginState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'rememberStatus',
      serializers.serialize(object.rememberStatus,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  LoginState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'rememberStatus':
          result.rememberStatus = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$LoginState extends LoginState {
  @override
  final LoginScreenStatus loginScreenStatus;
  @override
  final bool rememberStatus;

  factory _$LoginState([void Function(LoginStateBuilder) updates]) =>
      (new LoginStateBuilder()..update(updates)).build();

  _$LoginState._({this.loginScreenStatus, this.rememberStatus}) : super._() {
    if (rememberStatus == null) {
      throw new BuiltValueNullFieldError('LoginState', 'rememberStatus');
    }
  }

  @override
  LoginState rebuild(void Function(LoginStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginStateBuilder toBuilder() => new LoginStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginState &&
        loginScreenStatus == other.loginScreenStatus &&
        rememberStatus == other.rememberStatus;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, loginScreenStatus.hashCode), rememberStatus.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginState')
          ..add('loginScreenStatus', loginScreenStatus)
          ..add('rememberStatus', rememberStatus))
        .toString();
  }
}

class LoginStateBuilder implements Builder<LoginState, LoginStateBuilder> {
  _$LoginState _$v;

  LoginScreenStatus _loginScreenStatus;
  LoginScreenStatus get loginScreenStatus => _$this._loginScreenStatus;
  set loginScreenStatus(LoginScreenStatus loginScreenStatus) =>
      _$this._loginScreenStatus = loginScreenStatus;

  bool _rememberStatus;
  bool get rememberStatus => _$this._rememberStatus;
  set rememberStatus(bool rememberStatus) =>
      _$this._rememberStatus = rememberStatus;

  LoginStateBuilder();

  LoginStateBuilder get _$this {
    if (_$v != null) {
      _loginScreenStatus = _$v.loginScreenStatus;
      _rememberStatus = _$v.rememberStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginState;
  }

  @override
  void update(void Function(LoginStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginState build() {
    final _$result = _$v ??
        new _$LoginState._(
            loginScreenStatus: loginScreenStatus,
            rememberStatus: rememberStatus);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
