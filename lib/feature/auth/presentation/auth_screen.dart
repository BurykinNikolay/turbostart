import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_screen_bloc.dart';
import 'auth_screen_view.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (ctx) => AuthScreenBloc()..init(),
      dispose: (ctx, bloc) => bloc.dispose(),
      child: AuthScreenView(),
    );
  }
}
