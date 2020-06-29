library base_model;

import 'package:built_value/built_value.dart';

import 'error_model.dart';
import 'meta.dart';

export 'error_model.dart';
export 'meta.dart';

part 'base_model.g.dart';

@BuiltValue(instantiable: false)
abstract class BaseModel {
  @nullable
  Meta get meta;

  @BuiltValueField(wireName: 'error')
  @nullable
  ErrorModel get error;

  @BuiltValueField(wireName: 'httpCode')
  @nullable
  int get httpCode;
}
