import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:turbostart/feature/auth/domain/login_screen_status.dart';
import 'package:turbostart/l10n/localizations.dart';
import 'package:turbostart/other/regexes.dart';
import 'package:turbostart/other/theme.dart' as theme;
import 'package:turbostart/ui_library/library.dart';

import '../auth_screen_bloc.dart';

class AuthSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (ctx) => AuthScreenBloc()..init(),
      dispose: (ctx, bloc) => bloc.dispose(),
      child: _AuthSheetView(),
    );
  }
}

class _AuthSheetView extends StatefulWidget {
  @override
  __AuthSheetViewState createState() => __AuthSheetViewState();
}

class __AuthSheetViewState extends State<_AuthSheetView> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  AuthScreenBloc get bloc => Provider.of<AuthScreenBloc>(context);
  AppLocalizations get localizations => AppLocalizations.of(context);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 120),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37.0),
        child: _loginAndPasswordForm(),
      ),
      SizedBox(height: 122),
      StreamBuilder<LoginScreenStatus>(
        stream: bloc.loginScreenStatusController.stream,
        initialData: bloc.loginScreenStatus,
        builder: (context, snapshot) {
          final isProgress = snapshot.data == LoginScreenStatus.progress;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37.5),
            child: PrimaryColorRoundedButton(
              text: localizations.login,
              onPressed: () => bloc.login(login: _loginController.text, password: _passwordController.text),
            ),
          );
        },
      ),
      SizedBox(height: 95),
      GestureDetector(
        onTap: () => bloc.openRecoverSite(),
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: Text(
              localizations.forgotPassword,
              style: theme.lightGreen16,
            ),
          ),
        ),
      ),
      SizedBox(height: 47),
    ]);
  }

  Form _loginAndPasswordForm() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizations.email,
            style: theme.boldWhite18,
          ),
          SizedBox(
            height: 10.92,
          ),
          Container(
            decoration: BoxDecoration(
              color: theme.accentGreen,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              inputFormatters: <TextInputFormatter>[BlacklistingTextInputFormatter(RegExp('[ ]'))],
              cursorColor: theme.white,
              controller: _loginController,
              textInputAction: TextInputAction.next,
              autocorrect: false,
              validator: (value) {
                if (Regexes.email.hasMatch(value)) {
                  return null;
                } else if (Regexes.phone.hasMatch(value)) {
                  return null;
                } else {
                  return localizations.setCurrentLogin;
                }
              },
              style: theme.lightWhite18,
              decoration: textFieldDecoration(labelText: ''),
            ),
          ),
          SizedBox(height: 35.43),
          Text(
            localizations.password,
            style: theme.boldWhite18,
          ),
          SizedBox(
            height: 10.92,
          ),
          Container(
            decoration: BoxDecoration(
              color: theme.accentGreen,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              obscuringCharacter: "●",
              validator: (value) {
                if (value.isEmpty) {
                  return localizations.emptyField;
                } else if (Regexes.spaces.hasMatch(value)) {
                  return localizations.passwordContainsInvalidCharacters;
                }
                return null;
              },
              inputFormatters: <TextInputFormatter>[BlacklistingTextInputFormatter(RegExp('[ ]'))],
              cursorColor: theme.white,
              autocorrect: false,
              controller: _passwordController,
              obscureText: true,
              style: theme.lightWhite18,
              decoration: textFieldDecoration(
                labelText: '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

InputDecoration textFieldDecoration({@required String labelText, bool isPassword = false, Widget suffix}) {
  return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: EdgeInsets.only(left: 12, top: 8, bottom: 8),
      labelText: labelText,
      labelStyle: theme.lightWhite18,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: theme.red,
          width: 1.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: theme.white.withOpacity(0.3),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: theme.white.withOpacity(0.8),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: theme.red,
          width: 1.0,
        ),
      ),
      suffixIcon: suffix);
}
