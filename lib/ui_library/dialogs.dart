import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turbostart/l10n/localizations.dart';

class TurboAlertDialog extends StatelessWidget {
  TurboAlertDialog({this.content});

  final String content;
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return CupertinoAlertDialog(
      title: Text(localizations.error),
      content: Text(content),
      actions: <Widget>[
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          isDefaultAction: true,
          child: Text(
            localizations.ok,
          ),
        ),
      ],
    );
  }
}
