import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'steps.g.dart';

abstract class Steps implements Built<Steps, StepsBuilder> {
  Steps._();
  factory Steps([updates(StepsBuilder builder)]) = _$Steps;

  @nullable
  int get steps;
  @nullable
  int get date;

  static Serializer<Steps> get serializer => _$stepsSerializer;
}
