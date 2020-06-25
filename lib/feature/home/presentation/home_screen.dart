import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_screen_bloc.dart';
import 'home_screen_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (ctx) => HomeScreenBloc()..init(),
      dispose: (ctx, bloc) => bloc.dispose(),
      child: HomeScreenView(),
    );
  }
}
