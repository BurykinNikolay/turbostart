import 'package:flutter/material.dart';
import 'package:turbostart/domain/models/app_tab.dart';
import 'package:turbostart/l10n/localizations.dart';

import 'package:turbostart/other/theme.dart' as theme;

class TabIcon extends StatelessWidget {
  const TabIcon({this.tab, this.currentIndex});
  final AppTab tab;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final bool active = currentIndex == AppTab.toIndex(tab);
    return Column(
      children: [
        SizedBox(height: 25),
        Icon(
          active ? AppTab.activeIconByTab(tab) : AppTab.passiveIconByTab(tab),
          color: active ? theme.mainGreen : theme.mainGreen,
        ),
        SizedBox(height: 8.43),
        Text(
          tab == AppTab.pedometer ? localizations.pedometer : localizations.profile,
          style: active ? theme.normalGreen12 : theme.normalBlack12,
        )
      ],
    );
  }
}
