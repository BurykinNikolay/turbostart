// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialog_bundle.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DialogBundle> _$dialogBundleSerializer =
    new _$DialogBundleSerializer();

class _$DialogBundleSerializer implements StructuredSerializer<DialogBundle> {
  @override
  final Iterable<Type> types = const [DialogBundle, _$DialogBundle];
  @override
  final String wireName = 'DialogBundle';

  @override
  Iterable<Object> serialize(Serializers serializers, DialogBundle object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.dialog != null) {
      result
        ..add('dialog')
        ..add(serializers.serialize(object.dialog,
            specifiedType: const FullType(String)));
    }
    if (object.payload != null) {
      result
        ..add('payload')
        ..add(serializers.serialize(object.payload,
            specifiedType: const FullType(String)));
    }
    if (object.screenTitle != null) {
      result
        ..add('screenTitle')
        ..add(serializers.serialize(object.screenTitle,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  DialogBundle deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DialogBundleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'dialog':
          result.dialog = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'payload':
          result.payload = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'screenTitle':
          result.screenTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DialogBundle extends DialogBundle {
  @override
  final String dialog;
  @override
  final String payload;
  @override
  final String screenTitle;
  @override
  final Object bundle;

  factory _$DialogBundle([void Function(DialogBundleBuilder) updates]) =>
      (new DialogBundleBuilder()..update(updates)).build();

  _$DialogBundle._({this.dialog, this.payload, this.screenTitle, this.bundle})
      : super._();

  @override
  DialogBundle rebuild(void Function(DialogBundleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DialogBundleBuilder toBuilder() => new DialogBundleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DialogBundle &&
        dialog == other.dialog &&
        payload == other.payload &&
        screenTitle == other.screenTitle &&
        bundle == other.bundle;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, dialog.hashCode), payload.hashCode),
            screenTitle.hashCode),
        bundle.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DialogBundle')
          ..add('dialog', dialog)
          ..add('payload', payload)
          ..add('screenTitle', screenTitle)
          ..add('bundle', bundle))
        .toString();
  }
}

class DialogBundleBuilder
    implements Builder<DialogBundle, DialogBundleBuilder> {
  _$DialogBundle _$v;

  String _dialog;
  String get dialog => _$this._dialog;
  set dialog(String dialog) => _$this._dialog = dialog;

  String _payload;
  String get payload => _$this._payload;
  set payload(String payload) => _$this._payload = payload;

  String _screenTitle;
  String get screenTitle => _$this._screenTitle;
  set screenTitle(String screenTitle) => _$this._screenTitle = screenTitle;

  Object _bundle;
  Object get bundle => _$this._bundle;
  set bundle(Object bundle) => _$this._bundle = bundle;

  DialogBundleBuilder();

  DialogBundleBuilder get _$this {
    if (_$v != null) {
      _dialog = _$v.dialog;
      _payload = _$v.payload;
      _screenTitle = _$v.screenTitle;
      _bundle = _$v.bundle;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DialogBundle other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DialogBundle;
  }

  @override
  void update(void Function(DialogBundleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DialogBundle build() {
    final _$result = _$v ??
        new _$DialogBundle._(
            dialog: dialog,
            payload: payload,
            screenTitle: screenTitle,
            bundle: bundle);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
