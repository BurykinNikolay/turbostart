// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NavigationState> _$navigationStateSerializer =
    new _$NavigationStateSerializer();

class _$NavigationStateSerializer
    implements StructuredSerializer<NavigationState> {
  @override
  final Iterable<Type> types = const [NavigationState, _$NavigationState];
  @override
  final String wireName = 'NavigationState';

  @override
  Iterable<Object> serialize(Serializers serializers, NavigationState object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  NavigationState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new NavigationStateBuilder().build();
  }
}

class _$NavigationState extends NavigationState {
  @override
  final GlobalKey<NavigatorState> rootNavigatorKey;

  factory _$NavigationState([void Function(NavigationStateBuilder) updates]) =>
      (new NavigationStateBuilder()..update(updates)).build();

  _$NavigationState._({this.rootNavigatorKey}) : super._();

  @override
  NavigationState rebuild(void Function(NavigationStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationStateBuilder toBuilder() =>
      new NavigationStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationState &&
        rootNavigatorKey == other.rootNavigatorKey;
  }

  @override
  int get hashCode {
    return $jf($jc(0, rootNavigatorKey.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigationState')
          ..add('rootNavigatorKey', rootNavigatorKey))
        .toString();
  }
}

class NavigationStateBuilder
    implements Builder<NavigationState, NavigationStateBuilder> {
  _$NavigationState _$v;

  GlobalKey<NavigatorState> _rootNavigatorKey;
  GlobalKey<NavigatorState> get rootNavigatorKey => _$this._rootNavigatorKey;
  set rootNavigatorKey(GlobalKey<NavigatorState> rootNavigatorKey) =>
      _$this._rootNavigatorKey = rootNavigatorKey;

  NavigationStateBuilder();

  NavigationStateBuilder get _$this {
    if (_$v != null) {
      _rootNavigatorKey = _$v.rootNavigatorKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NavigationState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigationState;
  }

  @override
  void update(void Function(NavigationStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigationState build() {
    final _$result =
        _$v ?? new _$NavigationState._(rootNavigatorKey: rootNavigatorKey);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
