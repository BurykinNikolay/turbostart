import 'package:built_value/serializer.dart';
import 'package:built_value/built_value.dart';

part 'dialog_bundle.g.dart';

abstract class DialogBundle
    implements Built<DialogBundle, DialogBundleBuilder> {
  DialogBundle._();

  factory DialogBundle([updates(DialogBundleBuilder buider)]) = _$DialogBundle;

  @nullable
  String get dialog;

  @nullable
  String get payload;

  @nullable
  String get screenTitle;

  @BuiltValueField(serialize: false)
  @nullable
  Object get bundle;
  static Serializer<DialogBundle> get serializer => _$dialogBundleSerializer;
}
