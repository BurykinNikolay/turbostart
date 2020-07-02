import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:turbostart/di/provider/store_provider.dart';

import '../../app_starter.dart';

class PushService {
  final StoreProvider _storeProvider = di.singleton<StoreProvider>();

  PushService._();

  factory PushService() => _instance;

  static final PushService _instance = PushService._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool _initialized = false;

  Future<void> init() async {
    if (!_initialized) {
      // For iOS request permission first.
      _firebaseMessaging.requestNotificationPermissions();
      _firebaseMessaging.configure();

      // For testing purposes print the Firebase Messaging token
      String token = await _firebaseMessaging.getToken();
      print("FirebaseMessaging token: $token");

      _storeProvider.store.actions.login.setPushToken(token);

      _initialized = true;
    }
  }
}
