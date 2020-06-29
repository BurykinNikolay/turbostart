import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:turbostart/domain/models/user_info.dart';
import 'package:turbostart/feature/auth/repository/login_repository.dart';
import 'package:turbostart/feature/auth/repository/models/login_response.dart';

import 'error_model.dart';
import 'meta.dart';
import 'remote_config.dart';

part 'network_serializers.g.dart';

@SerializersFor([Meta, ErrorModel, RemoteConfig, LoginRequest, LoginResponse, UserInfoResponse, UserInfo])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(
        StandardJsonPlugin(),
      ))
    .build();
