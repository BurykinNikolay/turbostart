import 'package:turbostart/feature/navigation/navigation.dart';
import 'package:turbostart/presentation/base/base_bloc.dart';

class OnboardingScreenBloc extends BaseBloc {
  void end() {
    actions.navigation.routeTo(AppRoute((builder) => builder.route = Routes.home));
  }
}
