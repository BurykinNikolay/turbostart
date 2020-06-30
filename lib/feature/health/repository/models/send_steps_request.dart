import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:turbostart/data/network/models/base_model.dart';
import 'package:turbostart/domain/models/steps.dart';

part 'send_steps_request.g.dart';

abstract class SendStepsRequest implements BaseModel, Built<SendStepsRequest, SendStepsRequestBuilder> {
  SendStepsRequest._();

  factory SendStepsRequest([updates(SendStepsRequestBuilder builder)]) = _$SendStepsRequest;

  @nullable
  BuiltList<Steps> get data;

  static Serializer<SendStepsRequest> get serializer => _$sendStepsRequestSerializer;
}
