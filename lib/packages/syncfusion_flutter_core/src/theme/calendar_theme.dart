import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../theme.dart';

/// Applies a theme to descendant Syncfusion calendar widgets.
class SfCalendarTheme extends InheritedTheme {
  const SfCalendarTheme({Key key, this.data, this.child})
      : super(key: key, child: child);

  /// Specifies the color and typography values for descendant calendar widgets.
  final SfCalendarThemeData data;

  /// Specifies a widget that can hold single child.
  final Widget child;

  /// The data from the closest [SfCalendarTheme] instance that encloses the given
  /// context.
  ///
  /// Defaults to [SfThemeData.calendarThemeData] if there is no [SfCalendarTheme] in the given
  /// build context.
  static SfCalendarThemeData of(BuildContext context) {
    final SfCalendarTheme sfCalendarTheme =
        context.dependOnInheritedWidgetOfExactType<SfCalendarTheme>();
    return sfCalendarTheme?.data ?? SfTheme.of(context).calendarThemeData;
  }

  @override
  bool updateShouldNotify(SfCalendarTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    final SfCalendarTheme ancestorTheme =
        context.findAncestorWidgetOfExactType<SfCalendarTheme>();
    return identical(this, ancestorTheme)
        ? child
        : SfCalendarTheme(data: data, child: child);
  }
}

/// Holds the color and typography values for a [SfCalendarTheme]. Use
///  this class to configure a [SfCalendarTheme] widget
///
/// To obtain the current theme, use [SfCalendarTheme.of].
class SfCalendarThemeData with DiagnosticableMixin {
  factory SfCalendarThemeData({
    Brightness brightness,
    Color backgroundColor,
    Color headerBackgroundColor,
    Color agendaBackgroundColor,
    Color cellBorderColor,
    Color activeDatesBackgroundColor,
    Color todayBackgroundColor,
    Color trailingDatesBackgroundColor,
    Color leadingDatesBackgroundColor,
    Color selectionBorderColor,
    Color todayHighlightColor,
    Color viewHeaderBackgroundColor,
    TextStyle todayTextStyle,
    TextStyle agendaDayTextStyle,
    TextStyle agendaDateTextStyle,
    TextStyle headerTextStyle,
    TextStyle viewHeaderDateTextStyle,
    TextStyle viewHeaderDayTextStyle,
    TextStyle timeTextStyle,
    TextStyle activeDatesTextStyle,
    TextStyle trailingDatesTextStyle,
    TextStyle leadingDatesTextStyle,
  }) {
    brightness = brightness ?? Brightness.light;
    final bool isLight = brightness == Brightness.light;
    backgroundColor ??= Colors.transparent;
    headerBackgroundColor ??= Colors.transparent;
    agendaBackgroundColor ??= Colors.transparent;
    agendaDayTextStyle ??= isLight
        ? TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
            fontSize: 10,
            fontFamily: 'Roboto')
        : TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w500,
            fontSize: 10,
            fontFamily: 'Roboto');
    agendaDateTextStyle ??= isLight
        ? TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal)
        : TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal);
    activeDatesBackgroundColor ??= Colors.transparent;
    todayBackgroundColor ??= Colors.transparent;
    trailingDatesBackgroundColor ??= Colors.transparent;
    leadingDatesBackgroundColor ??= Colors.transparent;
    viewHeaderBackgroundColor ??= Colors.transparent;
    cellBorderColor ??=
        isLight ? Colors.black.withOpacity(0.16) : Colors.white70;
    todayTextStyle ??= isLight
        ? TextStyle(color: Colors.white, fontSize: 13, fontFamily: 'Roboto')
        : TextStyle(color: Colors.black, fontSize: 13, fontFamily: 'Roboto');
    headerTextStyle ??= isLight
        ? TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto')
        : TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto');
    activeDatesTextStyle ??= isLight
        ? TextStyle(color: Colors.black87, fontSize: 13, fontFamily: 'Roboto')
        : TextStyle(color: Colors.white, fontSize: 13, fontFamily: 'Roboto');
    timeTextStyle ??= isLight
        ? TextStyle(
            color: Colors.black54, fontWeight: FontWeight.w500, fontSize: 10)
        : TextStyle(
            color: Colors.white38, fontWeight: FontWeight.w500, fontSize: 10);
    viewHeaderDateTextStyle ??= isLight
        ? TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto')
        : TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto');
    viewHeaderDayTextStyle ??= isLight
        ? TextStyle(
            color: Colors.black87,
            fontSize: 11,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto')
        : TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto');
    trailingDatesTextStyle ??= isLight
        ? TextStyle(color: Colors.black54, fontSize: 13, fontFamily: 'Roboto')
        : TextStyle(color: Colors.white70, fontSize: 13, fontFamily: 'Roboto');
    leadingDatesTextStyle ??= isLight
        ? TextStyle(color: Colors.black54, fontSize: 13, fontFamily: 'Roboto')
        : TextStyle(color: Colors.white70, fontSize: 13, fontFamily: 'Roboto');
    todayHighlightColor ??=
        isLight ? const Color(0xFF0066FF) : const Color(0xFF64FFDA);
    selectionBorderColor ??=
        isLight ? const Color(0xFF2196F3) : const Color(0xFF64FFDA);

    return SfCalendarThemeData.raw(
      brightness: brightness,
      backgroundColor: backgroundColor,
      headerTextStyle: headerTextStyle,
      headerBackgroundColor: headerBackgroundColor,
      agendaBackgroundColor: agendaBackgroundColor,
      viewHeaderDateTextStyle: viewHeaderDateTextStyle,
      viewHeaderDayTextStyle: viewHeaderDayTextStyle,
      agendaDayTextStyle: agendaDayTextStyle,
      agendaDateTextStyle: agendaDateTextStyle,
      cellBorderColor: cellBorderColor,
      timeTextStyle: timeTextStyle,
      activeDatesTextStyle: activeDatesTextStyle,
      activeDatesBackgroundColor: activeDatesBackgroundColor,
      todayBackgroundColor: todayBackgroundColor,
      trailingDatesBackgroundColor: trailingDatesBackgroundColor,
      leadingDatesBackgroundColor: leadingDatesBackgroundColor,
      trailingDatesTextStyle: trailingDatesTextStyle,
      leadingDatesTextStyle: leadingDatesTextStyle,
      todayTextStyle: todayTextStyle,
      todayHighlightColor: todayHighlightColor,
      viewHeaderBackgroundColor: viewHeaderBackgroundColor,
      selectionBorderColor: selectionBorderColor,
    );
  }

  /// Create a [SfCalendarThemeData] given a set of exact values. All the values must be
  /// specified.
  ///
  /// This will rarely be used directly. It is used by [lerp] to
  /// create intermediate themes based on two themes created with the
  /// [SfCalendarThemeData] constructor.
  const SfCalendarThemeData.raw({
    @required this.brightness,
    @required this.backgroundColor,
    @required this.headerTextStyle,
    @required this.headerBackgroundColor,
    @required this.agendaBackgroundColor,
    @required this.cellBorderColor,
    @required this.viewHeaderDateTextStyle,
    @required this.viewHeaderDayTextStyle,
    @required this.viewHeaderBackgroundColor,
    @required this.agendaDayTextStyle,
    @required this.agendaDateTextStyle,
    @required this.timeTextStyle,
    @required this.activeDatesTextStyle,
    @required this.activeDatesBackgroundColor,
    @required this.todayBackgroundColor,
    @required this.trailingDatesBackgroundColor,
    @required this.leadingDatesBackgroundColor,
    @required this.trailingDatesTextStyle,
    @required this.leadingDatesTextStyle,
    @required this.todayTextStyle,
    @required this.todayHighlightColor,
    @required this.selectionBorderColor,
  });

  /// The brightness of the overall theme of the application for the calendar widgets.
  final Brightness brightness;

  /// Specifies the background color of calendar widgets.
  final Color backgroundColor;

  /// Specifies the calendar header text style.
  final TextStyle headerTextStyle;

  ///Specifies the cell border color of calendar widgets.
  final Color cellBorderColor;

  ///Specifies the calendar Header background color.
  final Color headerBackgroundColor;

  ///Specifies the border color the default BoxDecoration , border color.
  final Color selectionBorderColor;

  ///Specifies the agenda view background color.
  final Color agendaBackgroundColor;

  ///Specifies the agenda view background color.
  final Color viewHeaderBackgroundColor;

  /// Specifies the day text style for the view header.
  final TextStyle viewHeaderDayTextStyle;

  /// Specifies the agenda view day text style.
  final TextStyle agendaDayTextStyle;

  /// Specifies the agenda view date text style.
  final TextStyle agendaDateTextStyle;

  /// Specifies the background color for the current month cells.
  final Color activeDatesBackgroundColor;

  ///Specifies the background for the today month cell.
  final Color todayBackgroundColor;

  ///Specifies the background for the trailing dates month cells.
  final Color trailingDatesBackgroundColor;

  ///Specifies the background for the leading dates month cells.
  final Color leadingDatesBackgroundColor;

  /// Specifies the text style for the leading month cell dates.
  final TextStyle leadingDatesTextStyle;

  /// Specifies the text style for the today month cell.
  final TextStyle todayTextStyle;

  ///Specifies the today highlight color.
  final Color todayHighlightColor;

  /// Specifies the date text style for the view header.
  final TextStyle viewHeaderDateTextStyle;

  /// Specifies the time label text style in days and timeline views.
  final TextStyle timeTextStyle;

  ///Specifies the current month text style color of calendar widgets.
  final TextStyle activeDatesTextStyle;

  /// Specifies the text style for the trailing month cell dates.
  final TextStyle trailingDatesTextStyle;

  /// Creates a copy of this theme but with the given fields replaced with the new values.
  SfCalendarThemeData copyWith({
    Brightness brightness,
    Color backgroundColor,
    TextStyle headerTextStyle,
    Color headerBackgroundColor,
    Color agendaBackgroundColor,
    Color cellBorderColor,
    TextStyle viewHeaderDateTextStyle,
    TextStyle viewHeaderDayTextStyle,
    TextStyle agendaDayTextStyle,
    TextStyle agendaDateTextStyle,
    TextStyle timeTextStyle,
    TextStyle activeDatesTextStyle,
    Color activeDatesBackgroundColor,
    Color todayBackgroundColor,
    Color trailingDatesBackgroundColor,
    Color leadingDatesBackgroundColor,
    TextStyle trailingDatesTextStyle,
    TextStyle leadingDatesTextStyle,
    TextStyle todayTextStyle,
    Color todayHighlightColor,
    TextStyle viewHeaderBackgroundColor,
    Color selectionBorderColor,
  }) {
    return SfCalendarThemeData.raw(
      brightness: brightness ?? this.brightness,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      headerTextStyle: headerTextStyle ?? this.headerTextStyle,
      headerBackgroundColor:
          headerBackgroundColor ?? this.headerBackgroundColor,
      agendaBackgroundColor:
          agendaBackgroundColor ?? this.agendaBackgroundColor,
      cellBorderColor: cellBorderColor ?? this.cellBorderColor,
      viewHeaderDateTextStyle:
          viewHeaderDateTextStyle ?? this.viewHeaderDateTextStyle,
      viewHeaderDayTextStyle:
          viewHeaderDayTextStyle ?? this.viewHeaderDayTextStyle,
      agendaDayTextStyle: agendaDayTextStyle ?? this.agendaDayTextStyle,
      agendaDateTextStyle: agendaDateTextStyle ?? this.agendaDateTextStyle,
      timeTextStyle: timeTextStyle ?? this.timeTextStyle,
      activeDatesTextStyle: activeDatesTextStyle ?? this.activeDatesTextStyle,
      activeDatesBackgroundColor:
          activeDatesBackgroundColor ?? this.activeDatesBackgroundColor,
      todayBackgroundColor: todayBackgroundColor ?? todayBackgroundColor,
      trailingDatesBackgroundColor:
          trailingDatesBackgroundColor ?? trailingDatesBackgroundColor,
      leadingDatesBackgroundColor:
          leadingDatesBackgroundColor ?? leadingDatesBackgroundColor,
      trailingDatesTextStyle:
          trailingDatesTextStyle ?? this.trailingDatesTextStyle,
      leadingDatesTextStyle:
          leadingDatesTextStyle ?? this.leadingDatesTextStyle,
      todayTextStyle: todayTextStyle ?? this.todayTextStyle,
      todayHighlightColor: todayHighlightColor ?? this.todayHighlightColor,
      viewHeaderBackgroundColor:
          viewHeaderBackgroundColor ?? this.viewHeaderBackgroundColor,
      selectionBorderColor: selectionBorderColor ?? this.selectionBorderColor,
    );
  }

  static SfCalendarThemeData lerp(
      SfCalendarThemeData a, SfCalendarThemeData b, double t) {
    assert(t != null);
    if (a == null && b == null) {
      return null;
    }
    return SfCalendarThemeData(
        backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
        headerBackgroundColor:
            Color.lerp(a.headerBackgroundColor, b.headerBackgroundColor, t),
        agendaBackgroundColor:
            Color.lerp(a.agendaBackgroundColor, b.agendaBackgroundColor, t),
        cellBorderColor: Color.lerp(a.cellBorderColor, b.cellBorderColor, t),
        selectionBorderColor:
            Color.lerp(a.selectionBorderColor, b.selectionBorderColor, t),
        activeDatesBackgroundColor: Color.lerp(
            a.activeDatesBackgroundColor, b.activeDatesBackgroundColor, t),
        todayBackgroundColor:
            Color.lerp(a.todayBackgroundColor, b.todayBackgroundColor, t),
        trailingDatesBackgroundColor: Color.lerp(
            a.trailingDatesBackgroundColor, b.trailingDatesBackgroundColor, t),
        leadingDatesBackgroundColor: Color.lerp(
            a.leadingDatesBackgroundColor, b.leadingDatesBackgroundColor, t),
        todayHighlightColor:
            Color.lerp(a.todayHighlightColor, b.todayHighlightColor, t),
        viewHeaderBackgroundColor: Color.lerp(
            a.viewHeaderBackgroundColor, b.viewHeaderBackgroundColor, t));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    final SfCalendarThemeData typedOther = other;
    return typedOther.brightness == brightness &&
        typedOther.backgroundColor == backgroundColor &&
        typedOther.headerTextStyle == headerTextStyle &&
        typedOther.headerBackgroundColor == headerBackgroundColor &&
        typedOther.agendaBackgroundColor == agendaBackgroundColor &&
        typedOther.cellBorderColor == cellBorderColor &&
        typedOther.viewHeaderDateTextStyle == viewHeaderDateTextStyle &&
        typedOther.viewHeaderDayTextStyle == viewHeaderDayTextStyle &&
        typedOther.agendaDayTextStyle == agendaDayTextStyle &&
        typedOther.agendaDateTextStyle == agendaDateTextStyle &&
        typedOther.timeTextStyle == timeTextStyle &&
        typedOther.activeDatesTextStyle == activeDatesTextStyle &&
        typedOther.activeDatesBackgroundColor == activeDatesBackgroundColor &&
        typedOther.todayBackgroundColor == todayBackgroundColor &&
        typedOther.trailingDatesBackgroundColor ==
            trailingDatesBackgroundColor &&
        typedOther.leadingDatesBackgroundColor == leadingDatesBackgroundColor &&
        typedOther.trailingDatesTextStyle == trailingDatesTextStyle &&
        typedOther.leadingDatesTextStyle == leadingDatesTextStyle &&
        typedOther.todayTextStyle == todayTextStyle &&
        typedOther.todayHighlightColor == todayHighlightColor &&
        typedOther.viewHeaderBackgroundColor == viewHeaderBackgroundColor &&
        typedOther.selectionBorderColor == selectionBorderColor;
  }

  @override
  int get hashCode {
    final List<Object> values = <Object>[
      backgroundColor,
      headerTextStyle,
      headerBackgroundColor,
      agendaBackgroundColor,
      cellBorderColor,
      viewHeaderDateTextStyle,
      viewHeaderDayTextStyle,
      agendaDayTextStyle,
      agendaDateTextStyle,
      timeTextStyle,
      activeDatesTextStyle,
      activeDatesBackgroundColor,
      todayBackgroundColor,
      trailingDatesBackgroundColor,
      leadingDatesBackgroundColor,
      trailingDatesTextStyle,
      leadingDatesTextStyle,
      todayTextStyle,
      todayHighlightColor,
      viewHeaderBackgroundColor,
      selectionBorderColor,
    ];
    return hashList(values);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    final SfCalendarThemeData defaultData = SfCalendarThemeData();
    properties.add(EnumProperty<Brightness>('brightness', brightness,
        defaultValue: defaultData.brightness));
    properties.add(ColorProperty('backgroundColor', backgroundColor,
        defaultValue: defaultData.backgroundColor));
    properties.add(ColorProperty('headerBackgroundColor', headerBackgroundColor,
        defaultValue: defaultData.headerBackgroundColor));
    properties.add(ColorProperty('agendaBackgroundColor', agendaBackgroundColor,
        defaultValue: defaultData.agendaBackgroundColor));
    properties.add(ColorProperty('cellBorderColor', cellBorderColor,
        defaultValue: defaultData.cellBorderColor));
    properties.add(ColorProperty(
        'activeDatesBackgroundColor', activeDatesBackgroundColor,
        defaultValue: defaultData.activeDatesBackgroundColor));
    properties.add(ColorProperty('todayBackgroundColor', todayBackgroundColor,
        defaultValue: defaultData.todayBackgroundColor));
    properties.add(ColorProperty(
        'trailingDatesBackgroundColor', trailingDatesBackgroundColor,
        defaultValue: defaultData.trailingDatesBackgroundColor));
    properties.add(ColorProperty(
        'leadingDatesBackgroundColor', leadingDatesBackgroundColor,
        defaultValue: defaultData.leadingDatesBackgroundColor));
    properties.add(ColorProperty('todayHighlightColor', todayHighlightColor,
        defaultValue: defaultData.todayHighlightColor));
    properties.add(ColorProperty(
        'viewHeaderBackgroundColor', viewHeaderBackgroundColor,
        defaultValue: defaultData.viewHeaderBackgroundColor));
    properties.add(ColorProperty('selectionBorderColor', selectionBorderColor,
        defaultValue: defaultData.selectionBorderColor));
  }
}
