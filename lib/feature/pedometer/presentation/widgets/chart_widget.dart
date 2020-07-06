import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostart/domain/models/steps_data.dart';
import 'package:intl/intl.dart';

import 'package:turbostart/packages/syncfusion_flutter_charts/charts.dart';

import 'package:turbostart/other/theme.dart' as theme;

import '../pedometer_screen_bloc.dart';

class ChartWidget extends StatefulWidget {
  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  PedometerScreenBloc get bloc => Provider.of<PedometerScreenBloc>(context);

  LinearGradient gradientColors = LinearGradient(colors: <Color>[
    theme.white,
    theme.accentGreen,
    theme.mainGreen,
  ], stops: <double>[
    0.0,
    0.95,
    1.0
  ]);

  @override
  Widget build(BuildContext context) {
    final data = bloc?.stepsState?.stepsUserData?.toList() ?? <StepsData>[];

    return StreamBuilder<ChartModel>(
      stream: bloc.chartModelStreamController.stream,
      initialData: bloc.generateChartModel(),
      builder: (context, snapshot) {
        final charModel = snapshot.data;
        return Transform.scale(
          scale: 1.4,
          child: SfCartesianChart(
            trackballBehavior: TrackballBehavior(
              lineDashArray: [8, 2],
              lineColor: theme.gray,
              enable: true,
              activationMode: ActivationMode.singleTap,
              lineType: TrackballLineType.vertical,
              tooltipSettings: InteractiveTooltip(
                format: 'point.x : point.y',
                color: theme.white,
                borderColor: theme.accentGray,
                borderWidth: 2.0,
                textStyle: ChartTextStyle(
                  color: theme.black,
                  fontSize: 10,
                ),
              ),
            ),
            margin: EdgeInsets.zero,
            plotAreaBorderWidth: 0,
            primaryYAxis: NumericAxis(isVisible: false, edgeLabelPlacement: EdgeLabelPlacement.shift),
            primaryXAxis: DateTimeAxis(
                rangePadding: ChartRangePadding.additional,
                intervalType: DateTimeIntervalType.auto,
                interval: charModel.interval,
                dateFormat: charModel.dateFormat,
                isVisible: true,
                axisLine: AxisLine(color: Colors.transparent),
                placeLabelsNearAxisLine: true,
                majorGridLines: MajorGridLines(
                  width: 0,
                ),
                edgeLabelPlacement: EdgeLabelPlacement.shift),
            series: <ChartSeries<StepsData, DateTime>>[
              AreaSeries<StepsData, DateTime>(
                animationDuration: 0,
                borderColor: theme.mainGreen,
                borderWidth: 1.2,
                enableTooltip: true,
                gradient: gradientColors,
                dataSource: charModel.stepsData,
                borderDrawMode: BorderDrawMode.top,
                xValueMapper: (StepsData data, _) => DateFormat("dd.MM.yyyy").parse(data.date),
                yValueMapper: (StepsData data, _) => int.parse(data.steps),
              ),
              // SplineSeries<StepsData, DateTime>(
              //   animationDuration: 0,
              //   // borderColor: theme.mainGreen,
              //   enableTooltip: true,
              //   //gradient: gradientColors,
              //   color: theme.mainGreen,
              //   dataSource: charModel.stepsData,
              //   xValueMapper: (StepsData data, _) => DateFormat("dd.MM.yyyy").parse(data.date),
              //   yValueMapper: (StepsData data, _) => int.parse(data.steps),
              // )
            ],
            tooltipBehavior: TooltipBehavior(
                tooltipPosition: TooltipPosition.auto,
                enable: false,
                header: '',
                canShowMarker: false,
                color: theme.white,
                textStyle: ChartTextStyle(
                  color: theme.black,
                  fontSize: 10,
                ),
                builder: tooltipBuilder),
          ),
        );
      },
    );
  }
}

Widget tooltipBuilder(dynamic stepsData, dynamic second, dynamic three, int four, int five) {
  final data = stepsData as StepsData;
  return Padding(
    padding: EdgeInsets.only(bottom: 20),
    child: Container(
      height: 17,
      width: 55,
      decoration: BoxDecoration(border: Border.all(width: 1, color: theme.accentGray), borderRadius: BorderRadius.circular(18), color: Colors.white),
      child: Center(
        child: Text(
          data.steps,
          style: theme.normalBlack12,
        ),
      ),
    ),
  );
}
