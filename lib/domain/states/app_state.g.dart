// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable<Object> serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'activeTab',
      serializers.serialize(object.activeTab,
          specifiedType: const FullType(AppTab)),
      'navigationState',
      serializers.serialize(object.navigationState,
          specifiedType: const FullType(NavigationState)),
      'loginState',
      serializers.serialize(object.loginState,
          specifiedType: const FullType(LoginState)),
      'userState',
      serializers.serialize(object.userState,
          specifiedType: const FullType(UserState)),
      'healthState',
      serializers.serialize(object.healthState,
          specifiedType: const FullType(HealthState)),
    ];
    if (object.apiUrl != null) {
      result
        ..add('apiUrl')
        ..add(serializers.serialize(object.apiUrl,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'activeTab':
          result.activeTab = serializers.deserialize(value,
              specifiedType: const FullType(AppTab)) as AppTab;
          break;
        case 'navigationState':
          result.navigationState.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NavigationState))
              as NavigationState);
          break;
        case 'loginState':
          result.loginState.replace(serializers.deserialize(value,
              specifiedType: const FullType(LoginState)) as LoginState);
          break;
        case 'userState':
          result.userState.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserState)) as UserState);
          break;
        case 'healthState':
          result.healthState.replace(serializers.deserialize(value,
              specifiedType: const FullType(HealthState)) as HealthState);
          break;
        case 'apiUrl':
          result.apiUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final AppTab activeTab;
  @override
  final NavigationState navigationState;
  @override
  final LoginState loginState;
  @override
  final UserState userState;
  @override
  final HealthState healthState;
  @override
  final String apiUrl;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.activeTab,
      this.navigationState,
      this.loginState,
      this.userState,
      this.healthState,
      this.apiUrl})
      : super._() {
    if (activeTab == null) {
      throw new BuiltValueNullFieldError('AppState', 'activeTab');
    }
    if (navigationState == null) {
      throw new BuiltValueNullFieldError('AppState', 'navigationState');
    }
    if (loginState == null) {
      throw new BuiltValueNullFieldError('AppState', 'loginState');
    }
    if (userState == null) {
      throw new BuiltValueNullFieldError('AppState', 'userState');
    }
    if (healthState == null) {
      throw new BuiltValueNullFieldError('AppState', 'healthState');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        activeTab == other.activeTab &&
        navigationState == other.navigationState &&
        loginState == other.loginState &&
        userState == other.userState &&
        healthState == other.healthState &&
        apiUrl == other.apiUrl;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, activeTab.hashCode), navigationState.hashCode),
                    loginState.hashCode),
                userState.hashCode),
            healthState.hashCode),
        apiUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('activeTab', activeTab)
          ..add('navigationState', navigationState)
          ..add('loginState', loginState)
          ..add('userState', userState)
          ..add('healthState', healthState)
          ..add('apiUrl', apiUrl))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  AppTab _activeTab;
  AppTab get activeTab => _$this._activeTab;
  set activeTab(AppTab activeTab) => _$this._activeTab = activeTab;

  NavigationStateBuilder _navigationState;
  NavigationStateBuilder get navigationState =>
      _$this._navigationState ??= new NavigationStateBuilder();
  set navigationState(NavigationStateBuilder navigationState) =>
      _$this._navigationState = navigationState;

  LoginStateBuilder _loginState;
  LoginStateBuilder get loginState =>
      _$this._loginState ??= new LoginStateBuilder();
  set loginState(LoginStateBuilder loginState) =>
      _$this._loginState = loginState;

  UserStateBuilder _userState;
  UserStateBuilder get userState =>
      _$this._userState ??= new UserStateBuilder();
  set userState(UserStateBuilder userState) => _$this._userState = userState;

  HealthStateBuilder _healthState;
  HealthStateBuilder get healthState =>
      _$this._healthState ??= new HealthStateBuilder();
  set healthState(HealthStateBuilder healthState) =>
      _$this._healthState = healthState;

  String _apiUrl;
  String get apiUrl => _$this._apiUrl;
  set apiUrl(String apiUrl) => _$this._apiUrl = apiUrl;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _activeTab = _$v.activeTab;
      _navigationState = _$v.navigationState?.toBuilder();
      _loginState = _$v.loginState?.toBuilder();
      _userState = _$v.userState?.toBuilder();
      _healthState = _$v.healthState?.toBuilder();
      _apiUrl = _$v.apiUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              activeTab: activeTab,
              navigationState: navigationState.build(),
              loginState: loginState.build(),
              userState: userState.build(),
              healthState: healthState.build(),
              apiUrl: apiUrl);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'navigationState';
        navigationState.build();
        _$failedField = 'loginState';
        loginState.build();
        _$failedField = 'userState';
        userState.build();
        _$failedField = 'healthState';
        healthState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
