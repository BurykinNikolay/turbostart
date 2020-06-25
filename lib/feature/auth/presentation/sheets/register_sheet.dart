import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostart/l10n/localizations.dart';
import 'package:turbostart/other/theme.dart' as theme;
import 'package:turbostart/other/turbostart_icons.dart';
import 'package:turbostart/ui_library/library.dart';

import '../auth_screen_bloc.dart';

class RegisterSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (ctx) => AuthScreenBloc()..init(),
      dispose: (ctx, bloc) => bloc.dispose(),
      child: _RegisterSheetView(),
    );
  }
}

class _RegisterSheetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AuthScreenBloc>(context);
    final localization = AppLocalizations.of(context);

    return Column(children: [
      SizedBox(height: 235),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: theme.white),
            width: 44,
            height: 44,
            child: Center(
              child: Icon(TurbostartIcons.alarm, color: theme.mainGreen,)
            ),
          ),
          SizedBox(width: 13.0),
          Text(
            localization.processOfRegister,
            style: theme.normalWhite16,
          ),
        ],
      ),
      SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.transparent),
            width: 44,
            height: 44,
          ),
          SizedBox(width: 13.0),
          Text(
            localization.afterRegister,
            style: theme.normalWhite16,
          ),
        ],
      ),
      SizedBox(height: 132),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37.5),
        child: PrimaryColorRoundedButton(
          text: localization.register,
          onPressed: () => bloc.openRegisterSite(),
        ),
      ),
      SizedBox(height: 95),
      Text(
        localization.haveAProblem,
        style: theme.lightGreen16,
      ),
      SizedBox(height: 47),
    ]);
  }
}
