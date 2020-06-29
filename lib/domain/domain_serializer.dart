import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:turbostart/feature/auth/domain/login_domain.dart';
import 'package:turbostart/feature/navigation/domain/navigation_domain.dart';

import 'domain.dart';
import 'models/user_info.dart';
import 'states/user_state.dart';

part 'domain_serializer.g.dart';

@SerializersFor(const [
  AppState,
  UserState,
  UserInfo,
  AppTab,
  NavigationState,
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
