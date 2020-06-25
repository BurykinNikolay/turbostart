import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'profile_screen_bloc.dart';
import 'profile_screen_view.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (ctx) => ProfileScreenBloc()..init(),
      dispose: (ctx, bloc) => bloc.dispose(),
      child: ProfileScreenView(),
    );
  }
}
