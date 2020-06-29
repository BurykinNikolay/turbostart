import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dioc/dioc.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:turbostart/data/network/models/network_serializers.dart';
import 'package:turbostart/feature/logger/logger.dart';

import 'interceptor/auth_interceptor.dart';
import 'interceptor/interceptor.dart';

const _methodPost = 'POST';
const _methodGet = 'GET';

abstract class RestService {
  Future<RESP> get<RESP>(
    Uri path, {
    Map<String, dynamic> queryParameters,
  });

  Future<RESP> post<RESP>(Uri path, Built request, {Serializer deserializer, Map<String, String> headers});

  Future<RESP> postStringRequest<RESP>(Uri url, String stringRequest, {Serializer deserializer, Map<String, String> headers});

  Map<int, Interceptor> get interceptors;
  void setLoggingEnabled(bool isEnabled, {bool stripBody});
  void addInterceptor(int order, Interceptor interceptor);
  void removeInterceptor(Interceptor interceptor);
}

class RestServiceImpl implements RestService {
  RestServiceImpl(
    this.client,
  );

  @Inject()
  final Client client;

  bool _isLoggingEnabled = true;
  final bool _debugBody = false;

  @override
  Map<int, Interceptor> interceptors = {
    1: AuthInterceptor(),
  };

  @override
  void setLoggingEnabled(bool isEnabled, {bool stripBody}) {
    _isLoggingEnabled = isEnabled;
  }

  @override
  void addInterceptor(int order, Interceptor interceptor) {
    interceptors.putIfAbsent(order, () => interceptor);
  }

  @override
  void removeInterceptor(Interceptor interceptor) {
    interceptors.removeWhere((key, value) => value == interceptor);
  }

  @override
  Future<RESP> postStringRequest<RESP>(Uri url, String stringRequest, {Serializer deserializer, Map<String, String> headers}) async {
    final request = Request(_methodPost, url)..body = stringRequest;

    final requestToLog = request.toString();

    _interceptRequest(request);

    headers?.forEach((key, update) {
      request?.headers?.update(key, (value) => update, ifAbsent: () => update);
    });

    if (_isLoggingEnabled) {
      _printRequestLog(_methodPost, request);
    }

    final response = await Response.fromStream(
      await client.send(request).catchError(
        (error) {
          logger.e(error);
          throw error;
        },
      ),
    );

    if (_isLoggingEnabled) {
      _printResponseLog(_methodPost, response);
    }

    if (deserializer != null) {
      return serializers.deserializeWith(deserializer, jsonDecode(response.body)) as RESP;
    } else {
      return response as RESP;
    }
  }

  void _interceptRequest(request) {
    try {
      final sortedInterceptors = interceptors.keys.toList()..sort();
      sortedInterceptors.forEach((key) => interceptors[key].intercept(request));
    } catch (error) {
      logger.e('interceptor error: $error');
    }
  }

  @override
  Future<RESPONSE> post<RESPONSE>(Uri url, Built requestBody, {Serializer deserializer, Map<String, String> headers}) {
    final json = JsonCodec().encode(serializers.serialize(requestBody ?? ''));
    return postStringRequest(url, json.toString(), deserializer: deserializer, headers: headers);
  }

  @override
  Future<RESP> get<RESP>(Uri path, {Map<String, dynamic> queryParameters, Serializer deserializer}) async {
    final request = Request(_methodGet, path);
    _interceptRequest(request);
    if (_isLoggingEnabled) {
      _printRequestLog(_methodGet, request);
    }
    final response = await Response.fromStream(
      await client.send(request).catchError(
        (error) {
          throw error;
        },
      ),
    );

    if (_isLoggingEnabled) {
      _printResponseLog(_methodGet, response);
    }

    if (deserializer != null) {
      return serializers.deserializeWith(
        deserializer,
        jsonDecode(response.body),
      ) as RESP;
    } else {
      return response as RESP;
    }
  }

  void _printResponseLog(String method, Response response) {
    debugPrint('$method ${response.request.url}');
    debugPrint('status: ${response.statusCode}');
    debugPrint('content length: ${response.contentLength}');
    if (_debugBody) {
      debugPrint('body: ${response.body}');
    }
  }

  void _printRequestLog(String method, Request request) {
    debugPrint('$method ${request.url}');
    request.headers.forEach((key, value) => debugPrint('$key: $value'));
    debugPrint('body: ${request.body}');
  }
}
