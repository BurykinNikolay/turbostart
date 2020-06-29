import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'domain.dart';
import 'models/user_info.dart';
import 'states/user_state.dart';

part 'domain_serializer.g.dart';

@SerializersFor(const [
  AppState,
  UserState,
  UserInfo,
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
