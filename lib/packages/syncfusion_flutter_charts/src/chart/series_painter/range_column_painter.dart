part of charts;

class _RangeColumnChartPainter extends CustomPainter {
  _RangeColumnChartPainter(
      {this.chart,
      this.series,
      this.isRepaint,
      this.animationController,
      this.seriesAnimation,
      this.chartElementAnimation,
      ValueNotifier<num> notifier,
      this.painterKey})
      : super(repaint: notifier);

  final SfCartesianChart chart;
  final bool isRepaint;
  final AnimationController animationController;
  final Animation<double> seriesAnimation;
  final Animation<double> chartElementAnimation;
  List<_ChartLocation> currentChartLocations = <_ChartLocation>[];
  RangeColumnSeries<dynamic, dynamic> series;
  final _PainterKey painterKey;
  @override
  void paint(Canvas canvas, Size size) {
    if (series._visible) {
      Rect axisClipRect, clipRect;
      double animationFactor;
      CartesianChartPoint<dynamic> point;
      canvas.save();
      final int seriesIndex = painterKey.index;
      series.storeSeriesProperties(chart, seriesIndex);
      axisClipRect = _calculatePlotOffset(chart._chartAxis._axisClipRect,
          Offset(series._xAxis.plotOffset, series._yAxis.plotOffset));
      canvas.clipRect(axisClipRect);
      animationFactor = seriesAnimation != null ? seriesAnimation.value : 1;

      int segmentIndex = -1;
      for (int pointIndex = 0;
          pointIndex < series._dataPoints.length;
          pointIndex++) {
        point = series._dataPoints[pointIndex];
        series.calculateRegionData(
            chart, series, painterKey.index, point, pointIndex);
        if (point.isVisible && !point.isGap) {
          series.drawSegment(
              canvas,
              series.addSegment(
                  point, segmentIndex += 1, painterKey.index, animationFactor));
        }
      }
      clipRect = _calculatePlotOffset(
          Rect.fromLTRB(
              chart._chartAxis._axisClipRect.left - series.markerSettings.width,
              chart._chartAxis._axisClipRect.top - series.markerSettings.height,
              chart._chartAxis._axisClipRect.right +
                  series.markerSettings.width,
              chart._chartAxis._axisClipRect.bottom +
                  series.markerSettings.height),
          Offset(series._xAxis.plotOffset, series._yAxis.plotOffset));
      canvas.restore();
      if ((series.animationDuration <= 0 ||
              animationFactor >= chart._seriesDurationFactor) &&
          (series.markerSettings.isVisible ||
              series.dataLabelSettings.isVisible)) {
        canvas.clipRect(clipRect);
        series.renderSeriesElements(chart, canvas, chartElementAnimation);
      }
      if (animationFactor >= 1) {
        chart._chartState
            .setPainterKey(painterKey.index, painterKey.name, true);
      }
    }
  }

  @override
  bool shouldRepaint(_RangeColumnChartPainter oldDelegate) => isRepaint;
}
