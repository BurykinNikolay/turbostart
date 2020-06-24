import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:turbostart/other/theme.dart' as theme;

import 'auth_screen_bloc.dart';
import 'widgets/auth_background_circules.dart';
import 'widgets/auth_background_middle_part.dart';
import 'widgets/auth_buttons_place.dart';

class AuthScreenView extends StatefulWidget {
  @override
  _AuthScreenViewState createState() => _AuthScreenViewState();
}

class _AuthScreenViewState extends State<AuthScreenView> {
  AuthScreenBloc get bloc => Provider.of<AuthScreenBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: theme.white,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Image.asset('assets/5k_logo.png', width: 140.0),
            SizedBox(height: 40),
            AuthBackgroundCircules(),
            Container(
              color: Colors.white,
              child: SizedBox(
                height: 10.54,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              color: Colors.green,
              height: MediaQuery.of(context).size.width * 0.95,
              child: AuthBackgroundMiddlePart(),
            ),
            Expanded(
              child: AuthButtonsPlace(),
            ),
          ],
        ),
      ),
    );
  }
}
