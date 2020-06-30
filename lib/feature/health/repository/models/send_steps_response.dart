import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:turbostart/data/network/models/base_model.dart';

import 'send_steps_request.dart';

part 'send_steps_response.g.dart';

abstract class SendStepsResponse implements BaseModel, Built<SendStepsResponse, SendStepsResponseBuilder> {
  SendStepsResponse._();

  factory SendStepsResponse([updates(SendStepsResponseBuilder builder)]) = _$SendStepsResponse;

  @nullable
  SendStepsRequest get request;

  @nullable
  String get message;

  @nullable
  String get timestamp;

  @nullable
  @BuiltValueField(wireName: 'status')
  String get status;

  static Serializer<SendStepsResponse> get serializer => _$sendStepsResponseSerializer;
}
