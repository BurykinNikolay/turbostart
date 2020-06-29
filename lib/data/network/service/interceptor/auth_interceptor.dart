import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:turbostart/app_starter.dart';

import 'package:turbostart/di/provider/store_provider.dart';

import 'interceptor.dart';

const contentTypeHeader = 'application/x-www-form-urlencoded; charset=UTF-8';

class AuthInterceptor implements Interceptor {
  final StoreProvider _storeProvider = di.singleton<StoreProvider>();

  @override
  Request intercept(Request request) {
    debugPrint("${_storeProvider.hashCode}");
    final token = _storeProvider.store.state.userState.token;
    request.headers.update('content-type', (update) => contentTypeHeader, ifAbsent: () => contentTypeHeader);
    request.headers.update('x-auth-token', (update) => token, ifAbsent: () => token);
    return request;
  }

  @override
  String toString() {
    return '$runtimeType';
  }
}
