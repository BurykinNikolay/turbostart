import 'dart:convert';
import 'package:dioc/dioc.dart';

import 'package:rxdart/rxdart.dart';
import 'package:turbostart/data/network/models/network_serializers.dart';
import 'package:turbostart/data/network/models/rest_bundle.dart';
import 'package:turbostart/data/network/service/rest_service.dart';
import 'package:turbostart/data/network/url/url_factory.dart';
import 'package:turbostart/di/provider/store_provider.dart';
import 'package:turbostart/feature/logger/logger.dart';
import 'package:turbostart/utilities/isolate_manager/isolate_manager_mixin.dart';

import 'endpoint/send_steps_endpoint.dart';
import 'models/send_steps_request.dart';
import 'models/send_steps_response.dart';

export 'models/send_steps_request.dart';
export 'models/send_steps_response.dart';

abstract class HealthRepository {
  Stream<SendStepsResponse> sendSteps({SendStepsRequest request, Duration timeout});
}

class HealthRepositoryImpl with IsolateManagerMixin implements HealthRepository {
  HealthRepositoryImpl(this._storeProvider, this._restService, this._urlFactory);

  @Inject()
  final StoreProvider _storeProvider;

  @Inject(mode: InjectMode.singleton)
  final RestService _restService;

  @Inject()
  final UrlFactory _urlFactory;

  @override
  Stream<SendStepsResponse> sendSteps({SendStepsRequest request, Duration timeout}) {
    final inputSubject = BehaviorSubject<RestBundle>();
    final outputSubject = BehaviorSubject<SendStepsResponse>();
    subscribe(inputSubject, outputSubject, mapSendStepsRestBundle);
    _makeSendStepsRequest(input: inputSubject, output: outputSubject, request: request, timeout: timeout);
    return outputSubject.map((output) => output.rebuild((b) => b.request.replace(request)));
  }

  void _makeSendStepsRequest({Subject<RestBundle> input, Subject output, SendStepsRequest request, Duration timeout}) {
    final endpoint = SendStepsEndpoint(storeProvider: _storeProvider);
    final url = _urlFactory.createFor<SendStepsEndpoint>(endpoint);
    executeRestRequest(input, output, _restService, url, request, SendStepsResponse.serializer, timeout);
  }
}

SendStepsResponse mapSendStepsRestBundle(RestBundle bundle) {
  if (bundle.status == 302) {
    return SendStepsResponse((builder) => builder.httpCode = bundle.status);
  }
  try {
    final json = jsonDecode(bundle?.data ?? "");
    SendStepsResponse response = serializers.deserializeWith(bundle.serializer, json["data"]);
    return response.rebuild((builder) => builder
      ..httpCode = bundle.status
      ..status = json["status"]);
  } catch (err) {
    final json = jsonDecode(bundle?.data ?? "");
    logger.e("mapRestBundle $err");
    return SendStepsResponse((builder) => builder
      ..httpCode = bundle.status
      ..status = json["status"]
      ..message = json["message"].toString());
  }
}
