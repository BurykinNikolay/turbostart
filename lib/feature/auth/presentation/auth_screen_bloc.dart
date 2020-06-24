import 'package:turbostart/feature/navigation/navigation.dart';
import 'package:turbostart/presentation/base/base_bloc.dart';

class AuthScreenBloc extends BaseBloc {
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

  void openRegisterSite() {}

  void login() {
    actions.navigation.routeTo(
      AppRoute((builder) => builder..route = Routes.onboarding),
    );
  }
}
