import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pedometer_screen_bloc.dart';
import 'pedometer_screen_view.dart';

class PedometerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (ctx) => PedometerScreenBloc()..init(),
      dispose: (ctx, bloc) => bloc.dispose(),
      child: PedometerScreenView(),
    );
  }
}
