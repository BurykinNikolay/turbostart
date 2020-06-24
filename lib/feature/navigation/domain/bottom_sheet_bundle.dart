import 'package:built_value/built_value.dart';

part 'bottom_sheet_bundle.g.dart';

abstract class BottomSheetBundle implements Built<BottomSheetBundle, BottomSheetBundleBuilder> {
  BottomSheetBundle._();

  factory BottomSheetBundle([updates(BottomSheetBundleBuilder buider)]) = _$BottomSheetBundle;

  @nullable
  String get bottomSheet;

  @nullable
  String get payload;

  @nullable
  String get screenTitle;

  @BuiltValueField(serialize: false)
  @nullable
  Object get bundle;
}
