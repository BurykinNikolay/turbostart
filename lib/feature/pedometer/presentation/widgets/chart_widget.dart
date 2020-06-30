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

  @override
  Widget build(BuildContext context) {
    return Plot(
      padding: EdgeInsets.zero,
      height: 250.0,
      data: bloc.getChartData(),
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
