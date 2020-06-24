import 'package:flutter/material.dart';
import 'package:turbostart/l10n/localizations.dart';
import 'package:turbostart/other/theme.dart' as theme;

class AuthBackgroundMiddlePart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(children: [
          Container(
            color: theme.white,
            height: MediaQuery.of(context).size.width * 0.464,
          ),
          Expanded(
            child: Container(color: theme.mainGreen),
          ),
        ]),
        Row(
          children: [
            Expanded(
              child: Container(),
            ),
            Image.asset(
              'lib/feature/auth/assets/auth_background.png',
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.08),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                Text(
                  AppLocalizations.of(context).turbostarts,
                  style: theme.boldWhite36,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
