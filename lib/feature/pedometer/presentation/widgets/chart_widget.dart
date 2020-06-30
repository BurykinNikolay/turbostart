import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_plot/flutter_plot.dart';
import 'package:provider/provider.dart';
import 'package:turbostart/other/theme.dart' as theme;

import '../pedometer_screen_bloc.dart';

class ChartWidget extends StatefulWidget {
  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  PedometerScreenBloc get bloc => Provider.of<PedometerScreenBloc>(context);

  final List<Point> data = [
    const Point(21.0, 19.0),
    const Point(3.0, 7.0),
    const Point(8.0, 9.0),
    const Point(11.0, 14.0),
    const Point(19.0, 17.0),
    const Point(7.0, 8.0),
    const Point(-4.0, -4.0),
    const Point(10.0, 12.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Plot(
      padding: EdgeInsets.zero,
      height: 250.0,
      data: data,
      gridSize: new Offset(2.0, 2.0),
      style: new PlotStyle(
        pointRadius: 0.5,
        outlineRadius: 0.5,
        primary: theme.mainGreen,
        secondary: theme.mainGreen,
        trace: true,
        textStyle: new TextStyle(
          fontSize: 8.0,
          color: Colors.transparent,
        ),
        axis: Colors.transparent,
        gridline: Colors.transparent,
      ),
    );
  }
}
