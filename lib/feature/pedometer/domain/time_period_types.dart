import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'time_period_types.g.dart';

class TimePeriodTypes extends EnumClass {
  static const TimePeriodTypes week = _$week;
  static const TimePeriodTypes month = _$month;
  static const TimePeriodTypes allTime = _$allTime;
  const TimePeriodTypes._(String name) : super(name);

  static BuiltSet<TimePeriodTypes> get values => _$timePeriodTypesValues;

  static TimePeriodTypes valueOf(String name) => _$timePeriodTypesValueOf(name);

  static Serializer<TimePeriodTypes> get serializer => _$timePeriodTypesSerializer;
}
