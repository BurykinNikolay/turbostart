import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../theme.dart';

/// Applies a theme to descendant Syncfusion chart widgets.
class SfChartTheme extends InheritedTheme {
  const SfChartTheme({Key key, this.data, this.child})
      : super(key: key, child: child);

  /// Specifies the color and typography values for descendant chart widgets.
  final SfChartThemeData data;

  /// Specifies a widget that can hold single child.
  final Widget child;

  /// The data from the closest [SfChartTheme] instance that encloses the given
  /// context.
  ///
  /// Defaults to [SfThemeData.chartThemeData] if there is no [SfChartTheme] in the given
  /// build context.
  static SfChartThemeData of(BuildContext context) {
    final SfChartTheme sfChartTheme =
        context.dependOnInheritedWidgetOfExactType<SfChartTheme>();
    return sfChartTheme?.data ?? SfTheme.of(context).chartThemeData;
  }

  @override
  bool updateShouldNotify(SfChartTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    final SfChartTheme ancestorTheme =
        context.findAncestorWidgetOfExactType<SfChartTheme>();
    return identical(this, ancestorTheme)
        ? child
        : SfChartTheme(data: data, child: child);
  }
}

/// Holds the color and typography values for a [SfChartTheme]. Use
///  this class to configure a [SfChartTheme] widget
///
/// To obtain the current theme, use [SfChartTheme.of].
class SfChartThemeData with DiagnosticableMixin {
  factory SfChartThemeData(
      {Brightness brightness,
      Color backgroundColor,
      Color axisLabelColor,
      Color axisTitleColor,
      Color axisLineColor,
      Color majorGridLineColor,
      Color minorGridLineColor,
      Color majorTickLineColor,
      Color minorTickLineColor,
      Color titleTextColor,
      Color titleBackgroundColor,
      Color legendTextColor,
      Color legendTitleColor,
      Color legendBackgroundColor,
      Color plotAreaBackgroundColor,
      Color crosshairLineColor,
      Color crosshairBackgroundColor,
      Color crosshairLabelColor,
      Color tooltipColor,
      Color tooltipLabelColor,
      Color tooltipSeparatorColor,
      Color selectionRectColor,
      Color selectionRectBorderColor,
      Color selectionTooltipConnectorLineColor}) {
    brightness = brightness ?? Brightness.light;
    final bool isLight = brightness == Brightness.light;
    backgroundColor ??= Colors.transparent;
    axisLabelColor ??= isLight
        ? const Color.fromRGBO(104, 104, 104, 1)
        : const Color.fromRGBO(242, 242, 242, 1);
    axisTitleColor ??= isLight
        ? const Color.fromRGBO(66, 66, 66, 1)
        : const Color.fromRGBO(255, 255, 255, 1);
    axisLineColor ??= isLight
        ? const Color.fromRGBO(181, 181, 181, 1)
        : const Color.fromRGBO(255, 255, 255, 1);
    majorGridLineColor ??= isLight
        ? const Color.fromRGBO(219, 219, 219, 1)
        : const Color.fromRGBO(70, 74, 86, 1);
    minorGridLineColor ??= isLight
        ? const Color.fromRGBO(234, 234, 234, 1)
        : const Color.fromRGBO(70, 74, 86, 1);
    majorTickLineColor ??= isLight
        ? const Color.fromRGBO(181, 181, 181, 1)
        : const Color.fromRGBO(191, 191, 191, 1);
    minorTickLineColor ??= isLight
        ? const Color.fromRGBO(214, 214, 214, 1)
        : const Color.fromRGBO(150, 150, 150, 1);
    titleTextColor ??= isLight
        ? const Color.fromRGBO(66, 66, 66, 1)
        : const Color.fromRGBO(255, 255, 255, 1);
    titleBackgroundColor ??= Colors.transparent;
    legendTextColor ??= isLight
        ? const Color.fromRGBO(53, 53, 53, 1)
        : const Color.fromRGBO(255, 255, 255, 1);
    legendBackgroundColor ??= isLight
        ? const Color.fromRGBO(255, 255, 255, 1)
        : const Color.fromRGBO(0, 0, 0, 1);
    legendTitleColor ??= isLight
        ? const Color.fromRGBO(66, 66, 66, 1)
        : const Color.fromRGBO(255, 255, 255, 1);
    plotAreaBackgroundColor ??= Colors.transparent;
    crosshairLineColor ??= isLight
        ? const Color.fromRGBO(79, 79, 79, 1)
        : const Color.fromRGBO(255, 255, 255, 1);
    crosshairBackgroundColor ??= isLight
        ? const Color.fromRGBO(79, 79, 79, 1)
        : const Color.fromRGBO(255, 255, 255, 1);
    crosshairLabelColor ??= isLight
        ? const Color.fromRGBO(229, 229, 229, 1)
        : const Color.fromRGBO(0, 0, 0, 1);
    tooltipColor ??= isLight
        ? const Color.fromRGBO(0, 8, 22, 0.75)
        : const Color.fromRGBO(255, 255, 255, 1);
    tooltipLabelColor ??= isLight
        ? const Color.fromRGBO(255, 255, 255, 1)
        : const Color.fromRGBO(0, 0, 0, 1);
    tooltipSeparatorColor ??= isLight
        ? const Color.fromRGBO(255, 255, 255, 1)
        : const Color.fromRGBO(150, 150, 150, 1);
    selectionRectColor ??= isLight
        ? const Color.fromRGBO(41, 171, 226, 0.1)
        : const Color.fromRGBO(255, 217, 57, 0.3);
    selectionRectBorderColor ??= isLight
        ? const Color.fromRGBO(41, 171, 226, 1)
        : const Color.fromRGBO(255, 255, 255, 1);
    selectionTooltipConnectorLineColor ??= isLight
        ? const Color.fromRGBO(79, 79, 79, 1)
        : const Color.fromRGBO(150, 150, 150, 1);

    return SfChartThemeData.raw(
        brightness: brightness,
        axisLabelColor: axisLabelColor,
        axisLineColor: axisLineColor,
        axisTitleColor: axisTitleColor,
        backgroundColor: backgroundColor,
        titleTextColor: titleTextColor,
        crosshairBackgroundColor: crosshairBackgroundColor,
        crosshairLabelColor: crosshairLabelColor,
        crosshairLineColor: crosshairLineColor,
        legendBackgroundColor: legendBackgroundColor,
        legendTextColor: legendTextColor,
        legendTitleColor: legendTitleColor,
        majorGridLineColor: majorGridLineColor,
        majorTickLineColor: majorTickLineColor,
        minorGridLineColor: minorGridLineColor,
        minorTickLineColor: minorTickLineColor,
        plotAreaBackgroundColor: plotAreaBackgroundColor,
        selectionRectColor: selectionRectColor,
        selectionRectBorderColor: selectionRectBorderColor,
        selectionTooltipConnectorLineColor: selectionTooltipConnectorLineColor,
        titleBackgroundColor: titleBackgroundColor,
        tooltipColor: tooltipColor,
        tooltipSeparatorColor: tooltipSeparatorColor,
        tooltipLabelColor: tooltipLabelColor);
  }

  /// Create a [SfChartThemeData] given a set of exact values. All the values must be
  /// specified.
  ///
  /// This will rarely be used directly. It is used by [lerp] to
  /// create intermediate themes based on two themes created with the
  /// [SfChartThemeData] constructor.
  const SfChartThemeData.raw(
      {@required this.brightness,
      @required this.axisLabelColor,
      @required this.axisLineColor,
      @required this.axisTitleColor,
      @required this.backgroundColor,
      @required this.titleTextColor,
      @required this.crosshairBackgroundColor,
      @required this.crosshairLabelColor,
      @required this.crosshairLineColor,
      @required this.legendBackgroundColor,
      @required this.legendTextColor,
      @required this.legendTitleColor,
      @required this.majorGridLineColor,
      @required this.majorTickLineColor,
      @required this.minorGridLineColor,
      @required this.minorTickLineColor,
      @required this.plotAreaBackgroundColor,
      @required this.selectionRectColor,
      @required this.selectionRectBorderColor,
      @required this.selectionTooltipConnectorLineColor,
      @required this.titleBackgroundColor,
      @required this.tooltipColor,
      @required this.tooltipSeparatorColor,
      @required this.tooltipLabelColor});

  /// The brightness of the overall theme of the application for the chart widgets.
  final Brightness brightness;

  /// Specifies the background color of chart widgets.
  final Color backgroundColor;

  /// Specifies the color for axis labels.
  final Color axisLabelColor;

  /// Specifies the color for axis title.
  final Color axisTitleColor;

  /// Specifies the color for axis line.
  final Color axisLineColor;

  /// Specifies the color for major grid line of an axis.
  final Color majorGridLineColor;

  /// Specifies the color for minor grid line of an axis.
  final Color minorGridLineColor;

  /// Specifies the color for major tick line of an axis.
  final Color majorTickLineColor;

  /// Specifies the color for minor tick line of an axis.
  final Color minorTickLineColor;

  /// Specifies the color for title.
  final Color titleTextColor;

  /// Specifies the background color for title of the chart.
  final Color titleBackgroundColor;

  /// Specifies the text color of the legend.
  final Color legendTextColor;

  /// Specifies the title color of the legend.
  final Color legendTitleColor;

  /// Specifies the background color of the legend.
  final Color legendBackgroundColor;

  /// Specifies the background color of plot area of chart.
  final Color plotAreaBackgroundColor;

  /// Specifies the crosshair line color
  final Color crosshairLineColor;

  /// Specifies the crosshair color.
  final Color crosshairBackgroundColor;

  /// Specifies the color of the crosshair text.
  final Color crosshairLabelColor;

  /// Specifies the color of the tooltip.
  final Color tooltipColor;

  /// Specifies the text color of the tooltip.
  final Color tooltipLabelColor;

  /// Specifies the line color of the tooltip which separates the header and values.
  final Color tooltipSeparatorColor;

  /// Specifies the color of an rectangle which is used for selection zooming.
  final Color selectionRectColor;

  /// Specifies the stroke color of an rectangle which is used for selection zooming.
  final Color selectionRectBorderColor;

  /// Specifies the connector line color which is used in selection zooming.
  final Color selectionTooltipConnectorLineColor;

  /// Creates a copy of this theme but with the given fields replaced with the new values.
  SfChartThemeData copyWith(
      {Brightness brightness,
      Color axisLabelColor,
      Color axisLineColor,
      Color axisTitleColor,
      Color backgroundColor,
      Color titleTextColor,
      Color crosshairBackgroundColor,
      Color crosshairLabelColor,
      Color crosshairLineColor,
      Color legendBackgroundColor,
      Color legendTextColor,
      Color legendTitleColor,
      Color majorGridLineColor,
      Color majorTickLineColor,
      Color minorGridLineColor,
      Color minorTickLineColor,
      Color plotAreaBackgroundColor,
      Color selectionRectColor,
      Color selectionRectBorderColor,
      Color selectionTooltipConnectorLineColor,
      Color titleBackgroundColor,
      Color tooltipColor,
      Color tooltipSeparatorColor,
      Color tooltipLabelColor}) {
    return SfChartThemeData.raw(
      brightness: brightness ?? this.brightness,
      axisLabelColor: axisLabelColor ?? this.axisLabelColor,
      axisLineColor: axisLineColor ?? this.axisLineColor,
      axisTitleColor: axisTitleColor ?? this.axisTitleColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      titleTextColor: titleTextColor ?? this.titleTextColor,
      crosshairBackgroundColor:
          crosshairBackgroundColor ?? this.crosshairBackgroundColor,
      crosshairLabelColor: crosshairLabelColor ?? this.crosshairLabelColor,
      crosshairLineColor: crosshairLineColor ?? this.crosshairLineColor,
      legendBackgroundColor:
          legendBackgroundColor ?? this.legendBackgroundColor,
      legendTextColor: legendTextColor ?? this.legendTextColor,
      legendTitleColor: legendTitleColor ?? this.legendTitleColor,
      majorGridLineColor: majorGridLineColor ?? this.majorGridLineColor,
      majorTickLineColor: majorTickLineColor ?? this.majorTickLineColor,
      minorGridLineColor: minorGridLineColor ?? this.minorGridLineColor,
      minorTickLineColor: minorTickLineColor ?? this.minorTickLineColor,
      plotAreaBackgroundColor:
          plotAreaBackgroundColor ?? this.plotAreaBackgroundColor,
      selectionRectColor: selectionRectColor ?? this.selectionRectColor,
      selectionRectBorderColor:
          selectionRectBorderColor ?? this.selectionRectBorderColor,
      selectionTooltipConnectorLineColor: selectionTooltipConnectorLineColor ??
          this.selectionTooltipConnectorLineColor,
      titleBackgroundColor: titleBackgroundColor ?? this.titleBackgroundColor,
      tooltipColor: tooltipColor ?? this.tooltipColor,
      tooltipSeparatorColor:
          tooltipSeparatorColor ?? this.tooltipSeparatorColor,
      tooltipLabelColor: tooltipLabelColor ?? this.tooltipLabelColor,
    );
  }

  static SfChartThemeData lerp(
      SfChartThemeData a, SfChartThemeData b, double t) {
    assert(t != null);
    if (a == null && b == null) {
      return null;
    }
    return SfChartThemeData(
      axisLabelColor: Color.lerp(a.axisLabelColor, b.axisLabelColor, t),
      axisLineColor: Color.lerp(a.axisLineColor, b.axisLineColor, t),
      axisTitleColor: Color.lerp(a.axisTitleColor, b.axisTitleColor, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      titleTextColor: Color.lerp(a.titleTextColor, b.titleTextColor, t),
      crosshairBackgroundColor:
          Color.lerp(a.crosshairBackgroundColor, b.crosshairBackgroundColor, t),
      crosshairLabelColor:
          Color.lerp(a.crosshairLabelColor, b.crosshairLabelColor, t),
      crosshairLineColor:
          Color.lerp(a.crosshairLineColor, b.crosshairLineColor, t),
      legendBackgroundColor:
          Color.lerp(a.legendBackgroundColor, b.legendBackgroundColor, t),
      legendTextColor: Color.lerp(a.legendTextColor, b.legendTextColor, t),
      legendTitleColor: Color.lerp(a.legendTitleColor, b.legendTitleColor, t),
      majorGridLineColor:
          Color.lerp(a.majorGridLineColor, b.majorGridLineColor, t),
      majorTickLineColor:
          Color.lerp(a.majorTickLineColor, b.majorTickLineColor, t),
      minorGridLineColor:
          Color.lerp(a.minorGridLineColor, b.minorGridLineColor, t),
      minorTickLineColor:
          Color.lerp(a.minorTickLineColor, b.minorTickLineColor, t),
      plotAreaBackgroundColor:
          Color.lerp(a.plotAreaBackgroundColor, b.plotAreaBackgroundColor, t),
      selectionRectColor:
          Color.lerp(a.selectionRectColor, b.selectionRectColor, t),
      selectionRectBorderColor:
          Color.lerp(a.selectionRectBorderColor, b.selectionRectBorderColor, t),
      selectionTooltipConnectorLineColor: Color.lerp(
          a.selectionTooltipConnectorLineColor,
          b.selectionTooltipConnectorLineColor,
          t),
      titleBackgroundColor:
          Color.lerp(a.titleBackgroundColor, b.titleBackgroundColor, t),
      tooltipColor: Color.lerp(a.tooltipColor, b.tooltipColor, t),
      tooltipSeparatorColor:
          Color.lerp(a.tooltipSeparatorColor, b.tooltipSeparatorColor, t),
      tooltipLabelColor:
          Color.lerp(a.tooltipLabelColor, b.tooltipLabelColor, t),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    final SfChartThemeData typedOther = other;
    return typedOther.brightness == brightness &&
        typedOther.axisLabelColor == axisLabelColor &&
        typedOther.axisLineColor == axisLineColor &&
        typedOther.axisTitleColor == axisTitleColor &&
        typedOther.backgroundColor == backgroundColor &&
        typedOther.titleTextColor == titleTextColor &&
        typedOther.crosshairBackgroundColor == crosshairBackgroundColor &&
        typedOther.crosshairLabelColor == crosshairLabelColor &&
        typedOther.crosshairLineColor == crosshairLineColor &&
        typedOther.legendBackgroundColor == legendBackgroundColor &&
        typedOther.legendTextColor == legendTextColor &&
        typedOther.legendTitleColor == legendTitleColor &&
        typedOther.majorGridLineColor == majorGridLineColor &&
        typedOther.majorTickLineColor == majorTickLineColor &&
        typedOther.minorGridLineColor == minorGridLineColor &&
        typedOther.minorTickLineColor == minorTickLineColor &&
        typedOther.plotAreaBackgroundColor == plotAreaBackgroundColor &&
        typedOther.selectionRectColor == selectionRectColor &&
        typedOther.selectionRectBorderColor == selectionRectBorderColor &&
        typedOther.selectionTooltipConnectorLineColor ==
            selectionTooltipConnectorLineColor &&
        typedOther.titleBackgroundColor == titleBackgroundColor &&
        typedOther.tooltipColor == tooltipColor &&
        typedOther.tooltipSeparatorColor == tooltipSeparatorColor &&
        typedOther.tooltipLabelColor == tooltipLabelColor;
  }

  @override
  int get hashCode {
    final List<Object> values = <Object>[
      axisLabelColor,
      axisLineColor,
      axisTitleColor,
      backgroundColor,
      titleTextColor,
      crosshairBackgroundColor,
      crosshairLabelColor,
      crosshairLineColor,
      legendBackgroundColor,
      legendTextColor,
      legendTitleColor,
      majorGridLineColor,
      majorTickLineColor,
      minorGridLineColor,
      minorTickLineColor,
      plotAreaBackgroundColor,
      selectionRectColor,
      selectionRectBorderColor,
      selectionTooltipConnectorLineColor,
      titleBackgroundColor,
      tooltipColor,
      tooltipSeparatorColor,
      tooltipLabelColor
    ];
    return hashList(values);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    final SfChartThemeData defaultData = SfChartThemeData();
    properties.add(EnumProperty<Brightness>('brightness', brightness,
        defaultValue: defaultData.brightness));
    properties.add(ColorProperty('axisLabelColor', axisLabelColor,
        defaultValue: defaultData.axisLabelColor));
    properties.add(ColorProperty('axisLineColor', axisLineColor,
        defaultValue: defaultData.axisLineColor));
    properties.add(ColorProperty('axisTitleColor', axisTitleColor,
        defaultValue: defaultData.axisTitleColor));
    properties.add(ColorProperty('backgroundColor', backgroundColor,
        defaultValue: defaultData.backgroundColor));
    properties.add(ColorProperty('titleTextColor', titleTextColor,
        defaultValue: defaultData.titleTextColor));
    properties.add(ColorProperty(
        'crosshairBackgroundColor', crosshairBackgroundColor,
        defaultValue: defaultData.crosshairBackgroundColor));
    properties.add(ColorProperty('crosshairLabelColor', crosshairLabelColor,
        defaultValue: defaultData.crosshairLabelColor));
    properties.add(ColorProperty('crosshairLineColor', crosshairLineColor,
        defaultValue: defaultData.crosshairLineColor));
    properties.add(ColorProperty('legendBackgroundColor', legendBackgroundColor,
        defaultValue: defaultData.legendBackgroundColor));
    properties.add(ColorProperty('legendTextColor', legendTextColor,
        defaultValue: defaultData.legendTextColor));
    properties.add(ColorProperty('legendTitleColor', legendTitleColor,
        defaultValue: defaultData.legendTitleColor));
    properties.add(ColorProperty('majorGridLineColor', majorGridLineColor,
        defaultValue: defaultData.majorGridLineColor));
    properties.add(ColorProperty('majorTickLineColor', majorTickLineColor,
        defaultValue: defaultData.majorTickLineColor));
    properties.add(ColorProperty('minorGridLineColor', minorGridLineColor,
        defaultValue: defaultData.minorGridLineColor));
    properties.add(ColorProperty('minorTickLineColor', minorTickLineColor,
        defaultValue: defaultData.minorTickLineColor));
    properties.add(ColorProperty(
        'plotAreaBackgroundColor', plotAreaBackgroundColor,
        defaultValue: defaultData.plotAreaBackgroundColor));
    properties.add(ColorProperty('selectionRectColor', selectionRectColor,
        defaultValue: defaultData.selectionRectColor));
    properties.add(ColorProperty(
        'selectionRectBorderColor', selectionRectBorderColor,
        defaultValue: defaultData.selectionRectBorderColor));
    properties.add(ColorProperty('selectionTooltipConnectorLineColor',
        selectionTooltipConnectorLineColor,
        defaultValue: defaultData.selectionTooltipConnectorLineColor));
    properties.add(ColorProperty('titleBackgroundColor', titleBackgroundColor,
        defaultValue: defaultData.titleBackgroundColor));
    properties.add(ColorProperty('tooltipColor', tooltipColor,
        defaultValue: defaultData.tooltipColor));
    properties.add(ColorProperty('tooltipSeparatorColor', tooltipSeparatorColor,
        defaultValue: defaultData.tooltipSeparatorColor));
    properties.add(ColorProperty('tooltipLabelColor', tooltipLabelColor,
        defaultValue: defaultData.tooltipLabelColor));
  }
}
