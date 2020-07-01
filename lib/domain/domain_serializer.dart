import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:turbostart/feature/auth/domain/login_domain.dart';
import 'package:turbostart/feature/health/domain/health_state.dart';
import 'package:turbostart/feature/navigation/domain/navigation_domain.dart';
import 'package:turbostart/feature/pedometer/pedometer.dart';

import 'domain.dart';
import 'models/steps.dart';
import 'models/user_info.dart';
import 'states/user_state.dart';

part 'domain_serializer.g.dart';

@SerializersFor(const [
  AppState,
  UserState,
  UserInfo,
  AppTab,
  NavigationState,
  HealthState,
  Steps,
  StepsState,
  StepsData,
  PedometerState,
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
