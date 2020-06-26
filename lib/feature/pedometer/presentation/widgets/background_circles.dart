import 'package:flutter/material.dart';

import 'package:turbostart/other/theme.dart' as theme;

class BackgroundCircules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 24.5),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 10.58),
          _ColumnCircleWidget(),
          SizedBox(width: 10.58),
          _ColumnCircleWidget(),
          SizedBox(width: 10.58),
          _ColumnCircleWidget(),
          SizedBox(width: 10.58),
          _ColumnCircleWidget(),
          SizedBox(width: 10.58),
          _ColumnCircleWidget(),
          SizedBox(width: 10.58),
        ],
      ),
      SizedBox(height: 203.48),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: 10.58),
          _ColumnCircleWidget(),
          SizedBox(width: 10.58),
          _ColumnCircleWidget(),
          SizedBox(width: 10.58),
          _ColumnCircleWidget(),
          SizedBox(width: 10.58),
          _ColumnCircleWidget(),
          SizedBox(width: 10.58),
          _ColumnCircleWidget(),
          SizedBox(width: 10.58),
          _ColumnCircleWidget(),
          SizedBox(width: 10.58),
          _ColumnCircleWidget(),
          SizedBox(width: 10.58),
          _ColumnCircleWidget(),
          SizedBox(width: 10.58),
          _ColumnCircleWidget(),
          SizedBox(width: 10.58),
          _ColumnCircleWidget(),
        ],
      ),
      SizedBox(height: 59.48),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 35.71),
          _ColumnCircleWidget(),
          SizedBox(width: 10.58),
          _ColumnCircleWidget(),
        ],
      ),
    ]);
  }
}

class _ColumnCircleWidget extends StatelessWidget {
  final Color topColor;
  final Color bottomColor;

  const _ColumnCircleWidget({Key key, this.topColor = theme.white20, this.bottomColor = theme.white20}) : super(key: key);
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
