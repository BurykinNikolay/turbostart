import 'dart:async';

import 'package:turbostart/domain/domain.dart';
import 'package:turbostart/domain/models/user_info.dart';
import 'package:turbostart/presentation/base/base_bloc.dart';

class ProfileScreenBloc extends BaseBloc {
  UserInfo get userInfo => store.state.userState.userInfo;

  StreamController<UserInfo> userInfoStreamController;

  StreamSubscription _userInfoSubscription;

  @override
  void init() {
    super.init();
    userInfoStreamController = StreamController<UserInfo>.broadcast();
    _userInfoSubscription = store.nextSubstate((AppState state) => state.userState.userInfo).listen((_) async {
      _sinkUserInfo();
    });
    _sinkUserInfo();
  }

  @override
  void dispose() {
    super.dispose();
    userInfoStreamController?.close();
    _userInfoSubscription?.cancel();
  }

  void _sinkUserInfo() {
    userInfoStreamController.add((userInfo));
  }

  void logout() {
    actions.login.logout();
  }
}
