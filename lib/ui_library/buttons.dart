import 'package:flutter/material.dart';

import 'package:turbostart/other/theme.dart' as theme;

class PrimaryColorRoundedButton extends StatelessWidget {
  PrimaryColorRoundedButton({@required this.text, @required this.onPressed, this.isProgress = false, final key}) : super(key: key);
  String text;
  Function onPressed;
  bool isProgress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: theme.white,
        disabledColor: Theme.of(context).primaryColor.withAlpha(150),
        onPressed: onPressed,
        child: isProgress
            ? SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                  valueColor: AlwaysStoppedAnimation<Color>(theme.red),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: theme.red,
                  fontWeight: FontWeight.normal,
                  fontSize: 17.0,
                ),
              ),
      ),
    );
  }
}
