// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final AppTab activeTab;
  @override
  final NavigationState navigationState;
  @override
  final AppTheme appTheme;
  @override
  final LoginState loginState;
  @override
  final UserState userState;
  @override
  final String apiUrl;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.activeTab,
      this.navigationState,
      this.appTheme,
      this.loginState,
      this.userState,
      this.apiUrl})
      : super._() {
    if (activeTab == null) {
      throw new BuiltValueNullFieldError('AppState', 'activeTab');
    }
    if (navigationState == null) {
      throw new BuiltValueNullFieldError('AppState', 'navigationState');
    }
    if (appTheme == null) {
      throw new BuiltValueNullFieldError('AppState', 'appTheme');
    }
    if (loginState == null) {
      throw new BuiltValueNullFieldError('AppState', 'loginState');
    }
    if (userState == null) {
      throw new BuiltValueNullFieldError('AppState', 'userState');
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
        appTheme == other.appTheme &&
        loginState == other.loginState &&
        userState == other.userState &&
        apiUrl == other.apiUrl;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, activeTab.hashCode), navigationState.hashCode),
                    appTheme.hashCode),
                loginState.hashCode),
            userState.hashCode),
        apiUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('activeTab', activeTab)
          ..add('navigationState', navigationState)
          ..add('appTheme', appTheme)
          ..add('loginState', loginState)
          ..add('userState', userState)
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

  AppTheme _appTheme;
  AppTheme get appTheme => _$this._appTheme;
  set appTheme(AppTheme appTheme) => _$this._appTheme = appTheme;

  LoginStateBuilder _loginState;
  LoginStateBuilder get loginState =>
      _$this._loginState ??= new LoginStateBuilder();
  set loginState(LoginStateBuilder loginState) =>
      _$this._loginState = loginState;

  UserStateBuilder _userState;
  UserStateBuilder get userState =>
      _$this._userState ??= new UserStateBuilder();
  set userState(UserStateBuilder userState) => _$this._userState = userState;

  String _apiUrl;
  String get apiUrl => _$this._apiUrl;
  set apiUrl(String apiUrl) => _$this._apiUrl = apiUrl;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _activeTab = _$v.activeTab;
      _navigationState = _$v.navigationState?.toBuilder();
      _appTheme = _$v.appTheme;
      _loginState = _$v.loginState?.toBuilder();
      _userState = _$v.userState?.toBuilder();
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
              appTheme: appTheme,
              loginState: loginState.build(),
              userState: userState.build(),
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
