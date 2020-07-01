import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'steps_data.g.dart';

abstract class StepsData implements Built<StepsData, StepsDataBuilder> {
  StepsData._();

  factory StepsData([updates(StepsDataBuilder b)]) = _$StepsData;

  @nullable
  @BuiltValueField(wireName: 'date')
  String get date;
  @nullable
  @BuiltValueField(wireName: 'steps')
  String get steps;

  static Serializer<StepsData> get serializer => _$stepsDataSerializer;
}
