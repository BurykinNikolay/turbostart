// GENERATED CODE - DO NOT MODIFY BY HAND

part of base_api_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class BaseApiResponseBuilder<T> implements BaseModelBuilder {
  void replace(covariant BaseApiResponse<T> other);
  void update(void Function(BaseApiResponseBuilder<T>) updates);
  T get result;
  set result(T result);

  MetaBuilder get meta;
  set meta(MetaBuilder meta);

  ErrorModelBuilder get error;
  set error(ErrorModelBuilder error);

  int get httpCode;
  set httpCode(int httpCode);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
