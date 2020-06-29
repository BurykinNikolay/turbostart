library base_api_response;

import 'package:built_value/built_value.dart';

import 'base_model.dart';

export 'error_model.dart';
export 'meta.dart';

part 'base_api_response.g.dart';

@BuiltValue(instantiable: false)
abstract class BaseApiResponse<T> implements BaseModel {
  @nullable
  T get result;
}
