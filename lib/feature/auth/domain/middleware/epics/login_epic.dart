import 'dart:async';
import 'dart:io';

import 'package:built_redux/built_redux.dart';
import 'package:dioc/dioc.dart';
import 'package:turbostart/feature/auth/domain/login_actions.dart';
import 'package:turbostart/feature/auth/repository/login_repository.dart';
import 'package:turbostart/feature/logger/logger.dart';
import 'package:rxdart/rxdart.dart';

import 'package:turbostart/data/network/models/base_model.dart';
import 'package:turbostart/domain/domain.dart';

class LoginEpic {
  LoginEpic(this._repository);

  @Inject(mode: InjectMode.singleton)
  final LoginRepository _repository;

  Stream loginEpic(Stream<Action<dynamic>> stream, MiddlewareApi<AppState, AppStateBuilder, AppActions> api) {
    return stream.where((action) => action.name == LoginActionsNames.loginRequest.name).cast<Action<LoginRequest>>().switchMap((action) {
      return _repository.makeLoginRequest(
        request: action.payload,
        timeout: Duration(seconds: 20),
      );
    }).doOnData((loginResponse) {
      api.actions.login.setLoginResponse(loginResponse);
    }).handleError((exception) {
      final timeout = [SocketException, OSError, TimeoutException];

      if (exception is TimeoutException) {
        api.actions.login.setLoginError(
          ErrorModel(
            (builder) => builder..message = exception.message,
          ),
        );
        final responseWithTimestamp = LoginResponse((builder) {
          builder.error.replace(
            ErrorModel(
              (errorBuilder) => errorBuilder.message = exception.message,
            ),
          );
          builder.timestamp = DateTime.now().millisecondsSinceEpoch.toString();
          return builder;
        });
        api.actions.login.setLoginResponse(responseWithTimestamp);
      }
      if (timeout.any((Type type) => exception.runtimeType == type)) {
        api.actions.login.setLoginError(
          ErrorModel(
            (builder) => builder..message = exception.message,
          ),
        );
        final responseWithTimestamp = LoginResponse((builder) {
          builder.error.replace(ErrorModel((errorBuilder) => errorBuilder
            ..message = exception.message
            ..code = 800));
          builder.timestamp = DateTime.now().millisecondsSinceEpoch.toString();
          return builder;
        });
        api.actions.login.setLoginResponse(responseWithTimestamp);
      } else if (exception is LoginResponse) {
        logger.e('caugth BetResponse: $exception');

        var serverErrorText = exception.message;
        if (exception != null && exception.httpCode == 500) {
          serverErrorText = exception.message;
        }
        final responseWithTimestamp = LoginResponse((builder) {
          builder.error.replace(ErrorModel((errorBuilder) => errorBuilder.message = serverErrorText));
          builder.timestamp = DateTime.now().millisecondsSinceEpoch.toString();
          return builder;
        });
        api.actions.login.setLoginResponse(responseWithTimestamp);
      } else {
        final responseWithTimestamp = LoginResponse((builder) {
          builder.error.replace(ErrorModel((errorBuilder) => errorBuilder.message = exception.message));
          builder.timestamp = DateTime.now().millisecondsSinceEpoch.toString();
          return builder;
        });
        api.actions.login.setLoginResponse(responseWithTimestamp); //
      }
    });
  }

  Stream getUserInfo(Stream<Action<dynamic>> stream, MiddlewareApi<AppState, AppStateBuilder, AppActions> api) {
    return stream.where((action) => action.name == LoginActionsNames.getUserInfo.name).cast<Action<void>>().switchMap((action) {
      return _repository.getUserInfoRequest(timeout: Duration(seconds: 20));
    }).doOnData((userInfoResponse) {
      api.actions.login.setUserInfoResponse(userInfoResponse);
    }).handleError((exception) {
      logger.e('GetUserInfoError: $exception');
    });
  }

  Stream setPushToken(Stream<Action<dynamic>> stream, MiddlewareApi<AppState, AppStateBuilder, AppActions> api) {
    return stream.where((action) => action.name == LoginActionsNames.setPushToken.name).cast<Action<String>>().switchMap((action) {
      return _repository.setPushToken(
        request: action.payload,
        timeout: Duration(seconds: 20),
      );
    }).doOnData((sendStepsResponse) {
      logger.i("SendStepsStatus: ${sendStepsResponse.status}");
    }).handleError((exception) {
      logger.e('SendStepsStatus: $exception');
    });
  }
}
