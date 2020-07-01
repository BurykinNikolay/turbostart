import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:turbostart/data/network/models/base_model.dart';

import 'package:turbostart/domain/domain.dart';

part 'get_steps_response.g.dart';

abstract class GetStepsResponse implements BaseModel, Built<GetStepsResponse, GetStepsResponseBuilder> {
  GetStepsResponse._();

  factory GetStepsResponse([updates(GetStepsResponseBuilder b)]) = _$GetStepsResponse;

  @nullable
  @BuiltValueField(wireName: 'status')
  String get status;
  @nullable
  @BuiltValueField(wireName: 'data')
  StepsState get data;

  @nullable
  @BuiltValueField(wireName: 'message')
  String get message;

  static Serializer<GetStepsResponse> get serializer => _$getStepsResponseSerializer;
}
