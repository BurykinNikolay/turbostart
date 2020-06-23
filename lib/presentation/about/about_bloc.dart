import 'package:turbostart/presentation/base/base_bloc.dart';

class AboutBloc extends BaseBloc {
  @override
  void init() {
    super.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void openLink(String link) {
    _launchURL(link);
  }

  void _launchURL(String link) async {}
}
