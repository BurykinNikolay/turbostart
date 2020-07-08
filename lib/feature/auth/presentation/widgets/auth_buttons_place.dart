import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostart/l10n/localizations.dart';

import 'package:turbostart/other/theme.dart' as theme;
import 'package:turbostart/ui_library/library.dart';

import '../auth_screen_bloc.dart';

class AuthButtonsPlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AuthScreenBloc>(context);

    final localization = AppLocalizations.of(context);
    return Container(
      color: theme.mainGreen,
      child: Column(children: [
        SizedBox(height: 64.14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.5),
          child: PrimaryColorRoundedButton(
            text: localization.auth,
            onPressed: () => bloc.auth(),
          ),
        ),
        SizedBox(height: 24.47),
        GestureDetector(
          onTap: () => bloc.register(),
          child: Container(
            color: Colors.transparent,
            child: Text(
              localization.register,
              style: theme.normalWhite18,
            ),
          ),
        ),
        SizedBox(height: 30),
        GestureDetector(
          onTap: () => bloc.openCompetitionRulesSite(),
          child: Container(
            color: Colors.transparent,
            child: Text(
              localization.competitionRules,
              style: theme.lightGreen16,
            ),
          ),
        ),
      ]),
    );
  }
}
