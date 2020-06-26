import 'package:flutter/material.dart';

import 'package:turbostart/l10n/localizations.dart';
import 'package:turbostart/other/theme.dart' as theme;

import 'background_circles.dart';

class LegendPlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(color: theme.mainGreen, borderRadius: BorderRadius.circular(3)),
      child: Stack(
        children: [
          BackgroundCircules(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 86.62),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "10 000 ",
                          style: theme.boldWhite36,
                        ),
                        Text(
                          localizations.steps,
                          style: theme.boldWhite17,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "= 1₽",
                          style: theme.boldWhite36,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 16.62),
                Text(
                  localizations.tenThousand,
                  style: theme.weight600White14,
                ),
                SizedBox(height: 16.62),
                Text(
                  localizations.makeYourContribution.toUpperCase(),
                  style: theme.boldWhite26,
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
