part of charts;

// Measure the text and return the text size
Size _measureText(String textValue, ChartTextStyle textStyle, [int angle]) {
  Size size;
  final Color color = textStyle.color;
  final double fontSize = textStyle.fontSize;
  final String fontFamily = textStyle.fontFamily;
  final FontStyle fontStyle = textStyle.fontStyle;
  final FontWeight fontWeight = textStyle.fontWeight;

  final TextPainter textPainter = TextPainter(
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
    text: TextSpan(
        text: textValue,
        style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontFamily: fontFamily,
            fontStyle: fontStyle,
            fontWeight: fontWeight)),
  );
  textPainter.layout();
  if (angle != null) {
    final Rect rect = _rotatedTextSize(textPainter.size, angle);
    size = Size(rect.width, rect.height);
  } else {
    size = Size(textPainter.width, textPainter.height);
  }
  return size;
}

num _percentageToValue(String value, num size) {
  if (value != null) {
    return value.contains('%')
        ? (size / 100) * num.tryParse(value.replaceAll(RegExp('%'), ''))
        : num.tryParse(value);
  }
  return null;
}

/// Draw the text
void _drawText(Canvas canvas, String text, Offset point, ChartTextStyle style,
    [int angle]) {
  final Color color = style.color;
  final double fontSize = style.fontSize;
  final String fontFamily = style.fontFamily;
  final FontStyle fontStyle = style.fontStyle;
  final FontWeight fontWeight = style.fontWeight;
  final num maxLines = getMaxLinesContent(text);
  final TextSpan span = TextSpan(
      text: text,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontStyle: fontStyle,
          fontWeight: fontWeight));
  final TextPainter tp = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
      maxLines: maxLines);
  tp.layout();
  canvas.save();
  canvas.translate(point.dx, point.dy);
  Offset labelOffset = const Offset(0.0, 0.0);
  if (angle != null && angle > 0) {
    canvas.rotate(_degreeToRadian(angle));
    labelOffset = Offset(-tp.width / 2, -tp.height / 2);
  }
  tp.paint(canvas, labelOffset);
  canvas.restore();
}

num getMaxLinesContent(String text) {
  return text != null && text.isNotEmpty && text.contains('\n')
      ? text.split('\n').length
      : 1;
}

vector.Vector2 _offsetToVector2(Offset offset) =>
    vector.Vector2(offset.dx, offset.dy);

Offset _vector2ToOffset(vector.Vector2 vector) => Offset(vector.x, vector.y);

Offset _transform(
  vector.Matrix2 matrix,
  Offset offset,
) {
  return _vector2ToOffset(matrix * _offsetToVector2(offset));
}

Rect _rotatedTextSize(Size size, int angle) {
  final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
  final vector.Matrix2 _rotatorMatrix =
      vector.Matrix2.rotation(_degreeToRadian(angle));

  final Rect movedToCenterAsOrigin = rect.shift(-rect.center);

  Offset _topLeft = movedToCenterAsOrigin.topLeft;
  Offset _topRight = movedToCenterAsOrigin.topRight;
  Offset _bottomLeft = movedToCenterAsOrigin.bottomLeft;
  Offset _bottomRight = movedToCenterAsOrigin.bottomRight;

  _topLeft = _transform(_rotatorMatrix, _topLeft);
  _topRight = _transform(_rotatorMatrix, _topRight);
  _bottomLeft = _transform(_rotatorMatrix, _bottomLeft);
  _bottomRight = _transform(_rotatorMatrix, _bottomRight);

  final List<Offset> rotOffsets = <Offset>[
    _topLeft,
    _topRight,
    _bottomLeft,
    _bottomRight
  ];

  final double minX =
      rotOffsets.map((Offset offset) => offset.dx).reduce(math.min);
  final double maxX =
      rotOffsets.map((Offset offset) => offset.dx).reduce(math.max);
  final double minY =
      rotOffsets.map((Offset offset) => offset.dy).reduce(math.min);
  final double maxY =
      rotOffsets.map((Offset offset) => offset.dy).reduce(math.max);

  final Rect rotateRect = Rect.fromPoints(
    Offset(minX, minY),
    Offset(maxX, maxY),
  );
  return rotateRect;
}

// Draw the path
void _drawDashedPath(Canvas canvas, _CustomPaintStyle style, Offset moveToPoint,
    Offset lineToPoint,
    [List<double> dashArray]) {
  bool even = false;
  final Path path = Path();
  path.moveTo(moveToPoint.dx, moveToPoint.dy);
  path.lineTo(lineToPoint.dx, lineToPoint.dy);
  final Paint paint = Paint();
  paint.strokeWidth = style.strokeWidth;
  paint.color = style.color;
  paint.style = style.paintStyle;

  if (dashArray != null) {
    for (int i = 1; i < dashArray.length; i = i + 2) {
      if (dashArray[i] == 0) {
        even = true;
      }
    }
    if (even == false && !kIsWeb) {
      canvas.drawPath(
          _dashPath(
            path,
            dashArray: _CircularIntervalList<double>(dashArray),
          ),
          paint);
    } else
      canvas.drawPath(path, paint);
  } else
    canvas.drawPath(path, paint);
}

/// Convert degree to radian
num _degreeToRadian(int deg) => deg * (math.pi / 180);

/// find the position of point
num _valueToCoefficient(num value, ChartAxis axis) {
  num result = 0;
  if (axis._visibleRange != null && value != null) {
    final _VisibleRange range = axis._visibleRange;
    if (range != null) {
      result = (value - range.minimum) / (range.delta);
      result = axis.isInversed ? (1 - result) : result;
    }
  }
  return result;
}

num _logBase(num value, num base) => math.log(value) / math.log(base);

bool _withIn(num value, _VisibleRange range) =>
    (value <= range.maximum) && (value >= range.minimum);

/// Get the location of point
_ChartLocation _calculatePoint(num x, num y, ChartAxis xAxis, ChartAxis yAxis,
    bool isInverted, CartesianSeries<dynamic, dynamic> series, Rect rect) {
  x = xAxis is LogarithmicAxis ? _logBase(x > 1 ? x : 1, xAxis.logBase) : x;
  y = yAxis is LogarithmicAxis ? _logBase(y > 1 ? y : 1, yAxis.logBase) : y;
  x = _valueToCoefficient(x, xAxis);
  y = _valueToCoefficient(y, yAxis);
  final num xLength = isInverted ? rect.height : rect.width;
  final num yLength = isInverted ? rect.width : rect.height;
  final num locationX =
      rect.left + (isInverted ? (y * yLength) : (x * xLength));
  final num locationY =
      rect.top + (isInverted ? (1 - x) * xLength : (1 - y) * yLength);
  return _ChartLocation(locationX, locationY);
}

/// Calculate the minimum points delta
num _calculateMinPointsDelta(
    ChartAxis axis,
    List<CartesianSeries<dynamic, dynamic>> seriesCollection,
    SfCartesianChart chart) {
  num minDelta = 1.7976931348623157e+308, minVal, seriesMin;
  dynamic xValues;
  num value;
  for (CartesianSeries<dynamic, dynamic> series in seriesCollection) {
    xValues = <dynamic>[];
    if (series._visible &&
        ((axis._name == series.xAxisName) ||
            (axis._name == 'primaryXAxis' && series.xAxisName == null) ||
            (axis._name == chart.primaryXAxis._name &&
                series.xAxisName != null))) {
      xValues =
          series._dataPoints.map<dynamic>((CartesianChartPoint<dynamic> point) {
        return point.xValue;
      }).toList();

      xValues.sort();
      if (xValues.length == 1) {
        seriesMin =
            (axis is DateTimeAxis && series._minimumX == series._maximumX)
                ? (series._minimumX - 2592000000)
                : series._minimumX;
        minVal = xValues[0] -
            (seriesMin != null ? seriesMin : axis._visibleRange.minimum);
        if (minVal != 0) {
          minDelta = math.min(minDelta, minVal);
        }
      } else {
        for (int i = 0; i < xValues.length; i++) {
          value = xValues[i];
          if (i > 0 && value != null) {
            minVal = value - xValues[i - 1];
            if (minVal != 0) {
              minDelta = math.min(minDelta, minVal);
            }
          }
        }
      }
    }
  }
  if (minDelta == 1.7976931348623157e+308) {
    minDelta = 1;
  }

  return minDelta;
}

/// Draw different marker shapes by using height and width
class _ChartShapeUtils {
  /// Draw the circle shape marker
  static void _drawCircle(
      Path path, double x, double y, double width, double height) {
    path.addArc(
        Rect.fromLTRB(
            x - width / 2, y - height / 2, x + width / 2, y + height / 2),
        0.0,
        2 * math.pi);
  }

  /// Draw the Rectangle shape marker
  static void _drawRectangle(
      Path path, double x, double y, double width, double height) {
    path.addRect(Rect.fromLTRB(
        x - width / 2, y - height / 2, x + width / 2, y + height / 2));
  }

  ///Draw the Pentagon shape marker
  static void _drawPentagon(
      Path path, double x, double y, double width, double height) {
    const dynamic eq = 72;
    double xValue;
    double yValue;
    for (dynamic i = 0; i <= 5; i++) {
      xValue = width / 2 * math.cos((math.pi / 180) * (i * eq));
      yValue = height / 2 * math.sin((math.pi / 180) * (i * eq));
      i == 0
          ? path.moveTo(x + xValue, y + yValue)
          : path.lineTo(x + xValue, y + yValue);
    }
    path.close();
  }

  ///Draw the Vertical line shape marker
  static void _drawVerticalLine(
      Path path, double x, double y, double width, double height) {
    path.moveTo(x, y + height / 2);
    path.lineTo(x, y - height / 2);
  }

  ///Draw the Inverted Triangle shape marker
  static void _drawInvertedTriangle(
      Path path, double x, double y, double width, double height) {
    path.moveTo(x + width / 2, y - height / 2);
    path.lineTo(x, y + height / 2);
    path.lineTo(x - width / 2, y - height / 2);
    path.lineTo(x + width / 2, y - height / 2);
    path.close();
  }

  ///Draw the Horizontal line shape marker
  static void _drawHorizontalLine(
      Path path, double x, double y, double width, double height) {
    path.moveTo(x - width / 2, y);
    path.lineTo(x + width / 2, y);
  }

  ///Draw the Diamond shape marker
  static void _drawDiamond(
      Path path, double x, double y, double width, double height) {
    path.moveTo(x - width / 2, y);
    path.lineTo(x, y + height / 2);
    path.lineTo(x + width / 2, y);
    path.lineTo(x, y - height / 2);
    path.lineTo(x - width / 2, y);
    path.close();
  }

  ///Draw the Triangle shape marker
  static void _drawTriangle(
      Path path, double x, double y, double width, double height) {
    path.moveTo(x - width / 2, y + height / 2);
    path.lineTo(x + width / 2, y + height / 2);
    path.lineTo(x, y - height / 2);
    path.lineTo(x - width / 2, y + height / 2);
    path.close();
  }
}

///Draw Legend series type icon
PaintingStyle _calculateLegendShapes(Path path, double x, double y,
    double width, double height, String seriesType) {
  PaintingStyle style = PaintingStyle.fill;
  switch (seriesType) {
    case 'line':
    case 'fastline':
    case 'stackedline':
    case 'stackedline100':
      style = PaintingStyle.stroke;
      break;
    case 'spline':
      path.moveTo(x - width / 2, y + height / 5);
      path.quadraticBezierTo(x, y - height, x, y + height / 5);
      path.moveTo(x, y + height / 5);
      path.quadraticBezierTo(
          x + width / 2, y + height / 2, x + width / 2, y - height / 2);
      style = PaintingStyle.stroke;
      break;
    case 'splinearea':
      path.moveTo(x - width / 2, y + height / 2);
      path.quadraticBezierTo(x, y - height, x, y + height / 5);
      path.quadraticBezierTo(
          x + width / 2, y - height / 2, x + width / 2, y + height / 2);
      break;
    case 'bar':
    case 'stackedbar':
    case 'stackedbar100':
      _calculateBarTypeIconPath(path, x, y, width, height);
      break;
    case 'column':
    case 'stackedcolumn':
    case 'stackedcolumn100':
    case 'rangecolumn':
      _calculateColumnTypeIconPath(path, x, y, width, height);
      break;
    case 'area':
    case 'stackedarea':
    case 'rangearea':
    case 'stackedarea100':
      _calculateAreaTypeIconPath(path, x, y, width, height);
      break;
    case 'stepline':
      _calculateSteplineIconPath(path, x, y, width, height);
      style = PaintingStyle.stroke;
      break;
    case 'bubble':
      path.addArc(Rect.fromLTWH(x - width / 2, y - height / 2, width, height),
          0.0, 2 * math.pi);
      break;

    case 'hilo':
      path.moveTo(x, y + height / 2);
      path.lineTo(x, y - height / 2);
      style = PaintingStyle.stroke;
      break;
    case 'hiloopenclose':
    case 'candle':
      path.moveTo(x - width / 2, y);
      path.lineTo(x + width / 2, y);
      style = PaintingStyle.stroke;
      break;
    case 'pie':
      _calculatePieIconPath(path, x, y, width, height);
      break;
    case 'doughnut':
    case 'radialbar':
      break;
    case 'steparea':
      _calculateStepAreaIconPath(path, x, y, width, height);
      break;
    case 'pyramid':
      _calculatePyramidIconPath(path, x, y, width, height);
      break;
    case 'funnel':
      _calculateFunnelIconPath(path, x, y, width, height);
      break;
    default:
      path.addArc(
          Rect.fromLTRB(
              x - width / 2, y - height / 2, x + width / 2, y + height / 2),
          0.0,
          2 * math.pi);
      break;
  }
  return style;
}

///calculate bar legend icon path
void _calculateBarTypeIconPath(
    Path path, double x, double y, double width, double height) {
  const num padding = 10;
  path.moveTo(x - (width / 2) - padding / 4, y - 3 * (height / 5));
  path.lineTo(x + 3 * (width / 10), y - 3 * (height / 5));
  path.lineTo(x + 3 * (width / 10), y - 3 * (height / 10));
  path.lineTo(x - (width / 2) - padding / 4, y - 3 * (height / 10));
  path.close();
  path.moveTo(
      x - (width / 2) - (padding / 4), y - (height / 5) + (padding / 20));
  path.lineTo(
      x + (width / 2) + (padding / 4), y - (height / 5) + (padding / 20));
  path.lineTo(
      x + (width / 2) + (padding / 4), y + (height / 10) + (padding / 20));
  path.lineTo(
      x - (width / 2) - (padding / 4), y + (height / 10) + (padding / 20));
  path.close();
  path.moveTo(
      x - (width / 2) - (padding / 4), y + (height / 5) + (padding / 10));
  path.lineTo(x - width / 4, y + (height / 5) + (padding / 10));
  path.lineTo(x - width / 4, y + (height / 2) + (padding / 10));
  path.lineTo(
      x - (width / 2) - (padding / 4), y + (height / 2) + (padding / 10));
  path.close();
}

///calculate column legend icon path
void _calculateColumnTypeIconPath(
    Path path, double x, double y, double width, double height) {
  const num padding = 10;
  path.moveTo(x - 3 * (width / 5), y - (height / 5));
  path.lineTo(x + 3 * (-width / 10), y - (height / 5));
  path.lineTo(x + 3 * (-width / 10), y + (height / 2));
  path.lineTo(x - 3 * (width / 5), y + (height / 2));
  path.close();
  path.moveTo(
      x - (width / 10) - (width / 20), y - (height / 4) - (padding / 2));
  path.lineTo(
      x + (width / 10) + (width / 20), y - (height / 4) - (padding / 2));
  path.lineTo(x + (width / 10) + (width / 20), y + (height / 2));
  path.lineTo(x - (width / 10) - (width / 20), y + (height / 2));
  path.close();
  path.moveTo(x + 3 * (width / 10), y);
  path.lineTo(x + 3 * (width / 5), y);
  path.lineTo(x + 3 * (width / 5), y + (height / 2));
  path.lineTo(x + 3 * (width / 10), y + (height / 2));
  path.close();
}

///calculate area type legend icon path
void _calculateAreaTypeIconPath(
    Path path, double x, double y, double width, double height) {
  const num padding = 10;
  path.moveTo(x - (width / 2) - (padding / 4), y + (height / 2));
  path.lineTo(x - (width / 4) - (padding / 8), y - (height / 2));
  path.lineTo(x, y + (height / 4));
  path.lineTo(x + (width / 4) + (padding / 8), y - (height / 2) + (height / 4));
  path.lineTo(x + (height / 2) + (padding / 4), y + (height / 2));
  path.close();
}

///calculate stepline legend icon path
void _calculateSteplineIconPath(
    Path path, double x, double y, double width, double height) {
  const num padding = 10;
  path.moveTo(x - (width / 2) - (padding / 4), y + (height / 2));
  path.lineTo(x - (width / 2) + (width / 10), y + (height / 2));
  path.lineTo(x - (width / 2) + (width / 10), y);
  path.lineTo(x - (width / 10), y);
  path.lineTo(x - (width / 10), y + (height / 2));
  path.lineTo(x + (width / 5), y + (height / 2));
  path.lineTo(x + (width / 5), y - (height / 2));
  path.lineTo(x + (width / 2), y - (height / 2));
  path.lineTo(x + (width / 2), y + (height / 2));
  path.lineTo(x + (width / 2) + (padding / 4), y + (height / 2));
}

///calculate steparea legend icon path
void _calculateStepAreaIconPath(
    Path path, double x, double y, double width, double height) {
  const num padding = 10;
  path.moveTo(x - (width / 2) - (padding / 4), y + (height / 2));
  path.lineTo(x - (width / 2) - (padding / 4), y - (height / 4));
  path.lineTo(x - (width / 2) + (width / 10), y - (height / 4));
  path.lineTo(x - (width / 2) + (width / 10), y - (height / 2));
  path.lineTo(x - (width / 10), y - (height / 2));
  path.lineTo(x - (width / 10), y);
  path.lineTo(x + (width / 5), y);
  path.lineTo(x + (width / 5), y - (height / 3));
  path.lineTo(x + (width / 2), y - (height / 3));
  path.lineTo(x + (width / 2), y + (height / 2));
  path.close();
}

///Calculate pie legend icon path
void _calculatePieIconPath(
    Path path, double x, double y, double width, double height) {
  final num r = math.min(height, width) / 2;
  path.moveTo(x, y);
  path.lineTo(x + r, y);
  path.arcTo(Rect.fromCircle(center: Offset(x, y), radius: r),
      _degreesToRadians(0), _degreesToRadians(270), false);
  path.close();
  path.moveTo(x + width / 10, y - height / 10);
  path.lineTo(x + r, y - height / 10);
  path.arcTo(Rect.fromCircle(center: Offset(x + 2, y - 2), radius: r),
      _degreesToRadians(-5), _degreesToRadians(-80), false);
  path.close();
}

///calculate pyramid legend icon path
void _calculatePyramidIconPath(
    Path path, double x, double y, double width, double height) {
  path.moveTo(x - width / 2, y + height / 2);
  path.lineTo(x + width / 2, y + height / 2);
  path.lineTo(x, y - height / 2);
  path.lineTo(x - width / 2, y + height / 2);
  path.close();
}

///calculate funnel legend icon path
void _calculateFunnelIconPath(
    Path path, double x, double y, double width, double height) {
  path.moveTo(x + width / 2, y - height / 2);
  path.lineTo(x, y + height / 2);
  path.lineTo(x - width / 2, y - height / 2);
  path.lineTo(x + width / 2, y - height / 2);
  path.close();
}

/// Calculate the rect bounds for column series and Bar series.
Rect _calculateRectangle(num x1, num y1, num x2, num y2,
    CartesianSeries<dynamic, dynamic> series, SfCartesianChart chart) {
  final Rect rect = _calculatePlotOffset(chart._chartAxis._axisClipRect,
      Offset(series._xAxis.plotOffset, series._yAxis.plotOffset));
  final bool isInverted = chart._requireInvertedAxis;
  final _ChartLocation point1 = _calculatePoint(
      x1, y1, series._xAxis, series._yAxis, isInverted, series, rect);
  final _ChartLocation point2 = _calculatePoint(
      x2, y2, series._xAxis, series._yAxis, isInverted, series, rect);
  return Rect.fromLTWH(
      math.min(point1.x, point2.x),
      math.min(point1.y, point2.y),
      (point2.x - point1.x).abs(),
      (point2.y - point1.y).abs());
}

///Calculate the tracker rect bounds for column series and Bar series.
Rect _calculateShadowRectangle(
    num x1,
    num y1,
    num x2,
    num y2,
    CartesianSeries<dynamic, dynamic> series,
    SfCartesianChart chart,
    Offset plotOffset) {
  final Rect rect = _calculatePlotOffset(chart._chartAxis._axisClipRect,
      Offset(series._xAxis.plotOffset, series._yAxis.plotOffset));
  final bool isInverted = chart._requireInvertedAxis;
  final _ChartLocation point1 = _calculatePoint(
      x1, y1, series._xAxis, series._yAxis, isInverted, series, rect);
  final _ChartLocation point2 = _calculatePoint(
      x2, y2, series._xAxis, series._yAxis, isInverted, series, rect);
  final bool isColumn = series._seriesType == 'column';
  final bool isStackedColumn = series._seriesType == 'stackedcolumn';
  final bool isStackedBar = series._seriesType == 'stackedbar';
  final bool isRangeColumn = series._seriesType == 'rangecolumn';
  ColumnSeries<dynamic, dynamic> columnSeries;
  BarSeries<dynamic, dynamic> barSeries;
  StackedColumnSeries<dynamic, dynamic> stackedColumnSeries;
  StackedBarSeries<dynamic, dynamic> stackedBarSeries;
  RangeColumnSeries<dynamic, dynamic> rangeColumnSeries;
  if (series._seriesType == 'column') {
    columnSeries = series;
  } else if (series._seriesType == 'bar') {
    barSeries = series;
  } else if (series._seriesType == 'stackedcolumn') {
    stackedColumnSeries = series;
  } else if (series._seriesType == 'stackedbar') {
    stackedBarSeries = series;
  } else if (series._seriesType == 'rangecolumn') {
    rangeColumnSeries = series;
  }

  return !chart.isTransposed
      ? _getNormalShadowRect(
          rect,
          isColumn,
          isRangeColumn,
          isStackedColumn,
          isStackedBar,
          chart,
          plotOffset,
          point1,
          point2,
          columnSeries,
          barSeries,
          stackedColumnSeries,
          stackedBarSeries,
          rangeColumnSeries)
      : _getTransposedShadowRect(
          rect,
          isColumn,
          isRangeColumn,
          isStackedColumn,
          isStackedBar,
          chart,
          plotOffset,
          point1,
          point2,
          columnSeries,
          barSeries,
          stackedColumnSeries,
          stackedBarSeries,
          rangeColumnSeries);
}

/// calculate shadow rectangle for normal rect series
Rect _getNormalShadowRect(
    Rect rect,
    bool isColumn,
    bool isRangeColumn,
    bool isStackedColumn,
    bool isStackedBar,
    SfCartesianChart chart,
    Offset plotOffset,
    _ChartLocation point1,
    _ChartLocation point2,
    ColumnSeries<dynamic, dynamic> columnSeries,
    BarSeries<dynamic, dynamic> barSeries,
    StackedColumnSeries<dynamic, dynamic> stackedColumnSeries,
    StackedBarSeries<dynamic, dynamic> stackedBarSeries,
    RangeColumnSeries<dynamic, dynamic> rangeColumnSeries) {
  return Rect.fromLTWH(
      isColumn
          ? math.min(point1.x, point2.x) +
              (-columnSeries.trackBorderWidth - columnSeries.trackPadding)
          : isRangeColumn
              ? math.min(point1.x, point2.x) +
                  (-rangeColumnSeries.trackBorderWidth -
                      rangeColumnSeries.trackPadding)
              : isStackedColumn
                  ? math.min(point1.x, point2.x) +
                      (-stackedColumnSeries.trackBorderWidth -
                          stackedColumnSeries.trackPadding)
                  : isStackedBar
                      ? chart._chartAxis._axisClipRect.left
                      : chart._chartAxis._axisClipRect.left,
      isColumn || isRangeColumn
          ? rect.top
          : isStackedColumn
              ? rect.top
              : isStackedBar
                  ? (math.min(point1.y, point2.y) -
                      stackedBarSeries.trackBorderWidth -
                      stackedBarSeries.trackPadding)
                  : (math.min(point1.y, point2.y) -
                      barSeries.trackBorderWidth -
                      barSeries.trackPadding),
      isColumn
          ? (point2.x - point1.x).abs() +
              (columnSeries.trackBorderWidth * 2) +
              columnSeries.trackPadding * 2
          : isRangeColumn
              ? (point2.x - point1.x).abs() +
                  (rangeColumnSeries.trackBorderWidth * 2) +
                  rangeColumnSeries.trackPadding * 2
              : isStackedColumn
                  ? (point2.x - point1.x).abs() +
                      (stackedColumnSeries.trackBorderWidth * 2) +
                      stackedColumnSeries.trackPadding * 2
                  : isStackedBar
                      ? chart._chartAxis._axisClipRect.width
                      : chart._chartAxis._axisClipRect.width,
      isColumn || isRangeColumn
          ? (chart._chartAxis._axisClipRect.height - 2 * plotOffset.dy)
          : isStackedColumn
              ? (chart._chartAxis._axisClipRect.height - 2 * plotOffset.dy)
              : isStackedBar
                  ? (point2.y - point1.y).abs() +
                      stackedBarSeries.trackBorderWidth * 2 +
                      stackedBarSeries.trackPadding * 2
                  : (point2.y - point1.y).abs() +
                      barSeries.trackBorderWidth * 2 +
                      barSeries.trackPadding * 2);
}

/// calculate shadow rectangle for transposed rect series
Rect _getTransposedShadowRect(
    Rect rect,
    bool isColumn,
    bool isRangeColumn,
    bool isStackedColumn,
    bool isStackedBar,
    SfCartesianChart chart,
    Offset plotOffset,
    _ChartLocation point1,
    _ChartLocation point2,
    ColumnSeries<dynamic, dynamic> columnSeries,
    BarSeries<dynamic, dynamic> barSeries,
    StackedColumnSeries<dynamic, dynamic> stackedColumnSeries,
    StackedBarSeries<dynamic, dynamic> stackedBarSeries,
    RangeColumnSeries<dynamic, dynamic> rangeColumnSeries) {
  return Rect.fromLTWH(
      isColumn || isRangeColumn
          ? chart._chartAxis._axisClipRect.left
          : isStackedColumn
              ? chart._chartAxis._axisClipRect.left
              : isStackedBar
                  ? math.min(point1.x, point2.x) +
                      (-stackedBarSeries.trackBorderWidth -
                          stackedBarSeries.trackPadding)
                  : math.min(point1.x, point2.x) +
                      (-barSeries.trackBorderWidth - barSeries.trackPadding),
      isColumn
          ? (math.min(point1.y, point2.y) -
              columnSeries.trackBorderWidth -
              columnSeries.trackPadding)
          : isRangeColumn
              ? (math.min(point1.y, point2.y) -
                  rangeColumnSeries.trackBorderWidth -
                  rangeColumnSeries.trackPadding)
              : isStackedColumn
                  ? (math.min(point1.y, point2.y) -
                      stackedColumnSeries.trackBorderWidth -
                      stackedColumnSeries.trackPadding)
                  : isStackedBar ? rect.top : rect.top,
      isColumn || isRangeColumn
          ? chart._chartAxis._axisClipRect.width
          : isStackedColumn
              ? chart._chartAxis._axisClipRect.width
              : isStackedBar
                  ? (point2.x - point1.x).abs() +
                      (stackedBarSeries.trackBorderWidth * 2) +
                      stackedBarSeries.trackPadding * 2
                  : (point2.x - point1.x).abs() +
                      (barSeries.trackBorderWidth * 2) +
                      barSeries.trackPadding * 2,
      isColumn
          ? ((point2.y - point1.y).abs() +
              columnSeries.trackBorderWidth * 2 +
              columnSeries.trackPadding * 2)
          : isRangeColumn
              ? (point2.y - point1.y).abs() +
                  rangeColumnSeries.trackBorderWidth * 2 +
                  rangeColumnSeries.trackPadding * 2
              : isStackedColumn
                  ? (point2.y - point1.y).abs() +
                      stackedColumnSeries.trackBorderWidth * 2 +
                      stackedColumnSeries.trackPadding * 2
                  : isStackedBar
                      ? (chart._chartAxis._axisClipRect.height -
                          2 * plotOffset.dy)
                      : (chart._chartAxis._axisClipRect.height -
                          2 * plotOffset.dy));
}

/// Calculated the side by side range for Column and bar series
_VisibleRange _calculateSideBySideInfo(
    CartesianSeries<dynamic, dynamic> series, SfCartesianChart chart) {
  num rectPosition;
  num count;
  num seriesSpacing;
  num pointSpacing;
  if (series._seriesType == 'column' && chart.enableSideBySideSeriesPlacement) {
    final ColumnSeries<dynamic, dynamic> columnSeries = series;
    _calculateSideBySidePositions(series, chart);
    rectPosition = columnSeries._rectPosition;
    count = columnSeries._rectCount;
  } else if (series._seriesType == 'bar' &&
      chart.enableSideBySideSeriesPlacement) {
    final BarSeries<dynamic, dynamic> barSeries = series;
    _calculateSideBySidePositions(series, chart);
    rectPosition = barSeries._rectPosition;
    count = barSeries._rectCount;
  } else if ((series._seriesType.contains('stackedcolumn') ||
          series._seriesType.contains('stackedbar')) &&
      chart.enableSideBySideSeriesPlacement) {
    final _StackedSeriesBase<dynamic, dynamic> stackedRectSeries = series;
    _calculateSideBySidePositions(series, chart);
    rectPosition = stackedRectSeries._rectPosition;
    count = stackedRectSeries._rectCount;
  } else if (series._seriesType == 'rangecolumn' &&
      chart.enableSideBySideSeriesPlacement) {
    final RangeColumnSeries<dynamic, dynamic> rangeColumnSeries = series;
    _calculateSideBySidePositions(series, chart);
    rectPosition = rangeColumnSeries._rectPosition;
    count = rangeColumnSeries._rectCount;
  } else if (series._seriesType == 'hilo' &&
      chart.enableSideBySideSeriesPlacement) {
    final HiloSeries<dynamic, dynamic> hiloSeries = series;
    _calculateSideBySidePositions(series, chart);
    rectPosition = hiloSeries._rectPosition;
    count = hiloSeries._rectCount;
  } else if (series._seriesType == 'hiloopenclose' &&
      chart.enableSideBySideSeriesPlacement) {
    final HiloOpenCloseSeries<dynamic, dynamic> hiloOpenCloseSeries = series;
    _calculateSideBySidePositions(series, chart);
    rectPosition = hiloOpenCloseSeries._rectPosition;
    count = hiloOpenCloseSeries._rectCount;
  } else if (series._seriesType == 'candle' &&
      chart.enableSideBySideSeriesPlacement) {
    final CandleSeries<dynamic, dynamic> candleSeries = series;
    _calculateSideBySidePositions(series, chart);
    rectPosition = candleSeries._rectPosition;
    count = candleSeries._rectCount;
  }

  if (series._seriesType == 'column') {
    final ColumnSeries<dynamic, dynamic> columnSeries = series;
    seriesSpacing =
        chart.enableSideBySideSeriesPlacement ? columnSeries.spacing : 0;
    pointSpacing = columnSeries.width;
  } else if (series._seriesType == 'stackedcolumn' ||
      series._seriesType == 'stackedcolumn100' ||
      series._seriesType == 'stackedbar' ||
      series._seriesType == 'stackedbar100') {
    final _StackedSeriesBase<dynamic, dynamic> stackedRectSeries = series;
    seriesSpacing =
        chart.enableSideBySideSeriesPlacement ? stackedRectSeries.spacing : 0;
    pointSpacing = stackedRectSeries.width;
  } else if (series._seriesType == 'rangecolumn') {
    final RangeColumnSeries<dynamic, dynamic> rangeColumnSeries = series;
    seriesSpacing =
        chart.enableSideBySideSeriesPlacement ? rangeColumnSeries.spacing : 0;
    pointSpacing = rangeColumnSeries.width;
  } else if (series._seriesType == 'hilo') {
    final HiloSeries<dynamic, dynamic> hiloSeries = series;
    seriesSpacing =
        chart.enableSideBySideSeriesPlacement ? hiloSeries.spacing : 0;
    pointSpacing = hiloSeries.width;
  } else if (series._seriesType == 'hiloopenclose') {
    final HiloOpenCloseSeries<dynamic, dynamic> hiloOpenCloseSeries = series;
    seriesSpacing =
        chart.enableSideBySideSeriesPlacement ? hiloOpenCloseSeries.spacing : 0;
    pointSpacing = hiloOpenCloseSeries.width;
  } else if (series._seriesType == 'candle') {
    final CandleSeries<dynamic, dynamic> candleSeries = series;
    seriesSpacing =
        chart.enableSideBySideSeriesPlacement ? candleSeries.spacing : 0;
    pointSpacing = candleSeries.width;
  } else {
    final BarSeries<dynamic, dynamic> barSeries = series;
    seriesSpacing =
        chart.enableSideBySideSeriesPlacement ? barSeries.spacing : 0;
    pointSpacing = barSeries.width;
  }
  final num position =
      !chart.enableSideBySideSeriesPlacement ? 0 : rectPosition;
  final num rectCount = !chart.enableSideBySideSeriesPlacement ? 1 : count;

  /// Gets the minimum point delta in series
  final num minPointsDelta = series._minDelta ??
      _calculateMinPointsDelta(
          series._xAxis, chart._chartSeries.visibleSeries, chart);
  final num width = minPointsDelta * pointSpacing;
  final num location = position / rectCount - 0.5;
  _VisibleRange doubleRange =
      _VisibleRange(location, location + (1 / rectCount));

  /// Side by side range will be calculated based on calculated width.
  if ((doubleRange.minimum is num) && (doubleRange.maximum is num)) {
    doubleRange =
        _VisibleRange(doubleRange.minimum * width, doubleRange.maximum * width);
    doubleRange.delta = doubleRange.maximum - doubleRange.minimum;
    final num radius = seriesSpacing * doubleRange.delta;
    doubleRange = _VisibleRange(
        doubleRange.minimum + radius / 2, doubleRange.maximum - radius / 2);
    doubleRange.delta = doubleRange.maximum - doubleRange.minimum;
  }
  return doubleRange;
}

_ChartLocation _getRotatedTextLocation(double pointX, double pointY,
    String labelText, ChartTextStyle textStyle, int angle, ChartAxis axis) {
  if (angle > 0) {
    final Size textSize = _measureText(labelText, textStyle);
    final Size rotateTextSize = _measureText(labelText, textStyle, angle);

    /// label rotation for 0 to 90
    pointX += ((rotateTextSize.width - textSize.width).abs() / 2) +
        (((angle > 90 ? 90 : angle) / 90) * textSize.height);

    /// label rotation for 90 to 180
    pointX += (angle > 90) ? (rotateTextSize.width - textSize.height).abs() : 0;
    pointY += (angle > 90)
        ? (angle / 180) * textSize.height -
            (((180 - angle) / 180) * textSize.height)
        : 0;

    /// label rotation 180 to 270
    pointX -= (angle > 180) ? (angle / 270) * textSize.height : 0;
    pointY += (angle > 180)
        ? (rotateTextSize.height - textSize.height).abs() -
            (angle / 270) * textSize.height
        : 0;

    /// label rotation 270 to 360
    pointX -=
        (angle > 270) ? (rotateTextSize.width - textSize.height).abs() : 0;
    pointY -= (angle > 270)
        ? (((angle - 270) / 90) * textSize.height) +
            (textSize.height * ((angle - 270) / 90)) / 2
        : 0;

    if (axis != null && axis.labelRotation.isNegative) {
      final num rotation = axis.labelRotation.abs();
      if (rotation > 15 && rotation < 90) {
        pointX -= (rotateTextSize.width - textSize.height).abs() / 2;
        pointY -= ((90 - rotation) / 90) / 2 * textSize.height;
      } else if (rotation > 90 && rotation < 180) {
        pointX += rotation > 164
            ? 0
            : (rotateTextSize.width - textSize.height).abs() / 2 +
                ((rotation - 90) / 90) / 2 * textSize.height;
        pointY += (rotation / 180) / 2 * textSize.height;
      } else if (rotation > 195 && rotation < 270) {
        pointX -= (rotateTextSize.width - textSize.height).abs() / 2;
      } else if (rotation > 270 && rotation < 360) {
        pointX += (rotateTextSize.width - textSize.height).abs() / 2;
      }
    }
  }
  return _ChartLocation(pointX, pointY);
}

/// Calculate the side by side position for Rect series
void _calculateSideBySidePositions(
    CartesianSeries<dynamic, dynamic> series, SfCartesianChart chart) {
  final List<CartesianSeries<dynamic, dynamic>> seriesCollection =
      _findRectSeriesCollection(chart);
  num rectCount = 0;
  num position;
  List<_StackingGroup> stackingGroupPos;
  for (CartesianSeries<dynamic, dynamic> series in seriesCollection) {
    if (series is ColumnSeries) {
      series._rectPosition = rectCount++;
      series._rectCount = seriesCollection.length;
    } else if (series is BarSeries) {
      series._rectPosition = rectCount++;
      series._rectCount = seriesCollection.length;
    } else if (series is RangeColumnSeries) {
      series._rectPosition = rectCount++;
      series._rectCount = seriesCollection.length;
    } else if (series is HiloSeries) {
      series._rectPosition = rectCount++;
      series._rectCount = seriesCollection.length;
    } else if (series is HiloOpenCloseSeries) {
      series._rectPosition = rectCount++;
      series._rectCount = seriesCollection.length;
    } else if (series is CandleSeries) {
      series._rectPosition = rectCount++;
      series._rectCount = seriesCollection.length;
    }
  }
  if (series is _StackedSeriesBase) {
    for (int i = 0; i < seriesCollection.length; i++) {
      _StackedSeriesBase<dynamic, dynamic> series;
      if (seriesCollection[i] is _StackedSeriesBase<dynamic, dynamic>) {
        series = seriesCollection[i];
      }
      if (series != null) {
        final String groupName = series.groupName;
        if (groupName != null) {
          stackingGroupPos ??= <_StackingGroup>[];
          if (stackingGroupPos.isEmpty) {
            series._rectPosition = rectCount;
            stackingGroupPos.add(_StackingGroup(groupName, rectCount++));
          } else if (stackingGroupPos.isNotEmpty) {
            for (int j = 0; j < stackingGroupPos.length; j++) {
              if (groupName == stackingGroupPos[j].groupName) {
                series._rectPosition = stackingGroupPos[j].stackCount;
                break;
              } else if (groupName != stackingGroupPos[j].groupName &&
                  j == stackingGroupPos.length - 1) {
                series._rectPosition = rectCount;
                stackingGroupPos.add(_StackingGroup(groupName, rectCount++));
                break;
              }
            }
          }
        } else {
          if (position == null) {
            series._rectPosition = rectCount;
            position = rectCount++;
          } else {
            series._rectPosition = position;
          }
        }
      }
    }
  }
  if (series._seriesType.contains('stackedcolumn') ||
      series._seriesType.contains('stackedbar')) {
    for (int i = 0; i < seriesCollection.length; i++) {
      _StackedSeriesBase<dynamic, dynamic> series;
      if (seriesCollection[i] is _StackedSeriesBase<dynamic, dynamic>) {
        series = seriesCollection[i];
      }
      if (series != null) {
        series._rectCount = rectCount;
      }
    }
  }
}

/// Find the column and bar series collection in axes.
List<CartesianSeries<dynamic, dynamic>> _findSeriesCollection(
    SfCartesianChart chart,
    [bool isRect]) {
  final List<CartesianSeries<dynamic, dynamic>> seriesCollection =
      <CartesianSeries<dynamic, dynamic>>[];
  for (int xAxisIndex = 0;
      xAxisIndex < chart._chartAxis._horizontalAxes.length;
      xAxisIndex++) {
    final ChartAxis xAxis = chart._chartAxis._horizontalAxes[xAxisIndex];
    for (int xSeriesIndex = 0;
        xSeriesIndex < xAxis._series.length;
        xSeriesIndex++) {
      final CartesianSeries<dynamic, dynamic> xAxisSeries =
          xAxis._series[xSeriesIndex];
      for (int yAxisIndex = 0;
          yAxisIndex < chart._chartAxis._verticalAxes.length;
          yAxisIndex++) {
        final ChartAxis yAxis = chart._chartAxis._verticalAxes[yAxisIndex];
        for (int ySeriesIndex = 0;
            ySeriesIndex < yAxis._series.length;
            ySeriesIndex++) {
          final CartesianSeries<dynamic, dynamic> yAxisSeries =
              yAxis._series[ySeriesIndex];
          if (xAxisSeries == yAxisSeries &&
              (xAxisSeries._seriesType.contains('column') ||
                  xAxisSeries._seriesType.contains('bar') ||
                  xAxisSeries._seriesType.contains('hilo') ||
                  xAxisSeries._seriesType.contains('candle') ||
                  xAxisSeries._seriesType.contains('stackedarea') ||
                  xAxisSeries._seriesType.contains('stackedline')) &&
              xAxisSeries._visible) {
            seriesCollection.add(yAxisSeries);
          }
        }
      }
    }
  }
  return seriesCollection;
}

RRect getRRectFromRect(Rect rect, BorderRadius borderRadius) {
  return RRect.fromRectAndCorners(
    rect,
    bottomLeft: borderRadius.bottomLeft,
    bottomRight: borderRadius.bottomRight,
    topLeft: borderRadius.topLeft,
    topRight: borderRadius.topRight,
  );
}

List<CartesianSeries<dynamic, dynamic>> _findRectSeriesCollection(
    SfCartesianChart chart) {
  final List<CartesianSeries<dynamic, dynamic>> seriesCollection =
      <CartesianSeries<dynamic, dynamic>>[];
  ChartAxis xAxis, yAxis;
  CartesianSeries<dynamic, dynamic> xAxisSeries, yAxisSeries;
  for (int xAxisIndex = 0;
      xAxisIndex < chart._chartAxis._horizontalAxes.length;
      xAxisIndex++) {
    xAxis = chart._chartAxis._horizontalAxes[xAxisIndex];
    for (int xSeriesIndex = 0;
        xSeriesIndex < xAxis._series.length;
        xSeriesIndex++) {
      xAxisSeries = xAxis._series[xSeriesIndex];
      for (int yAxisIndex = 0;
          yAxisIndex < chart._chartAxis._verticalAxes.length;
          yAxisIndex++) {
        yAxis = chart._chartAxis._verticalAxes[yAxisIndex];
        for (int ySeriesIndex = 0;
            ySeriesIndex < yAxis._series.length;
            ySeriesIndex++) {
          yAxisSeries = yAxis._series[ySeriesIndex];
          if (xAxisSeries == yAxisSeries &&
              (xAxisSeries._seriesType.contains('column') ||
                  xAxisSeries._seriesType.contains('bar') ||
                  xAxisSeries._seriesType.contains('hilo') ||
                  xAxisSeries._seriesType == 'candle') &&
              xAxisSeries._visible) {
            seriesCollection.add(yAxisSeries);
          }
        }
      }
    }
  }
  return seriesCollection;
}

Rect _calculatePlotOffset(Rect axisClipRect, Offset plotOffset) =>
    Rect.fromLTWH(
        axisClipRect.left + plotOffset.dx,
        axisClipRect.top + plotOffset.dy,
        axisClipRect.width - 2 * plotOffset.dx,
        axisClipRect.height - 2 * plotOffset.dy);

///Get gradient fill colors
Paint _getLinearGradientPaint(
    LinearGradient gradientFill, Rect region, bool isInvertedAxis) {
  Paint gradientPaint;
  Gradient gradient;
  gradient = isInvertedAxis
      ? LinearGradient(
          colors: gradientFill.colors,
          stops: gradientFill.stops,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight)
      : LinearGradient(
          colors: gradientFill.colors,
          stops: gradientFill.stops,
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter);
  gradientPaint = Paint()
    ..shader = gradient.createShader(region)
    ..style = PaintingStyle.fill;
  return gradientPaint;
}

dynamic _getLabelValue(dynamic value, dynamic axis, [int showDigits]) {
  if (value.toString().split('.').length > 1) {
    final String str = value.toString();
    final List<dynamic> list = str.split('.');
    value = axis is LogarithmicAxis ? math.pow(10, value) : value;
    value = double.parse(value.toStringAsFixed(showDigits ?? 3));
    value = (list[1] == '0' ||
            list[1] == '00' ||
            list[1] == '000' ||
            list[1] == '0000' ||
            list[1] == '00000' ||
            list[1] == '000000' ||
            list[1] == '0000000')
        ? value.round()
        : value;
  }
  final dynamic text = axis is NumericAxis && axis.numberFormat != null
      ? axis.numberFormat.format(value)
      : value;
  return (axis.labelFormat != null && axis.labelFormat != '')
      ? axis.labelFormat.replaceAll(RegExp('{value}'), text.toString())
      : text.toString();
}

/// Calculate the X value from the current screen point
double _pointToXValue(
    SfCartesianChart chart, ChartAxis axis, Rect rect, double x, double y) {
  if (axis != null) {
    if (!chart._requireInvertedAxis) {
      return _coefficientToValue(x / rect.width, axis);
    }
    return _coefficientToValue(1 - (y / rect.height), axis);
  }
  return double.nan;
}

/// Calculate the Y value from the current screen point
// ignore: unused_element
double _pointToYValue(
    SfCartesianChart chart, ChartAxis axis, Rect rect, double x, double y) {
  if (axis != null) {
    if (!chart._requireInvertedAxis) {
      return _coefficientToValue(1 - (y / rect.height), axis);
    }
    return _coefficientToValue(x / rect.width, axis);
  }
  return double.nan;
}

num _coefficientToValue(double coefficient, ChartAxis axis) {
  double result;
  coefficient = axis.isInversed ? 1 - coefficient : coefficient;
  result =
      axis._visibleRange.minimum + (axis._visibleRange.delta * coefficient);
  return result;
}

void _needsRepaintChart(SfCartesianChart chart, SfCartesianChart oldChart) {
  if (chart.series.length == oldChart.series.length) {
    for (int seriesIndex = 0;
        seriesIndex < chart.series.length;
        seriesIndex++) {
      _canRepaintChartSeries(chart, oldChart, seriesIndex);
    }
  } else {
    // ignore: avoid_function_literals_in_foreach_calls
    chart.series.forEach(
        (ChartSeries<dynamic, dynamic> series) => series._needsRepaint = true);
  }
  if (chart._chartAxis._axisCollections.length ==
      oldChart._chartAxis._axisCollections.length) {
    for (int axisIndex = 0; axisIndex < chart.series.length; axisIndex++) {
      _canRepaintAxis(chart, oldChart, axisIndex);
      if (chart._chartAxis._needsRepaint) {
        break;
      }
    }
  } else {
    chart._chartAxis._needsRepaint = true;
  }
}

void _canRepaintChartSeries(
    SfCartesianChart chart, SfCartesianChart oldChart, int seriesIndex) {
  final CartesianSeries<dynamic, dynamic> series = chart.series[seriesIndex];
  final CartesianSeries<dynamic, dynamic> oldWidgetSeries =
      oldChart.series[seriesIndex];
  if (series.animationDuration != oldWidgetSeries.animationDuration ||
      oldChart._chartSeries != chart._chartSeries ||
      series.color?.value != oldWidgetSeries.color?.value ||
      series.width != oldWidgetSeries.width ||
      series.isVisible != oldWidgetSeries.isVisible ||
      series.enableTooltip != oldWidgetSeries.enableTooltip ||
      series.name != oldWidgetSeries.name ||
      series.gradient != oldWidgetSeries.gradient ||
      series._xAxis?._visibleRange?.delta !=
          oldWidgetSeries._xAxis?._visibleRange?.delta ||
      series._xAxis?._visibleRange?.maximum !=
          oldWidgetSeries._xAxis?._visibleRange?.maximum ||
      series._xAxis?._visibleRange?.minimum !=
          oldWidgetSeries._xAxis?._visibleRange?.minimum ||
      series._xAxis?._visibleRange?.interval !=
          oldWidgetSeries._xAxis?._visibleRange?.interval ||
      series._xAxis?.isVisible != oldWidgetSeries._xAxis?.isVisible ||
      series._xAxis?._bounds != oldWidgetSeries._xAxis?._bounds ||
      series._xAxis?.isInversed != oldWidgetSeries._xAxis?.isInversed ||
      series._xAxis?.desiredIntervals !=
          oldWidgetSeries._xAxis?.desiredIntervals ||
      series._xAxis?.enableAutoIntervalOnZooming !=
          oldWidgetSeries._xAxis?.enableAutoIntervalOnZooming ||
      series._xAxis?.opposedPosition !=
          oldWidgetSeries._xAxis?.opposedPosition ||
      series._xAxis?._orientation != oldWidgetSeries._xAxis?._orientation ||
      series._xAxis?.plotOffset != oldWidgetSeries._xAxis?.plotOffset ||
      series._xAxis?.rangePadding != oldWidgetSeries._xAxis?.rangePadding ||
      series._dataPoints?.length != oldWidgetSeries._dataPoints?.length ||
      series._yAxis?._visibleRange?.delta !=
          oldWidgetSeries._yAxis?._visibleRange?.delta ||
      series._yAxis?._visibleRange?.maximum !=
          oldWidgetSeries._yAxis?._visibleRange?.maximum ||
      series._yAxis?._visibleRange?.minimum !=
          oldWidgetSeries._yAxis?._visibleRange?.minimum ||
      series._yAxis?._visibleRange?.interval !=
          oldWidgetSeries._yAxis?._visibleRange?.interval ||
      series._yAxis?.isVisible != oldWidgetSeries._yAxis?.isVisible ||
      series._yAxis?._bounds != oldWidgetSeries._yAxis?._bounds ||
      series._yAxis?.isInversed != oldWidgetSeries._yAxis?.isInversed ||
      series._yAxis?.desiredIntervals !=
          oldWidgetSeries._yAxis?.desiredIntervals ||
      series._yAxis?.enableAutoIntervalOnZooming !=
          oldWidgetSeries._yAxis?.enableAutoIntervalOnZooming ||
      series._yAxis?.opposedPosition !=
          oldWidgetSeries._yAxis?.opposedPosition ||
      series._yAxis?._orientation != oldWidgetSeries._yAxis?._orientation ||
      series._yAxis?.plotOffset != oldWidgetSeries._yAxis?.plotOffset ||
      series._yAxis?.rangePadding != oldWidgetSeries._yAxis?.rangePadding ||
      series.animationDuration != oldWidgetSeries.animationDuration ||
      series.borderColor != oldWidgetSeries.borderColor ||
      series.borderWidth != oldWidgetSeries.borderWidth ||
      series.sizeValueMapper != oldWidgetSeries.sizeValueMapper ||
      series.emptyPointSettings.borderWidth !=
          oldWidgetSeries.emptyPointSettings.borderWidth ||
      series.emptyPointSettings.borderColor !=
          oldWidgetSeries.emptyPointSettings.borderColor ||
      series.emptyPointSettings.color !=
          oldWidgetSeries.emptyPointSettings.color ||
      series.emptyPointSettings.mode !=
          oldWidgetSeries.emptyPointSettings.mode ||
      series._maximumX != oldWidgetSeries._maximumX ||
      series._maximumY != oldWidgetSeries._maximumY ||
      series._minimumX != oldWidgetSeries._minimumX ||
      series._minimumY != oldWidgetSeries._minimumY ||
      series.dashArray?.length != oldWidgetSeries.dashArray?.length ||
      series.dataSource?.length != oldWidgetSeries.dataSource?.length ||
      series.markerSettings.width != oldWidgetSeries.markerSettings.width ||
      series.markerSettings.color?.value !=
          oldWidgetSeries.markerSettings.color?.value ||
      series.markerSettings.borderColor?.value !=
          oldWidgetSeries.markerSettings.borderColor?.value ||
      series.markerSettings.isVisible !=
          oldWidgetSeries.markerSettings.isVisible ||
      series.markerSettings.borderWidth !=
          oldWidgetSeries.markerSettings.borderWidth ||
      series.markerSettings.height != oldWidgetSeries.markerSettings.height ||
      series.markerSettings.shape != oldWidgetSeries.markerSettings.shape ||
      series.dataLabelSettings.color?.value !=
          oldWidgetSeries.dataLabelSettings.color?.value ||
      series.dataLabelSettings.isVisible !=
          oldWidgetSeries.dataLabelSettings.isVisible ||
      series.dataLabelSettings.labelAlignment !=
          oldWidgetSeries.dataLabelSettings.labelAlignment ||
      series.dataLabelSettings.opacity !=
          oldWidgetSeries.dataLabelSettings.opacity ||
      series.dataLabelSettings.alignment !=
          oldWidgetSeries.dataLabelSettings.alignment ||
      series.dataLabelSettings.angle !=
          oldWidgetSeries.dataLabelSettings.angle ||
      series.dataLabelSettings.textStyle?.color?.value !=
          oldWidgetSeries.dataLabelSettings.textStyle?.color?.value ||
      series.dataLabelSettings.textStyle?.fontStyle !=
          oldWidgetSeries.dataLabelSettings.textStyle?.fontStyle ||
      series.dataLabelSettings.textStyle?.fontFamily !=
          oldWidgetSeries.dataLabelSettings.textStyle?.fontFamily ||
      series.dataLabelSettings.textStyle?.fontSize !=
          oldWidgetSeries.dataLabelSettings.textStyle?.fontSize ||
      series.dataLabelSettings.textStyle?.fontWeight !=
          oldWidgetSeries.dataLabelSettings.textStyle?.fontWeight ||
      series.dataLabelSettings.borderColor?.value !=
          oldWidgetSeries.dataLabelSettings.borderColor?.value ||
      series.dataLabelSettings.borderWidth !=
          oldWidgetSeries.dataLabelSettings.borderWidth ||
      series.dataLabelSettings.margin?.right !=
          oldWidgetSeries.dataLabelSettings.margin?.right ||
      series.dataLabelSettings.margin?.bottom !=
          oldWidgetSeries.dataLabelSettings.margin?.bottom ||
      series.dataLabelSettings.margin?.top !=
          oldWidgetSeries.dataLabelSettings.margin?.top ||
      series.dataLabelSettings.margin?.left !=
          oldWidgetSeries.dataLabelSettings.margin?.left ||
      series.dataLabelSettings.borderRadius !=
          oldWidgetSeries.dataLabelSettings.borderRadius) {
    series._needsRepaint = true;
  } else {
    series._needsRepaint = false;
  }
}

void _canRepaintAxis(
    SfCartesianChart chart, SfCartesianChart oldChart, int axisIndex) {
  if (chart._chartAxis._axisCollections != null &&
      chart._chartAxis._axisCollections.isNotEmpty) {
    final ChartAxis axis = chart._chartAxis._axisCollections[axisIndex];
    final ChartAxis oldWidgetAxis =
        oldChart._chartAxis._axisCollections[axisIndex];
    if (axis.rangePadding.index != oldWidgetAxis.rangePadding.index ||
        axis.plotOffset != oldWidgetAxis.plotOffset ||
        axis._orientation != oldWidgetAxis._orientation ||
        axis.opposedPosition != oldWidgetAxis.opposedPosition ||
        axis.minorTicksPerInterval != oldWidgetAxis.minorTicksPerInterval ||
        axis.desiredIntervals != oldWidgetAxis.desiredIntervals ||
        axis.isInversed != oldWidgetAxis.isInversed ||
        axis._bounds != oldWidgetAxis._bounds ||
        axis.majorGridLines.dashArray?.length !=
            oldWidgetAxis.majorGridLines.dashArray?.length ||
        axis.majorGridLines.width != oldWidgetAxis.majorGridLines.width ||
        axis.majorGridLines.color != oldWidgetAxis.majorGridLines.color ||
        axis.title != oldWidgetAxis.title ||
        axis._visibleRange.interval != oldWidgetAxis._visibleRange.interval ||
        axis._visibleRange.minimum != oldWidgetAxis._visibleRange.minimum ||
        axis._visibleRange.maximum != oldWidgetAxis._visibleRange.maximum ||
        axis._visibleRange.delta != oldWidgetAxis._visibleRange.delta ||
        axis._isInsideTickPosition != oldWidgetAxis._isInsideTickPosition ||
        axis.maximumLabels != oldWidgetAxis.maximumLabels ||
        axis.minorGridLines.dashArray?.length !=
            oldWidgetAxis.minorGridLines.dashArray?.length ||
        axis.minorGridLines.width != oldWidgetAxis.minorGridLines.width ||
        axis.minorGridLines.color != oldWidgetAxis.minorGridLines.color ||
        axis.tickPosition.index != oldWidgetAxis.tickPosition.index) {
      chart._chartAxis._needsRepaint = true;
    } else {
      chart._chartAxis._needsRepaint = false;
    }
  }
}

dynamic _getInteractiveTooltipLabel(dynamic value, ChartAxis axis) {
  if (axis is CategoryAxis) {
    value = value < 0 ? 0 : value;
    value = axis._labels[
        (value.round() >= axis._labels.length ? value - 1 : value).round()];
  } else if (axis is DateTimeAxis) {
    final DateFormat dateFormat = axis.dateFormat ?? axis._getLabelFormat(axis);
    value =
        dateFormat.format(DateTime.fromMillisecondsSinceEpoch(value.toInt()));
  } else {
    value = _getLabelValue(value, axis, axis.interactiveTooltip.decimalPlaces);
  }
  return value;
}

Path _getMarkerShapes(DataMarkerType markerType, Offset position, Size size,
    [ChartSeries<dynamic, dynamic> series]) {
  final Path path = Path();
  switch (markerType) {
    case DataMarkerType.circle:
      {
        _ChartShapeUtils._drawCircle(
            path, position.dx, position.dy, size.width, size.height);
      }
      break;
    case DataMarkerType.rectangle:
      {
        _ChartShapeUtils._drawRectangle(
            path, position.dx, position.dy, size.width, size.height);
      }
      break;
    case DataMarkerType.image:
      {
        if (series != null) {
          _loadMarkerImage(series);
        }
      }
      break;
    case DataMarkerType.pentagon:
      {
        _ChartShapeUtils._drawPentagon(
            path, position.dx, position.dy, size.width, size.height);
      }
      break;
    case DataMarkerType.verticalLine:
      {
        _ChartShapeUtils._drawVerticalLine(
            path, position.dx, position.dy, size.width, size.height);
      }
      break;
    case DataMarkerType.invertedTriangle:
      {
        _ChartShapeUtils._drawInvertedTriangle(
            path, position.dx, position.dy, size.width, size.height);
      }
      break;
    case DataMarkerType.horizontalLine:
      {
        _ChartShapeUtils._drawHorizontalLine(
            path, position.dx, position.dy, size.width, size.height);
      }
      break;
    case DataMarkerType.diamond:
      {
        _ChartShapeUtils._drawDiamond(
            path, position.dx, position.dy, size.width, size.height);
      }
      break;
    case DataMarkerType.triangle:
      {
        _ChartShapeUtils._drawTriangle(
            path, position.dx, position.dy, size.width, size.height);
      }
      break;
    case DataMarkerType.none:
      break;
  }
  return path;
}

class _StackingInfo {
  _StackingInfo(this.groupName, this._stackingValues);
  String groupName;
  // ignore: prefer_final_fields
  List<double> _stackingValues;
}

class _StackingGroup {
  _StackingGroup(this.groupName, this.stackCount);

  String groupName;
  int stackCount;
}

// ignore: avoid_void_async
void _loadMarkerImage(CartesianSeries<dynamic, dynamic> series) async {
  if (series.markerSettings != null &&
      (series.markerSettings.isVisible || series._seriesType == 'scatter') &&
      series.markerSettings.shape == DataMarkerType.image &&
      series.markerSettings.image != null) {
    _calculateImage(null, series);
  }
}

_ChartLocation _getAnnotationLocation(
    CartesianChartAnnotation annotation, SfCartesianChart chart) {
  final String xAxisName = annotation.xAxisName;
  final String yAxisName = annotation.yAxisName;
  ChartAxis xAxis, yAxis;
  num xValue;
  _ChartLocation location;
  if (annotation.coordinateUnit == CoordinateUnit.logicalPixel) {
    location = annotation.region == AnnotationRegion.chart
        ? _ChartLocation(annotation.x, annotation.y)
        : _ChartLocation(chart._chartAxis._axisClipRect.left + annotation.x,
            chart._chartAxis._axisClipRect.top + annotation.y);
  } else {
    for (int i = 0; i < chart._chartAxis._axisCollections.length; i++) {
      final ChartAxis axis = chart._chartAxis._axisCollections[i];
      if (xAxisName == axis._name ||
          (xAxisName == null && axis._name == 'primaryXAxis')) {
        xAxis = axis;
        if (xAxis is CategoryAxis) {
          if (annotation.x != null &&
              num.tryParse(annotation.x.toString()) != null) {
            xValue = num.tryParse(annotation.x.toString());
          } else if (xAxis._labels.length > 0) {
            xValue = xAxis._labels.indexOf(annotation.x);
          }
        } else if (xAxis is DateTimeAxis) {
          xValue = annotation.x is DateTime
              ? (annotation.x).millisecondsSinceEpoch
              : annotation.x;
        } else {
          xValue = annotation.x;
        }
      } else if (yAxisName == axis._name ||
          (yAxisName == null && axis._name == 'primaryYAxis')) {
        yAxis = axis;
      }
    }

    if (xAxis != null && yAxis != null) {
      location = _calculatePoint(xValue, annotation.y, xAxis, yAxis,
          chart._requireInvertedAxis, null, chart._chartAxis._axisClipRect);
    }
  }
  return location;
}

void _drawTooltipArrowhead(
    Canvas canvas,
    Path backgroundPath,
    Paint fillPaint,
    Paint strokePaint,
    double x1,
    double y1,
    double x2,
    double y2,
    double x3,
    double y3,
    double x4,
    double y4) {
  backgroundPath.moveTo(x1, y1);
  backgroundPath.lineTo(x2, y2);
  backgroundPath.lineTo(x3, y3);
  backgroundPath.lineTo(x4, y4);
  backgroundPath.lineTo(x1, y1);
  fillPaint.isAntiAlias = true;
  canvas.drawPath(backgroundPath, strokePaint);
  canvas.drawPath(backgroundPath, fillPaint);
}

/// Calculate rounded rect from rect and corner radius
RRect _getRoundedCornerRect(Rect rect, double cornerRadius) =>
    RRect.fromRectAndCorners(
      rect,
      bottomLeft: Radius.circular(cornerRadius),
      bottomRight: Radius.circular(cornerRadius),
      topLeft: Radius.circular(cornerRadius),
      topRight: Radius.circular(cornerRadius),
    );

/// Calculate the X value from the current screen point
double _pointToXVal(
    SfCartesianChart chart, ChartAxis axis, Rect rect, double x, double y) {
  if (axis != null) {
    return _coefficientToValue(x / rect.width, axis);
  }
  return double.nan;
}

/// Calculate the Y value from the current screen point
double _pointToYVal(
    SfCartesianChart chart, ChartAxis axis, Rect rect, double x, double y) {
  if (axis != null) {
    return _coefficientToValue(1 - (y / rect.height), axis);
  }
  return double.nan;
}

Rect _validateRectXPosition(Rect labelRect, SfCartesianChart chart) {
  Rect validatedRect = labelRect;
  if (labelRect.right >= chart._chartAxis._axisClipRect.right) {
    validatedRect = Rect.fromLTRB(
        labelRect.left -
            (labelRect.right - chart._chartAxis._axisClipRect.right),
        labelRect.top,
        chart._chartAxis._axisClipRect.right,
        labelRect.bottom);
  } else if (labelRect.left <= chart._chartAxis._axisClipRect.left) {
    validatedRect = Rect.fromLTRB(
        chart._chartAxis._axisClipRect.left,
        labelRect.top,
        labelRect.right +
            (chart._chartAxis._axisClipRect.left - labelRect.left),
        labelRect.bottom);
  }
  return validatedRect;
}

Rect _validateRectYPosition(Rect labelRect, SfCartesianChart chart) {
  Rect validatedRect = labelRect;
  if (labelRect.bottom >= chart._chartAxis._axisClipRect.bottom) {
    validatedRect = Rect.fromLTRB(
        labelRect.left,
        labelRect.top -
            (labelRect.bottom - chart._chartAxis._axisClipRect.bottom),
        labelRect.right,
        chart._chartAxis._axisClipRect.bottom);
  } else if (labelRect.top <= chart._chartAxis._axisClipRect.top) {
    validatedRect = Rect.fromLTRB(
        labelRect.left,
        chart._chartAxis._axisClipRect.top,
        labelRect.right,
        labelRect.bottom +
            (chart._chartAxis._axisClipRect.top - labelRect.top));
  }
  return validatedRect;
}

/// This method will validate whether the tooltip exceeds the screen or not
Rect _validateRectBounds(Rect tooltipRect, Rect boundary) {
  Rect validatedRect = tooltipRect;
  double difference = 0;

  /// Padding between the corners
  const double padding = 0.5;

  if (tooltipRect.left < boundary.left) {
    difference = (boundary.left - tooltipRect.left) + padding;
    validatedRect = Rect.fromLTRB(
        validatedRect.left + difference,
        validatedRect.top,
        validatedRect.right + difference,
        validatedRect.bottom);
  }
  if (tooltipRect.right > boundary.right) {
    difference = (tooltipRect.right - boundary.right) + padding;
    validatedRect = Rect.fromLTRB(
        validatedRect.left - difference,
        validatedRect.top,
        validatedRect.right - difference,
        validatedRect.bottom);
  }
  if (tooltipRect.top < boundary.top) {
    difference = (boundary.top - tooltipRect.top) + padding;
    validatedRect = Rect.fromLTRB(
        validatedRect.left,
        validatedRect.top + difference,
        validatedRect.right,
        validatedRect.bottom + difference);
  }

  if (tooltipRect.bottom > boundary.bottom) {
    difference = (tooltipRect.bottom - boundary.bottom) + padding;
    validatedRect = Rect.fromLTRB(
        validatedRect.left,
        validatedRect.top - difference,
        validatedRect.right,
        validatedRect.bottom - difference);
  }

  return validatedRect;
}

void _renderStackingRectSeries(
    Paint fillPaint,
    Paint strokePaint,
    Path path,
    double animationFactor,
    _StackedSeriesBase<dynamic, dynamic> series,
    Canvas canvas,
    RRect segmentRect,
    CartesianChartPoint<dynamic> _currentPoint) {
  if (fillPaint != null) {
    series.animationDuration > 0
        ? _animateStackedRectSeries(canvas, segmentRect, fillPaint, series,
            animationFactor, _currentPoint, series._chart)
        : canvas.drawRRect(segmentRect, fillPaint);
  }
  if (strokePaint != null) {
    if (series.dashArray[0] != 0 && series.dashArray[1] != 0) {
      final XyDataSeries<dynamic, dynamic> _series = series;
      _drawDashedLine(canvas, _series.dashArray, strokePaint, path);
    } else {
      series.animationDuration > 0
          ? _animateStackedRectSeries(canvas, segmentRect, strokePaint, series,
              animationFactor, _currentPoint, series._chart)
          : canvas.drawRRect(segmentRect, strokePaint);
    }
  }
}

void _renderStackedAreaSeries(
    _StackedSeriesBase<dynamic, dynamic> series,
    Paint fillPaint,
    Paint strokePaint,
    Canvas canvas,
    int _seriesIndex,
    Paint getFillPaint()) {
  final Path _path = Path(), _strokePath = Path();
  final Rect rect = series._chart._chartAxis._axisClipRect;
  _ChartLocation point1, point2;
  final ChartAxis xAxis = series._xAxis, yAxis = series._yAxis;
  CartesianChartPoint<dynamic> point;
  final dynamic _series = series;
  if (series._dataPoints.isNotEmpty) {
    int startPoint = 0;
    final _StackedValues stackedValues = series._stackingValues[0];
    List<CartesianSeries<dynamic, dynamic>> seriesCollection;
    CartesianSeries<dynamic, dynamic> previousSeries;
    seriesCollection = _findSeriesCollection(series._chart);
    point1 = _calculatePoint(
        series._dataPoints[0].xValue,
        math_lib.max(yAxis._visibleRange.minimum, stackedValues.startValues[0]),
        xAxis,
        yAxis,
        series._chart._requireInvertedAxis,
        series,
        rect);
    _path.moveTo(point1.x, point1.y);
    _strokePath.moveTo(point1.x, point1.y);
    for (int pointIndex = 0;
        pointIndex < series._dataPoints.length;
        pointIndex++) {
      point = series._dataPoints[pointIndex];
      if (point.isVisible) {
        point1 = _calculatePoint(
            series._dataPoints[pointIndex].xValue,
            stackedValues.endValues[pointIndex],
            xAxis,
            yAxis,
            series._chart._requireInvertedAxis,
            series,
            rect);
        _path.lineTo(point1.x, point1.y);
        _strokePath.lineTo(point1.x, point1.y);
      } else {
        if (series.emptyPointSettings.mode != EmptyPointMode.drop) {
          for (int j = pointIndex - 1; j >= startPoint; j--) {
            point2 = _calculatePoint(
                series._dataPoints[j].xValue,
                stackedValues.startValues[j],
                xAxis,
                yAxis,
                series._chart._requireInvertedAxis,
                series,
                rect);
            _path.lineTo(point2.x, point2.y);
            if (_series.borderDrawMode == BorderDrawMode.excludeBottom)
              _strokePath.lineTo(point1.x, point2.y);
            else if (_series.borderDrawMode == BorderDrawMode.all)
              _strokePath.lineTo(point2.x, point2.y);
          }
          if (series._dataPoints.length > pointIndex + 1 &&
              series._dataPoints[pointIndex + 1] != null &&
              series._dataPoints[pointIndex + 1].isVisible) {
            point1 = _calculatePoint(
                series._dataPoints[pointIndex + 1].xValue,
                stackedValues.startValues[pointIndex + 1],
                xAxis,
                yAxis,
                series._chart._requireInvertedAxis,
                series,
                rect);
            _path.moveTo(point1.x, point1.y);
            _strokePath.moveTo(point1.x, point1.y);
          }
          startPoint = pointIndex + 1;
        }
      }
    }

    for (int j = series._dataPoints.length - 1; j >= startPoint; j--) {
      previousSeries = _getPreviousSeries(seriesCollection, _seriesIndex);
      if (previousSeries.emptyPointSettings.mode != EmptyPointMode.drop ||
          previousSeries._dataPoints[j].isVisible) {
        point2 = _calculatePoint(
            series._dataPoints[j].xValue,
            stackedValues.startValues[j],
            xAxis,
            yAxis,
            series._chart._requireInvertedAxis,
            series,
            rect);
        _path.lineTo(point2.x, point2.y);
        if (_series.borderDrawMode == BorderDrawMode.excludeBottom)
          _strokePath.lineTo(point1.x, point2.y);
        else if (_series.borderDrawMode == BorderDrawMode.all)
          _strokePath.lineTo(point2.x, point2.y);
      }
    }
    _drawStackedAreaPath(
        _path, _strokePath, series, canvas, fillPaint, strokePaint);
  }
}

void _drawStackedAreaPath(
    Path _path,
    Path _strokePath,
    _StackedSeriesBase<dynamic, dynamic> series,
    Canvas canvas,
    Paint fillPaint,
    Paint strokePaint) {
  Rect _pathRect;
  dynamic stackedAreaSegment;
  _pathRect = _path.getBounds();

  stackedAreaSegment = series.segments[0];
  stackedAreaSegment._pathRect = _pathRect;

  series.selectionSettings._selectionRenderer
      ._checkWithSelectionState(series.segments[0], series._chart);
  canvas.drawPath(
      _path,
      (series.gradient == null)
          ? fillPaint
          : series.segments[0].getFillPaint());

  if (strokePaint.color != Colors.transparent) {
    final XyDataSeries<dynamic, dynamic> _series = series;
    _drawDashedLine(canvas, _series.dashArray, strokePaint, _strokePath);
  }
}

void _renderStackedLineSeries(_StackedSeriesBase<dynamic, dynamic> series,
    Canvas canvas, Paint strokePaint) {
  final Rect rect = series._chart._chartAxis._axisClipRect;
  _ChartLocation point1;
  final ChartAxis xAxis = series._xAxis;
  final ChartAxis yAxis = series._yAxis;
  CartesianChartPoint<dynamic> point;
  final Path path = Path();
  final _StackedValues stackedValues = series._stackingValues[0];
  for (int i = 0; i < series._dataPoints.length; i++) {
    point = series._dataPoints[i];
    if (point.isVisible) {
      point1 = _calculatePoint(
          series._dataPoints[i].xValue,
          stackedValues.endValues[i],
          xAxis,
          yAxis,
          series._chart._requireInvertedAxis,
          series,
          rect);
      i == 0
          ? path.moveTo(point1.x, point1.y)
          : path.lineTo(point1.x, point1.y);
    } else {
      if (series.emptyPointSettings.mode != EmptyPointMode.drop) {
        if (series._dataPoints.length > i + 1 &&
            series._dataPoints[i + 1] != null &&
            series._dataPoints[i + 1].isVisible) {
          point1 = _calculatePoint(
              series._dataPoints[i + 1].xValue,
              stackedValues.endValues[i + 1],
              xAxis,
              yAxis,
              series._chart._requireInvertedAxis,
              series,
              rect);
          path.moveTo(point1.x, point1.y);
        }
      }
    }
  }
  final XyDataSeries<dynamic, dynamic> _series = series;
  _drawDashedLine(canvas, _series.dashArray, strokePaint, path);
}

void _stackedAreaPainter(
    Canvas canvas,
    _StackedSeriesBase<dynamic, dynamic> series,
    Animation<double> seriesAnimation,
    Animation<double> chartElementAnimation) {
  canvas.save();
  Rect clipRect;
  double animationFactor;

  /// Clip rect will be added for series.
  if (series._visible) {
    final Rect axisClipRect = _calculatePlotOffset(
        series._chart._chartAxis._axisClipRect,
        Offset(series._xAxis.plotOffset, series._yAxis.plotOffset));
    canvas.clipRect(axisClipRect);
    animationFactor = seriesAnimation != null ? seriesAnimation.value : 1;
    if (series.animationDuration > 0 &&
        !(series._chart._chartState.widgetNeedUpdate ||
            series._chart._chartState._isLegendToggled)) {
      _performLinearAnimation(
          series._chart, series._xAxis, canvas, animationFactor);
    }

    /// Draw the area series.
    series._draw(canvas, animationFactor);
    clipRect = _calculatePlotOffset(
        Rect.fromLTRB(
            series._chart._chartAxis._axisClipRect.left -
                series.markerSettings.width,
            series._chart._chartAxis._axisClipRect.top -
                series.markerSettings.height,
            series._chart._chartAxis._axisClipRect.right +
                series.markerSettings.width,
            series._chart._chartAxis._axisClipRect.bottom +
                series.markerSettings.height),
        Offset(series._xAxis.plotOffset, series._yAxis.plotOffset));
  }
  canvas.restore();

  if (series._visible &&
      (animationFactor > series._chart._seriesDurationFactor)) {
    canvas.clipRect(clipRect);

    ///Draw marker and other elements for stacked area series
    _renderSeriesElements(canvas, series, chartElementAnimation);
  }
}

CartesianSeries<dynamic, dynamic> _getPreviousSeries(
    List<CartesianSeries<dynamic, dynamic>> seriesCollection, num seriesIndex) {
  for (int i = 0; i < seriesCollection.length; i++) {
    if (seriesIndex == seriesCollection.indexOf(seriesCollection[i]) &&
        i != 0) {
      return seriesCollection[i - 1];
    }
  }
  return seriesCollection[0];
}

void _stackedRectPainter(
    Canvas canvas,
    _StackedSeriesBase<dynamic, dynamic> series,
    Animation<double> seriesAnimation,
    Animation<double> chartElementAnimation) {
  canvas.save();
  Rect clipRect;
  double animationFactor;
  if (series._visible) {
    animationFactor = seriesAnimation != null &&
            !(series._chart._chartState.widgetNeedUpdate ||
                series._chart._chartState._isLegendToggled)
        ? seriesAnimation.value
        : 1;

    /// Clip rect will be added for series.
    final Rect axisClipRect = _calculatePlotOffset(
        series._chart._chartAxis._axisClipRect,
        Offset(series._xAxis.plotOffset, series._yAxis.plotOffset));
    canvas.clipRect(axisClipRect);
    series._draw(canvas, animationFactor);
    clipRect = _calculatePlotOffset(
        Rect.fromLTRB(
            series._chart._chartAxis._axisClipRect.left -
                series.markerSettings.width,
            series._chart._chartAxis._axisClipRect.top -
                series.markerSettings.height,
            series._chart._chartAxis._axisClipRect.right +
                series.markerSettings.width,
            series._chart._chartAxis._axisClipRect.bottom +
                series.markerSettings.height),
        Offset(series._xAxis.plotOffset, series._yAxis.plotOffset));
  }
  canvas.restore();

  if (series._visible &&
      (animationFactor > series._chart._seriesDurationFactor)) {
    canvas.clipRect(clipRect);

    ///Draw marker and other elements for stacked bar series
    _renderSeriesElements(canvas, series, chartElementAnimation);
  }
}

void _stackedLinePainter(
    Canvas canvas,
    _StackedSeriesBase<dynamic, dynamic> series,
    Animation<double> seriesAnimation,
    Animation<double> chartElementAnimation) {
  canvas.save();
  Rect clipRect;
  double animationFactor;
  if (series._visible) {
    animationFactor = seriesAnimation != null ? seriesAnimation.value : 1;

    /// Clip rect will be added for series.
    final Rect axisClipRect = _calculatePlotOffset(
        series._chart._chartAxis._axisClipRect,
        Offset(series._xAxis.plotOffset, series._yAxis.plotOffset));
    canvas.clipRect(axisClipRect);
    if (series.animationDuration > 0 &&
        !(series._chart._chartState.widgetNeedUpdate ||
            series._chart._chartState._isLegendToggled)) {
      _performLinearAnimation(
          series._chart, series._xAxis, canvas, animationFactor);
    }

    ///Draw line for line series
    series._draw(canvas, animationFactor);
    clipRect = _calculatePlotOffset(
        Rect.fromLTRB(
            series._chart._chartAxis._axisClipRect.left -
                series.markerSettings.width,
            series._chart._chartAxis._axisClipRect.top -
                series.markerSettings.height,
            series._chart._chartAxis._axisClipRect.right +
                series.markerSettings.width,
            series._chart._chartAxis._axisClipRect.bottom +
                series.markerSettings.height),
        Offset(series._xAxis.plotOffset, series._yAxis.plotOffset));
  }
  canvas.restore();
  if (series._visible &&
      (animationFactor > series._chart._seriesDurationFactor)) {
    canvas.clipRect(clipRect);

    ///Draw marker and other elements for stacked line series
    _renderSeriesElements(canvas, series, chartElementAnimation);
  }
}

/// To find MonotonicSpline
List<num> _getMonotonicSpline(List<num> xValues, List<num> yValues,
    List<num> yCoef, int dataCount, List<num> dx) {
  final int count = dataCount;
  int index = -1;

  final dynamic slope = List<dynamic>(count - 1);
  final dynamic coefficient = List<dynamic>(count);

  for (int i = 0; i < count - 1; i++) {
    dx[i] = xValues[i + 1] - xValues[i];
    slope[i] = (yValues[i + 1] - yValues[i]) / dx[i];
    if (slope[i].toDouble() == double.infinity) {
      slope[i] = 0;
    }
  }
  // Add the first and last coefficient value as Slope[0] and Slope[n-1]
  if (slope.length == 0) {
    return null;
  }

  slope[0] == double.nan
      ? coefficient[++index] = 0
      : coefficient[++index] = slope[0];

  for (int i = 0; i < dx.length - 1; i++) {
    if (slope.length > i + 1) {
      final dynamic m = slope[i], next = slope[i + 1];
      if (m * next <= 0) {
        coefficient[++index] = 0;
      } else {
        if (dx[i] == 0) {
          coefficient[++index] = 0;
        } else {
          final double firstPoint = dx[i].toDouble(),
              nextPoint = dx[i + 1].toDouble();
          final double interPoint = firstPoint + nextPoint;
          coefficient[++index] = 3 *
              interPoint /
              (((interPoint + nextPoint) / m) +
                  ((interPoint + firstPoint) / next));
        }
      }
    }
  }
  slope[slope.length - 1] == double.nan
      ? coefficient[++index] = 0
      : coefficient[++index] = slope[slope.length - 1];

  for (int i = 0; i < coefficient.length; i++) {
    yCoef.add(coefficient[i]);
  }

  return yCoef;
}

/// To find CardinalSpline
List<num> _getCardinalSpline(List<num> xValues, List<num> yValues,
    List<num> yCoef, int dataCount, double tension) {
  if (tension < 0.1) {
    tension = 0;
  } else if (tension > 1) {
    tension = 1;
  }

  final int count = dataCount;

  final dynamic tangentsX = List<dynamic>(count);

  for (int i = 0; i < count; i++) {
    if (i == 0 && xValues.length > 2) {
      tangentsX[i] = tension * (xValues[i + 2] - xValues[i]);
    } else if (i == count - 1 && count - 3 >= 0) {
      tangentsX[i] = tension * (xValues[count - 1] - xValues[count - 3]);
    } else if (i - 1 >= 0 && xValues.length > i + 1) {
      tangentsX[i] = tension * (xValues[i + 1] - xValues[i - 1]);
    }

    if (tangentsX[i] == double.nan) {
      tangentsX[i] = 0;
    }
  }

  for (int i = 0; i < tangentsX.length; i++) {
    yCoef.add(tangentsX[i]);
  }
  return yCoef;
}

/// To find NaturalSpline
List<num> _naturalSpline(List<num> xValues, List<num> yValues, List<num> yCoeff,
    int dataCount, SplineType splineType) {
  const double a = 6;
  final int count = dataCount;
  final dynamic yCoef = List<dynamic>(count);
  for (int i = 0; i < count; i++) {
    yCoef[i] = 0;
  }

  final dynamic u = List<dynamic>(count);
  if (splineType == SplineType.clamped && xValues.length > 1) {
    u[0] = 0.5;
    final dynamic d0 = (xValues[1] - xValues[0]) / (yValues[1] - yValues[0]);
    final dynamic dn = (xValues[count - 1] - xValues[count - 2]) /
        (yValues[count - 1] - yValues[count - 2]);
    yCoef[0] =
        (3 * (yValues[1] - yValues[0]) / (xValues[1] - xValues[0])) - (3 * d0);
    yCoef[count - 1] = (3 * dn) -
        ((3 * (yValues[count - 1] - yValues[count - 2])) /
            (xValues[count - 1] - xValues[count - 2]));

    if (yCoef[0] == double.infinity || yCoef[0] == double.nan) {
      yCoef[0] = 0;
    }

    if (yCoef[count - 1] == double.infinity || yCoef[count - 1] == double.nan) {
      yCoef[count - 1] = 0;
    }
  } else {
    yCoef[0] = u[0] = 0;
    yCoef[count - 1] = 0;
  }

  for (int i = 1; i < count - 1; i++) {
    if ((yValues[i + 1] != double.nan) &&
        (yValues[i - 1] != double.nan) &&
        (yValues[i] != double.nan) &&
        yValues[i + 1] != null &&
        xValues[i + 1] != null &&
        yValues[i - 1] != null &&
        xValues[i - 1] != null &&
        xValues[i] != null &&
        yValues[i] != null) {
      final double d1 = xValues[i].toDouble() - xValues[i - 1].toDouble();
      final double d2 = xValues[i + 1].toDouble() - xValues[i - 1].toDouble();
      final double d3 = xValues[i + 1].toDouble() - xValues[i].toDouble();
      final double dy1 = yValues[i + 1].toDouble() - yValues[i].toDouble();
      final double dy2 = yValues[i].toDouble() - yValues[i - 1].toDouble();
      if (xValues[i] == xValues[i - 1] || xValues[i] == xValues[i + 1]) {
        yCoef[i] = 0;
        u[i] = 0;
      } else {
        final dynamic p = 1 / ((d1 * yCoef[i - 1]) + (2 * d2));
        yCoef[i] = -p * d3;
        if (d1 != null && u[i - 1] != null) {
          u[i] = p * ((a * ((dy1 / d3) - (dy2 / d1))) - (d1 * u[i - 1]));
        }
      }
    }
  }

  for (int k = count - 2; k >= 0; k--) {
    if (u[k] != null && yCoef[k] != null && yCoef[k + 1] != null) {
      yCoef[k] = (yCoef[k] * yCoef[k + 1]) + u[k];
    }
  }

  for (int i = 0; i < yCoef.length; i++) {
    yCoeff.add(yCoef[i]);
  }
  return yCoeff;
}

/// To find Monotonic ControlPoints
List<double> _calculateMonotonicControlPoints(
    double pointX,
    double pointY,
    double pointX1,
    double pointY1,
    double coefficientY,
    double coefficientY1,
    double dx) {
  final dynamic value = dx / 3;
  final List<double> values = List<double>(4);
  values[0] = pointX + value;
  values[1] = pointY + (coefficientY * value);
  values[2] = pointX1 - value;
  values[3] = pointY1 - (coefficientY1 * value);
  return values;
}

/// To find Cardinal ControlPoints
List<double> _calculateCardinalControlPoints(double pointX, double pointY,
    double pointX1, double pointY1, double coefficientY, double coefficientY1) {
  final List<double> values = List<double>(4);
  values[0] = pointX + (coefficientY / 3);
  values[1] = pointY + (coefficientY / 3);
  values[2] = pointX1 - (coefficientY1 / 3);
  values[3] = pointY1 - (coefficientY1 / 3);
  return values;
}

/// To find Natural ControlPoints
List<double> _calculateControlPoints(List<num> xValues, List<num> yValues,
    double yCoef, double nextyCoef, int i) {
  final List<double> controlPoints = List<double>(4);
  final double yCoeff1 = yCoef;
  final double yCoeff2 = nextyCoef;
  final double x = xValues[i].toDouble();
  final double y = yValues[i].toDouble();
  final double nextX = xValues[i + 1].toDouble();
  final double nextY = yValues[i + 1].toDouble();
  const double oneThird = 1 / 3.0;
  double deltaX2 = nextX - x;
  deltaX2 = deltaX2 * deltaX2;
  final double dx1 = (2 * x) + nextX;
  final double dx2 = x + (2 * nextX);
  final double dy1 = (2 * y) + nextY;
  final double dy2 = y + (2 * nextY);
  final double y1 =
      oneThird * (dy1 - (oneThird * deltaX2 * (yCoeff1 + (0.5 * yCoeff2))));
  final double y2 =
      oneThird * (dy2 - (oneThird * deltaX2 * ((0.5 * yCoeff1) + yCoeff2)));
  final dynamic startControlPointsX = dx1 * oneThird;
  final dynamic startControlPointsY = y1;
  final dynamic endControlPointsX = dx2 * oneThird;
  final dynamic endControlPointsY = y2;
  controlPoints[0] = startControlPointsX;
  controlPoints[1] = startControlPointsY;
  controlPoints[2] = endControlPointsX;
  controlPoints[3] = endControlPointsY;
  return controlPoints;
}

void _calculateSplineAreaControlPoints(XyDataSeries<dynamic, dynamic> series) {
  List<num> yCoef = <num>[];
  final List<num> xValues = <num>[];
  final List<num> yValues = <num>[];
  SplineType splineType;

  if (series is SplineAreaSeries) {
    splineType = series.splineType;
  }

  for (int i = 0; i < series._dataPoints.length; i++) {
    xValues.add(series._dataPoints[i].xValue);
    yValues.add(series._dataPoints[i].yValue);
  }

  if (series is SplineAreaSeries && xValues.isNotEmpty) {
    final List<num> dx = List<num>(xValues.length - 1);

    /// Check the type of spline
    if (splineType == SplineType.monotonic) {
      yCoef = _getMonotonicSpline(xValues, yValues, yCoef, xValues.length, dx);
    } else if (splineType == SplineType.cardinal) {
      yCoef = _getCardinalSpline(xValues, yValues, yCoef, xValues.length,
          series.cardinalSplineTension);
    } else {
      yCoef =
          _naturalSpline(xValues, yValues, yCoef, xValues.length, splineType);
    }
    _updateSplineAreaControlPoints(
        series, splineType, xValues, yValues, yCoef, dx);
  }
}

void _updateSplineAreaControlPoints(
    SplineAreaSeries<dynamic, dynamic> series,
    SplineType splineType,
    List<num> xValues,
    List<num> yValues,
    List<num> yCoef,
    List<num> dx) {
  for (int pointIndex = 0; pointIndex < xValues.length - 1; pointIndex++) {
    List<double> controlPoints = <double>[];
    series._drawPoints = <_ControlPoints>[];
    if (xValues[pointIndex] != null &&
        yValues[pointIndex] != null &&
        xValues[pointIndex + 1] != null &&
        yValues[pointIndex + 1] != null) {
      final double x = xValues[pointIndex].toDouble();
      final double y = yValues[pointIndex].toDouble();
      final double nextX = xValues[pointIndex + 1].toDouble();
      final double nextY = yValues[pointIndex + 1].toDouble();
      if (splineType == SplineType.monotonic) {
        controlPoints = _calculateMonotonicControlPoints(
            x,
            y,
            nextX,
            nextY,
            yCoef[pointIndex].toDouble(),
            yCoef[pointIndex + 1].toDouble(),
            dx[pointIndex].toDouble());
        series._drawPoints
            .add(_ControlPoints(controlPoints[0], controlPoints[1]));
        series._drawPoints
            .add(_ControlPoints(controlPoints[2], controlPoints[3]));
        series.drawControlPoints.add(_ListControlPoints(series._drawPoints));
      } else if (splineType == SplineType.cardinal) {
        controlPoints = _calculateCardinalControlPoints(x, y, nextX, nextY,
            yCoef[pointIndex].toDouble(), yCoef[pointIndex + 1].toDouble());
        series._drawPoints
            .add(_ControlPoints(controlPoints[0], controlPoints[1]));
        series._drawPoints
            .add(_ControlPoints(controlPoints[2], controlPoints[3]));
        series.drawControlPoints.add(_ListControlPoints(series._drawPoints));
      } else {
        controlPoints = _calculateControlPoints(
            xValues,
            yValues,
            yCoef[pointIndex].toDouble(),
            yCoef[pointIndex + 1].toDouble(),
            pointIndex);
        series._drawPoints
            .add(_ControlPoints(controlPoints[0], controlPoints[1]));
        series._drawPoints
            .add(_ControlPoints(controlPoints[2], controlPoints[3]));
        series.drawControlPoints.add(_ListControlPoints(series._drawPoints));
      }
    }
  }
}

///get the old axis (for stock chart animation)
ChartAxis _getOldAxis(ChartAxis axis, List<ChartAxis> oldAxisList) {
  for (int i = 0; i < oldAxisList.length; i++) {
    if (oldAxisList[i]._name == axis._name) {
      return oldAxisList[i];
    }
  }
  return null;
}

class _ControlPoints {
  _ControlPoints(this.controlPoint1, this.controlPoint2);
  final double controlPoint1;
  final double controlPoint2;
}

class _ListControlPoints {
  _ListControlPoints(this._listControlPoints);
  final List<_ControlPoints> _listControlPoints;
}
