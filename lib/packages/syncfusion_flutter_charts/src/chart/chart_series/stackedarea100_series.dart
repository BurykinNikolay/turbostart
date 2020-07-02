part of charts;

/// Renders the 100% stacked area series.
///
/// A stacked area chart is the extension of a basic area chart to display the
///evolution of the value of several groups on the same graphic.
///
/// The values of each group are displayed on top of each other.
///
/// Stackedarea100 series show the percentage-of-the-whole of each group
/// and are plotted by the percentage of each value to the total amount in each group
///
/// Provides options to customize the [color], [opacity], [borderWidth], [borderColor],
/// [borderDrawMode] of the stackedarea100 series segments.
class StackedArea100Series<T, D> extends _StackedSeriesBase<T, D> {
  StackedArea100Series(
      {@required List<T> dataSource,
      @required ChartValueMapper<T, D> xValueMapper,
      @required ChartValueMapper<T, num> yValueMapper,
      ChartValueMapper<T, dynamic> sortFieldValueMapper,
      ChartValueMapper<T, Color> pointColorMapper,
      ChartValueMapper<T, String> dataLabelMapper,
      SortingOrder sortingOrder,
      String xAxisName,
      String yAxisName,
      String name,
      String groupName,
      Color color,
      MarkerSettings markerSettings,
      List<Trendline> trendlines,
      EmptyPointSettings emptyPointSettings,
      DataLabelSettings dataLabelSettings,
      bool isVisible,
      bool enableTooltip,
      List<double> dashArray,
      double animationDuration,
      Color borderColor,
      double borderWidth,
      LinearGradient gradient,
      SelectionSettings selectionSettings,
      bool isVisibleInLegend,
      LegendIconType legendIconType,
      String legendItemText,
      double opacity,
      BorderDrawMode borderDrawMode})
      : borderDrawMode = borderDrawMode ?? BorderDrawMode.top,
        super(
            xValueMapper: xValueMapper,
            yValueMapper: yValueMapper,
            sortFieldValueMapper: sortFieldValueMapper,
            pointColorMapper: pointColorMapper,
            dataLabelMapper: dataLabelMapper,
            dataSource: dataSource,
            xAxisName: xAxisName,
            yAxisName: yAxisName,
            name: name,
            color: color,
            trendlines: trendlines,
            markerSettings: markerSettings,
            dataLabelSettings: dataLabelSettings,
            isVisible: isVisible,
            emptyPointSettings: emptyPointSettings,
            enableTooltip: enableTooltip,
            dashArray: dashArray,
            animationDuration: animationDuration,
            borderColor: borderColor,
            borderWidth: borderWidth,
            gradient: gradient,
            selectionSettings: selectionSettings,
            legendItemText: legendItemText,
            isVisibleInLegend: isVisibleInLegend,
            legendIconType: legendIconType,
            sortingOrder: sortingOrder,
            groupName: groupName,
            opacity: opacity);

  ///Border type of stacked area series.
  ///
  ///Defaults to BorderDrawMode.top
  ///
  ///Also refer [BorderDrawMode]
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfCartesianChart(
  ///            series: <StackedArea100Series<SalesData, num>>[
  ///                StackedArea100Series<SalesData, num>(
  ///                  borderDrawMode: BorderDrawMode.all,
  ///                ),
  ///              ],
  ///        ));
  ///}
  ///```
  final BorderDrawMode borderDrawMode;

  /// Creates a segment for a data point in the series.
  @override
  ChartSegment createSegment() => StackedArea100Segment();

  /// Creates a collection of segments for the points in the series.
  @override
  void createSegments() {
    _createSegment(_dataPoints);
  }

  /// Area segment is created here
  void _createSegment(List<CartesianChartPoint<dynamic>> dataPoints) {
    final StackedArea100Segment segment = createSegment();
    _isRectSeries = false;
    if (segment != null) {
      segment._seriesIndex = _chart._chartSeries.visibleSeries.indexOf(this);
      segment.series = this;
      if (_chart._chartState.widgetNeedUpdate &&
          _xAxis._zoomFactor == 1 &&
          _yAxis._zoomFactor == 1 &&
          _chart._chartState.prevWidgetSeries != null &&
          _chart._chartState.prevWidgetSeries.isNotEmpty &&
          _chart._chartState.prevWidgetSeries.length - 1 >=
              segment._seriesIndex &&
          _chart._chartState.prevWidgetSeries[segment._seriesIndex]
                  ._seriesName ==
              segment.series._seriesName) {
        segment.oldSeries =
            _chart._chartState.prevWidgetSeries[segment._seriesIndex];
      }
      customizeSegment(segment);
      segment.strokePaint = segment.getStrokePaint();
      segment.fillPaint = segment.getFillPaint();
      segments.add(segment);
    }
  }

  /// Changes the series color, border color, and border width.
  @override
  void customizeSegment(ChartSegment segment) {
    segment.color = segment.series._seriesColor;
    segment.strokeColor = segment.series.borderColor;
    segment.strokeWidth = segment.series.borderWidth;
  }

  /// Draws marker with different shape and color of the appropriate data point in the series.
  @override
  void drawDataMarker(int index, Canvas canvas, Paint fillPaint,
      Paint strokePaint, double pointX, double pointY) {
    canvas.drawPath(_markerShapes[index], strokePaint);
    canvas.drawPath(_markerShapes[index], fillPaint);
  }

  /// Draws data label text of the appropriate data point in a series.
  @override
  void drawDataLabel(int index, Canvas canvas, String dataLabel, double pointX,
          double pointY, int angle, ChartTextStyle style) =>
      _drawText(canvas, dataLabel, Offset(pointX, pointY), style, angle);
}
