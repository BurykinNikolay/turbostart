import 'dart:convert';
import 'package:dioc/dioc.dart';

import 'package:rxdart/rxdart.dart';
import 'package:turbostart/data/network/models/network_serializers.dart';
import 'package:turbostart/data/network/models/rest_bundle.dart';
import 'package:turbostart/data/network/service/rest_service.dart';
import 'package:turbostart/data/network/url/url_factory.dart';
import 'package:turbostart/di/provider/store_provider.dart';
import 'package:turbostart/feature/auth/repository/endpoint/push_token_endpoint.dart';
import 'package:turbostart/feature/logger/logger.dart';
import 'package:turbostart/utilities/isolate_manager/isolate_manager_mixin.dart';

import 'endpoint/login_endpoint.dart';
import 'endpoint/user_info_endpoint.dart';
import 'models/login_request.dart';
import 'models/login_response.dart';
import 'models/set_push_token_response.dart';
import 'models/user_info_response.dart';

export 'models/login_request.dart';
export 'models/login_response.dart';
export 'models/user_info_response.dart';

export 'models/user_info_response.dart';

abstract class LoginRepository {
  Stream<LoginResponse> makeLoginRequest({LoginRequest request, Duration timeout});
  Stream<UserInfoResponse> getUserInfoRequest({Duration timeout});
  Stream<SetPushTokenResponse> setPushToken({String request, Duration timeout});
}

class LoginRepositoryImpl with IsolateManagerMixin implements LoginRepository {
  LoginRepositoryImpl(this._storeProvider, this._restService, this._urlFactory);

  @Inject()
  final StoreProvider _storeProvider;

  @Inject(mode: InjectMode.singleton)
  final RestService _restService;

  @Inject()
  final UrlFactory _urlFactory;

  @override
  Stream<LoginResponse> makeLoginRequest({LoginRequest request, Duration timeout}) {
    final inputSubject = BehaviorSubject<RestBundle>();
    final outputSubject = BehaviorSubject<LoginResponse>();
    subscribe(inputSubject, outputSubject, mapLoginRestBundle);
    _makeLoginRequest(input: inputSubject, output: outputSubject, request: request, timeout: timeout);
    return outputSubject.map((output) => output.rebuild((b) => b.request.replace(request)));
  }

  void _makeLoginRequest({Subject<RestBundle> input, Subject output, LoginRequest request, Duration timeout}) {
    final endpoint = LoginEndpoint(storeProvider: _storeProvider);
    final url = _urlFactory.createFor<LoginEndpoint>(endpoint);
    final requestString = "email=${request.userName}&password=${request.password}";
    executeRestStringRequest(input, output, _restService, url, requestString, LoginResponse.serializer, timeout);
  }

  @override
  Stream<UserInfoResponse> getUserInfoRequest({Duration timeout}) {
    final inputSubject = BehaviorSubject<RestBundle>();
    final outputSubject = BehaviorSubject<UserInfoResponse>();
    subscribe(inputSubject, outputSubject, mapGetUserInfoRestBundle);
    _getUserInfoRequest(input: inputSubject, output: outputSubject, timeout: timeout);
    return outputSubject.map((output) => output);
  }

  void _getUserInfoRequest({Subject<RestBundle> input, Subject output, Duration timeout}) {
    final endpoint = UserInfoEndpoint(storeProvider: _storeProvider);
    final url = _urlFactory.createFor<UserInfoEndpoint>(endpoint);
    executeRestStringRequest(input, output, _restService, url, "", UserInfoResponse.serializer, timeout);
  }

  @override
  Stream<SetPushTokenResponse> setPushToken({String request, Duration timeout}) {
    final inputSubject = BehaviorSubject<RestBundle>();
    final outputSubject = BehaviorSubject<SetPushTokenResponse>();
    subscribe(inputSubject, outputSubject, mapSetPushResponseRestBundle);
    _setPushTokenRequest(input: inputSubject, token: request, output: outputSubject, timeout: timeout);
    return outputSubject.map((output) => output);
  }

  void _setPushTokenRequest({Subject<RestBundle> input, String token, Subject output, Duration timeout}) {
    final endpoint = PushTokenEndpoint(storeProvider: _storeProvider);
    final url = _urlFactory.createFor<PushTokenEndpoint>(endpoint);
    executeRestStringRequest(input, output, _restService, url, "token=$token", SetPushTokenResponse.serializer, timeout);
  }
}

LoginResponse mapLoginRestBundle(RestBundle bundle) {
  if (bundle.status == 302) {
    return LoginResponse((builder) => builder.httpCode = bundle.status);
  }
  try {
    final json = jsonDecode(bundle?.data ?? "");
    LoginResponse response = serializers.deserializeWith(bundle.serializer, json["data"]);
    return response.rebuild((builder) => builder
      ..httpCode = bundle.status
      ..status = json["status"]);
  } catch (err) {
    final json = jsonDecode(bundle?.data ?? "");
    logger.e("mapRestBundle $err");
    return LoginResponse((builder) => builder
      ..httpCode = bundle.status
      ..status = json["status"]
      ..message = json["message"].toString());
  }
}

UserInfoResponse mapGetUserInfoRestBundle(RestBundle bundle) {
  if (bundle.status == 302) {
    return UserInfoResponse((builder) => builder.httpCode = bundle.status);
  }
  try {
    UserInfoResponse response = serializers.deserializeWith(bundle.serializer, jsonDecode(bundle?.data ?? ""));
    return response.rebuild((builder) => builder.httpCode = bundle.status);
  } catch (err) {
    final json = jsonDecode(bundle?.data ?? "");
    logger.e("mapRestBundle $err");
    return UserInfoResponse((builder) => builder
      ..httpCode = bundle.status
      ..message = json["message"].toString());
  }
}

SetPushTokenResponse mapSetPushResponseRestBundle(RestBundle bundle) {
  if (bundle.status == 302) {
    return SetPushTokenResponse((builder) => builder.httpCode = bundle.status);
  }
  try {
    SetPushTokenResponse response = serializers.deserializeWith(bundle.serializer, jsonDecode(bundle?.data ?? ""));
    return response.rebuild((builder) => builder.httpCode = bundle.status);
  } catch (err) {
    final json = jsonDecode(bundle?.data ?? "");
    logger.e("mapRestBundle $err");
    return SetPushTokenResponse((builder) => builder
      ..httpCode = bundle.status
      ..message = json["message"].toString());
  }
}
