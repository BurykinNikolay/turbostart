// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_sheet_bundle.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BottomSheetBundle extends BottomSheetBundle {
  @override
  final String bottomSheet;
  @override
  final String payload;
  @override
  final String screenTitle;
  @override
  final Object bundle;

  factory _$BottomSheetBundle(
          [void Function(BottomSheetBundleBuilder) updates]) =>
      (new BottomSheetBundleBuilder()..update(updates)).build();

  _$BottomSheetBundle._(
      {this.bottomSheet, this.payload, this.screenTitle, this.bundle})
      : super._();

  @override
  BottomSheetBundle rebuild(void Function(BottomSheetBundleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BottomSheetBundleBuilder toBuilder() =>
      new BottomSheetBundleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BottomSheetBundle &&
        bottomSheet == other.bottomSheet &&
        payload == other.payload &&
        screenTitle == other.screenTitle &&
        bundle == other.bundle;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, bottomSheet.hashCode), payload.hashCode),
            screenTitle.hashCode),
        bundle.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BottomSheetBundle')
          ..add('bottomSheet', bottomSheet)
          ..add('payload', payload)
          ..add('screenTitle', screenTitle)
          ..add('bundle', bundle))
        .toString();
  }
}

class BottomSheetBundleBuilder
    implements Builder<BottomSheetBundle, BottomSheetBundleBuilder> {
  _$BottomSheetBundle _$v;

  String _bottomSheet;
  String get bottomSheet => _$this._bottomSheet;
  set bottomSheet(String bottomSheet) => _$this._bottomSheet = bottomSheet;

  String _payload;
  String get payload => _$this._payload;
  set payload(String payload) => _$this._payload = payload;

  String _screenTitle;
  String get screenTitle => _$this._screenTitle;
  set screenTitle(String screenTitle) => _$this._screenTitle = screenTitle;

  Object _bundle;
  Object get bundle => _$this._bundle;
  set bundle(Object bundle) => _$this._bundle = bundle;

  BottomSheetBundleBuilder();

  BottomSheetBundleBuilder get _$this {
    if (_$v != null) {
      _bottomSheet = _$v.bottomSheet;
      _payload = _$v.payload;
      _screenTitle = _$v.screenTitle;
      _bundle = _$v.bundle;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BottomSheetBundle other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BottomSheetBundle;
  }

  @override
  void update(void Function(BottomSheetBundleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BottomSheetBundle build() {
    final _$result = _$v ??
        new _$BottomSheetBundle._(
            bottomSheet: bottomSheet,
            payload: payload,
            screenTitle: screenTitle,
            bundle: bundle);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
