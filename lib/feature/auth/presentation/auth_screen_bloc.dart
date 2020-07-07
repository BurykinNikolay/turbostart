import 'dart:async';

import 'package:turbostart/domain/domain.dart';
import 'package:turbostart/feature/auth/domain/login_screen_status.dart';
import 'package:turbostart/feature/auth/repository/login_repository.dart';
import 'package:turbostart/feature/logger/logger.dart';
import 'package:turbostart/feature/navigation/navigation.dart';
import 'package:turbostart/presentation/base/base_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' hide LoginRequest;

class AuthScreenBloc extends BaseBloc {
  StreamController<LoginScreenStatus> loginScreenStatusController;

  StreamSubscription<LoginScreenStatus> _loginScreenStatusStreamSubscription;

  LoginScreenStatus get loginScreenStatus => store?.state?.loginState?.loginScreenStatus ?? LoginScreenStatus.wait;

  @override
  void init() {
    super.init();

    loginScreenStatusController = StreamController<LoginScreenStatus>.broadcast();

    _loginScreenStatusStreamSubscription = store.nextSubstate((AppState state) => state.loginState.loginScreenStatus).listen((_) {
      _sinkLoginScreenStatus();
    });
  }

  @override
  void dispose() {
    super.dispose();
    loginScreenStatusController.close();
    _loginScreenStatusStreamSubscription.cancel();
  }

  void auth() {
    actions.navigation.showBottomSheet(
      BottomSheetBundle((builder) => builder..bottomSheet = BottomSheets.auth),
    );
  }

  void register() {
    actions.navigation.showBottomSheet(
      BottomSheetBundle((builder) => builder..bottomSheet = BottomSheets.register),
    );
  }

  void openRegisterSite() {
    _openInBrowser("https://xn--80ab3bgdedecc0h.xn--p1ai/signup");
  }

  void openFAQSite() {
    _openInBrowser("https://xn--80ab3bgdedecc0h.xn--p1ai/faq");
  }

  void _sinkLoginScreenStatus() {
    loginScreenStatusController.add(loginScreenStatus);
  }

  void login({String login, String password}) {
    if (loginScreenStatus != LoginScreenStatus.progress) {
      // actions.login.setLoginScreenStatus(LoginScreenStatus.progress);
      final loginRequest = LoginRequest((builder) => builder
        ..userName = login
        ..password = password);
      actions.login.loginRequest(loginRequest);
    }
  }

  void openRecoverSite() {
    _openInBrowser("https://xn--80ab3bgdedecc0h.xn--p1ai/recover");
  }

  void _openInBrowser(String url) async {
    final chromeSafariBrowser = ChromeSafariBrowser(bFallback: InAppBrowser());
    final options = ChromeSafariBrowserClassOptions(android: AndroidChromeCustomTabsOptions(), ios: IOSSafariOptions());
    try {
      await chromeSafariBrowser.open(
        url: url,
        options: options,
      );
    } catch (error) {
      logger.e(error);
      throw 'Could not launch $url';
    }
  }
}
