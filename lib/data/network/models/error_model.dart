import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'error_model.g.dart';

abstract class ErrorModel implements Built<ErrorModel, ErrorModelBuilder> {
  ErrorModel._();

  factory ErrorModel([updates(ErrorModelBuilder builder)]) {
    return _$ErrorModel((builder) => builder
      .._errorTime = DateTime.now().toIso8601String()
      ..update(updates));
  }

  @nullable
  String get message;

  @nullable
  int get code;

  @nullable
  int get httpCode;

  @nullable
  String get errorTime;

  @override
  String toString() => "ErrorModel(message: $message code: $code)";

  static Serializer<ErrorModel> get serializer => _$errorModelSerializer;
}
