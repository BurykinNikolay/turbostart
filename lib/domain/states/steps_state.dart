import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../domain.dart';

part 'steps_state.g.dart';

abstract class StepsState implements Built<StepsState, StepsStateBuilder> {
  StepsState._();

  factory StepsState([updates(StepsStateBuilder b)]) = _$StepsState;

  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;
  @nullable
  @BuiltValueField(wireName: 'steps_user_today')
  int get stepsUserToday;
  @nullable
  @BuiltValueField(wireName: 'steps_user_all')
  int get stepsUserAll;
  @nullable
  @BuiltValueField(wireName: 'steps_macroregion_today')
  int get stepsMacroregionToday;
  @nullable
  @BuiltValueField(wireName: 'steps_macroregion_all')
  int get stepsMacroregionAll;
  @nullable
  @BuiltValueField(wireName: 'steps_user_data')
  BuiltList<StepsData> get stepsUserData;
  @nullable
  @BuiltValueField(wireName: 'steps_macroregion_data')
  BuiltList<StepsData> get stepsMacroregionData;

  static Serializer<StepsState> get serializer => _$stepsStateSerializer;
}
