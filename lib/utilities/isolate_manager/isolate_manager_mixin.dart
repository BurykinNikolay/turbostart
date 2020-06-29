import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:turbostart/data/network/models/rest_bundle.dart';
import 'package:turbostart/data/network/service/rest_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:turbostart/feature/logger/logger.dart';

import 'isolate_executor.dart';
import 'task.dart';

abstract class IsolateManagerMixin {
  void subscribe<I, O>(Stream input, Subject output, Function function) {
    input.listen((bundle) {
      final task = Task<I, O>(bundle: bundle, function: function, timeout: bundle.timeout);
      IsolateExecutor().addTask<I, O>(task: task).listen(output.add).onError((err) {
        logger.e("onError $err");
        output.addError(err);
      });
    });
  }

  void executeRestRequest(Subject input, Subject output, RestService service, Uri uri, Built request, Serializer serializer, Duration timeout, {String key}) {
    void _sinkData(response) {
      input.add(RestBundle(key: key, data: response?.body, serializer: serializer, timeout: timeout, status: response?.statusCode));
    }

    final requestFuture = service.post(uri, request).catchError((err) {
      output.addError(err);
    });
    if (timeout != null) {
      final start = DateTime.now().millisecondsSinceEpoch;
      logger.v("with timeout $timeout $start");
      requestFuture.timeout(timeout).catchError((err) {
        logger.v("timeout.catchError $err $timeout ms: ${DateTime.now().millisecondsSinceEpoch - start}");
        output.addError(err);
      });
    }

    requestFuture.then(_sinkData).catchError((err) {
      logger.e("requestFuture.catchError $err $uri $request");
      output.addError(err);
    });
  }

  void executeGetRestRequest(Subject input, Subject output, RestService service, Uri uri, Serializer serializer, Duration timeout, {String key}) {
    void _sinkData(response) {
      input.add(RestBundle(key: key, data: response?.body, bodyBytes: response?.bodyBytes, serializer: serializer, timeout: timeout, status: response?.statusCode));
    }

    final requestFuture = service.get(uri).catchError((err) {
      output.addError(err);
    });
    if (timeout != null) {
      final start = DateTime.now().millisecondsSinceEpoch;
      logger.v("with timeout $timeout $start");
      requestFuture.timeout(timeout).catchError((err) {
        logger.v("timeout.catchError $err $timeout ms: ${DateTime.now().millisecondsSinceEpoch - start}");
        output.addError(err);
      });
    }

    requestFuture.then(_sinkData).catchError((err) {
      logger.e("requestFuture.catchError $err $uri");
      output.addError(err);
    });
  }

  void executeRestStringRequest(Subject input, Subject output, RestService service, Uri uri, String request, Serializer serializer, Duration timeout, {String key}) {
    void _sinkData(response) {
      input.add(RestBundle(key: key, data: response?.body, bodyBytes: response?.bodyBytes, serializer: serializer, timeout: timeout, status: response?.statusCode));
    }

    final requestFuture = service.postStringRequest(uri, request).catchError((err) {
      output.addError(err);
    });
    if (timeout != null) {
      final start = DateTime.now().millisecondsSinceEpoch;
      logger.v("with timeout $timeout $start");
      requestFuture.timeout(timeout).catchError((err) {
        logger.v("timeout.catchError $err $timeout ms: ${DateTime.now().millisecondsSinceEpoch - start}");
        output.addError(err);
      });
    }

    requestFuture.then(_sinkData).catchError((err) {
      logger.e("requestFuture.catchError $err $uri $request");
      output.addError(err);
    });
  }
}
