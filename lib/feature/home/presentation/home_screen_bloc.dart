import 'dart:async';

import 'package:turbostart/domain/domain.dart';
import 'package:turbostart/domain/models/models.dart';
import 'package:turbostart/presentation/base/base_bloc.dart';

class HomeScreenBloc extends BaseBloc {
  AppTab get activeTab => store.state.activeTab;

  final _currentPageController = StreamController<AppTab>.broadcast();

  Stream<AppTab> get currentPageStream => _currentPageController.stream;

  StreamSubscription appTabSubscription;
  StreamSubscription appThemeSubscription;

  @override
  void init() {
    super.init();
    appTabSubscription = store.nextSubstate((AppState state) => state.activeTab).listen((_) async {
      _currentPageController.add(activeTab);
    });
    responseStepsAndInfo();
  }

  void responseStepsAndInfo() {
    actions.health.getStepsForLastTwoWeek();
    actions.login.getUserInfo();
  }

  @override
  void dispose() {
    super.dispose();
    _currentPageController?.close();
    appTabSubscription?.cancel();
    appThemeSubscription?.cancel();
  }

  void updateTab(AppTab tab) {
    actions.updateTab(tab);
  }
}
