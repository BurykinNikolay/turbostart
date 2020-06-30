import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:turbostart/domain/domain_serializer.dart';
import 'package:turbostart/domain/models/steps.dart';

part 'health_state.g.dart';

abstract class HealthState implements Built<HealthState, HealthStateBuilder> {
  HealthState._();
  factory HealthState([Function(HealthStateBuilder builder) updates]) {
    return _$HealthState(
      (builder) => builder..update(updates),
    );
  }

  @nullable
  BuiltList<Steps> get steps;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(HealthState.serializer, this);
  }

  static HealthState fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(HealthState.serializer, json);
  }

  static Serializer<HealthState> get serializer => _$healthStateSerializer;
}
