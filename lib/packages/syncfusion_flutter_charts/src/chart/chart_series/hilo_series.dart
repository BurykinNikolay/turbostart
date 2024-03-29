part of charts;

/// Renders the Hilo series.
///
///HiLo series illustrates the price movements in stock using the high and low values.
///
///To render a HiLo chart, create an instance of HiloSeries, and add it to the series collection property of [SfCartesianChart].
class HiloSeries<T, D> extends _FinancialSeriesBase<T, D> {
  HiloSeries(
      {@required List<T> dataSource,
      @required ChartValueMapper<T, D> xValueMapper,
      @required ChartValueMapper<T, num> lowValueMapper,
      @required ChartValueMapper<T, num> highValueMapper,
      ChartValueMapper<T, dynamic> sortFieldValueMapper,
      ChartValueMapper<T, Color> pointColorMapper,
      ChartValueMapper<T, String> dataLabelMapper,
      SortingOrder sortingOrder,
      String xAxisName,
      String yAxisName,
      String name,
      Color color,
      MarkerSettings markerSettings,
      EmptyPointSettings emptyPointSettings,
      DataLabelSettings dataLabelSettings,
      bool isVisible,
      LinearGradient gradient,
      bool enableTooltip,
      double animationDuration,
      double borderWidth,
      SelectionSettings selectionSettings,
      bool isVisibleInLegend,
      LegendIconType legendIconType,
      String legendItemText,
      List<double> dashArray,
      double opacity,
      double spacing,
      List<int> initialSelectedDataIndexes,
      bool showIndicationForSameValues,
      List<Trendline> trendlines})
      : super(
            name: name,
            dashArray: dashArray,
            spacing: spacing,
            xValueMapper: xValueMapper,
            lowValueMapper: lowValueMapper,
            highValueMapper: highValueMapper,
            sortFieldValueMapper: sortFieldValueMapper,
            pointColorMapper: pointColorMapper,
            dataLabelMapper: dataLabelMapper,
            color: color,
            dataSource: dataSource,
            xAxisName: xAxisName,
            yAxisName: yAxisName,
            markerSettings: markerSettings,
            dataLabelSettings: dataLabelSettings,
            isVisible: isVisible,
            gradient: gradient,
            emptyPointSettings: emptyPointSettings,
            enableTooltip: enableTooltip,
            animationDuration: animationDuration,
            borderWidth: borderWidth ?? 2,
            selectionSettings: selectionSettings,
            legendItemText: legendItemText,
            isVisibleInLegend: isVisibleInLegend,
            legendIconType: legendIconType,
            sortingOrder: sortingOrder,
            opacity: opacity,
            showIndicationForSameValues: showIndicationForSameValues ?? false,
            initialSelectedDataIndexes: initialSelectedDataIndexes,
            trendlines: trendlines);
  num _rectPosition;
  num _rectCount;

  @override
  ChartSegment createSegment() => HiloSegment();

  /// Creates a collection of segments for the points in the series.
  @override
  void createSegments() {}

  void drawSegment(Canvas canvas, ChartSegment segment) {
    segment.onPaint(canvas);
  }

  /// Hilo segment is created here
  ChartSegment addSegment(CartesianChartPoint<dynamic> currentPoint,
      int pointIndex, int seriesIndex, num animateFactor) {
    _isRectSeries = false;
    final HiloSegment segment = createSegment();
    if (segment != null) {
      segment._seriesIndex = seriesIndex;
      segment.currentSegmentIndex = pointIndex;
      segment.series = this;
      segment.animationFactor = animateFactor;
      segment._pointColorMapper = currentPoint.pointColorMapper;
      segment._currentPoint = currentPoint;
      if (_chart._chartState.widgetNeedUpdate &&
          !_chart._chartState._isLegendToggled &&
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
      segment.calculateSegmentPoints();
      customizeSegment(segment);
      segment.strokePaint = segment.getStrokePaint();
      segment.fillPaint = segment.getFillPaint();
      segments.add(segment);
    }
    return segment;
  }

  /// Changes the series color, border color, and border width.
  @override
  void customizeSegment(ChartSegment segment) {
    segment.color = segment.series._seriesColor;
    segment.strokeColor = segment.series._seriesColor;
    segment.strokeWidth = segment.series.borderWidth;
  }

  ///Draws marker with different shape and color of the appropriate data point in the series.
  @override
  void drawDataMarker(int index, Canvas canvas, Paint fillPaint,
      Paint strokePaint, double pointX, double pointY) {
    canvas.drawPath(_markerShapes[index], strokePaint);
    canvas.drawPath(_markerShapes[index], fillPaint);
    canvas.drawPath(_markerShapes2[index], strokePaint);
    canvas.drawPath(_markerShapes2[index], fillPaint);
  }

  /// Draws data label text of the appropriate data point in a series.
  @override
  void drawDataLabel(int index, Canvas canvas, String dataLabel, double pointX,
          double pointY, int angle, ChartTextStyle style) =>
      _drawText(canvas, dataLabel, Offset(pointX, pointY), style, angle);
}
