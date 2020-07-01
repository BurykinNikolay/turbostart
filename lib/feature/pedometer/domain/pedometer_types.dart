import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pedometer_types.g.dart';

class PedometerTypes extends EnumClass {
  static const PedometerTypes iam = _$iam;
  static const PedometerTypes macroregion = _$macroregion;

  const PedometerTypes._(String name) : super(name);

  static BuiltSet<PedometerTypes> get values => _$pedometerTypesValues;

  static PedometerTypes valueOf(String name) => _$pedometerTypesValueOf(name);

  static int toIndex(PedometerTypes tab) {
    switch (tab) {
      case PedometerTypes.iam:
        return 0;
      case PedometerTypes.macroregion:
        return 1;
      default:
        return 0;
    }
  }

  static PedometerTypes fromIndex(int index) {
    switch (index) {
      case 0:
        return PedometerTypes.iam;
      case 1:
        return PedometerTypes.macroregion;
      default:
        return PedometerTypes.iam;
    }
  }

  static Serializer<PedometerTypes> get serializer => _$pedometerTypesSerializer;
}
