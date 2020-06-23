import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'onboarding_screen_bloc.dart';
import 'onboarding_screen_view.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (ctx) => OnboardingScreenBloc()..init(),
      dispose: (ctx, bloc) => bloc.dispose(),
      child: OnboardingScreenView(),
    );
  }
}
