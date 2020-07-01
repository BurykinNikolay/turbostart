import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:turbostart/domain/domain.dart';
import 'package:turbostart/domain/models/steps.dart';
import 'package:turbostart/domain/models/steps_data.dart';
import 'package:turbostart/domain/models/user_info.dart';
import 'package:turbostart/feature/auth/repository/login_repository.dart';
import 'package:turbostart/feature/auth/repository/models/login_response.dart';
import 'package:turbostart/feature/health/health.dart';

import 'error_model.dart';
import 'meta.dart';
import 'remote_config.dart';

part 'network_serializers.g.dart';

@SerializersFor([
  Meta,
  ErrorModel,
  RemoteConfig,
  LoginRequest,
  LoginResponse,
  UserInfoResponse,
  UserInfo,
  SendStepsResponse,
  SendStepsRequest,
  GetStepsResponse,
  Steps,
  StepsState,
  StepsData,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(
        StandardJsonPlugin(),
      ))
    .build();
