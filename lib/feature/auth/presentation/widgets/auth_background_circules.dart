import 'package:flutter/material.dart';

import 'package:turbostart/other/theme.dart' as theme;

class AuthBackgroundCircules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(width: 10.58),
      _ColumnCircleWidget(
        topColor: theme.mainGreen,
      ),
      Expanded(
        child: Container(),
      ),
      _ColumnCircleWidget(
        topColor: theme.mainGreen,
      ),
      SizedBox(width: 10.58),
      _ColumnCircleWidget(
        topColor: theme.red,
      ),
      SizedBox(width: 10.58),
      _ColumnCircleWidget(
        topColor: theme.mainGreen,
        bottomColor: theme.mainGreen,
      ),
      SizedBox(width: 10.58),
      _ColumnCircleWidget(
        topColor: theme.gray,
        bottomColor: theme.mainGreen,
      ),
      SizedBox(width: 10.58),
    ]);
  }
}

class _ColumnCircleWidget extends StatelessWidget {
  final Color topColor;
  final Color bottomColor;

  const _ColumnCircleWidget({Key key, this.topColor = theme.gray, this.bottomColor = theme.gray}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CircleWidget(
          color: topColor,
        ),
        SizedBox(
          height: 8.17,
        ),
        _CircleWidget(
          color: bottomColor,
        )
      ],
    );
  }
}

class _CircleWidget extends StatelessWidget {
  final Color color;

  const _CircleWidget({Key key, this.color = theme.gray}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      height: 16.19,
      width: 16.19,
    );
  }
}
