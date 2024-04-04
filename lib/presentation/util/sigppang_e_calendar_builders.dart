import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/constants.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';
import 'package:table_calendar/table_calendar.dart';

final class SigppangECalendarBuilders extends CalendarBuilders {
  final double _defaultOpacity = 0.4;
  final Widget Function(DateTime dateTime) _buildDayLogo;

  @override
  DayBuilder? get dowBuilder => (BuildContext context, DateTime day) {
    final dayOfWeek = DateFormat.E(defaultLocale).format(day);
    final TextStyle textStyle;

    switch (day.weekday) {
      case DateTime.sunday:
        textStyle = TextStyles.sundayTextStyle;
      case DateTime.saturday:
        textStyle = TextStyles.saturdayTextStyle;
      default:
        textStyle = TextStyles.defaultDayOfWeekTextStyle;
    }

    return Center(child: Text(dayOfWeek, style: textStyle));
  };

  @override
  FocusedDayBuilder? get selectedBuilder => (BuildContext context, DateTime day, DateTime focusedDay) {
    final logo = _buildDayLogo(day);
    final selectedDay = day.day.toString();
    final opacity = focusedDay.month == day.month ? 1.0 : _defaultOpacity;

    return Opacity(
      opacity: opacity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          logo,
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
              child: Center(
                child: Text(
                  selectedDay,
                  textAlign: TextAlign.center,
                  style: TextStyles.selectedDayTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  };

  @override
  FocusedDayBuilder? get todayBuilder => (BuildContext context, DateTime day, DateTime focusedDay) {
    final logo = _buildDayLogo(day);
    final today = day.day.toString();
    final opacity = focusedDay.month == day.month ? 1.0 : _defaultOpacity;

    return Opacity(
      opacity: opacity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          logo,
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
              child: Center(
                child: Text(
                  today,
                  textAlign: TextAlign.center,
                  style: TextStyles.nowTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  };

  @override
  FocusedDayBuilder? get defaultBuilder => (BuildContext context, DateTime day, DateTime focusedDay) {
    final logo = _buildDayLogo(day);
    final defaultDay = day.day.toString();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        logo,
        Expanded(
          child: Text(
            defaultDay,
            textAlign: TextAlign.center,
            style: TextStyles.dayTextStyle,
          ),
        ),
      ],
    );
  };

  @override
  FocusedDayBuilder? get outsideBuilder => (BuildContext context, DateTime day, DateTime focusedDay) {
    final logo = _buildDayLogo(day);
    final outsideDay = day.day.toString();

    return Opacity(
      opacity: _defaultOpacity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          logo,
          Expanded(
            child: Text(
              outsideDay,
              textAlign: TextAlign.center,
              style: TextStyles.dayTextStyle,
            ),
          ),
        ],
      ),
    );
  };

  SigppangECalendarBuilders({
    super.prioritizedBuilder,
    super.todayBuilder,
    super.selectedBuilder,
    super.rangeStartBuilder,
    super.rangeEndBuilder,
    super.withinRangeBuilder,
    super.outsideBuilder,
    super.disabledBuilder,
    super.holidayBuilder,
    super.defaultBuilder,
    super.rangeHighlightBuilder,
    super.singleMarkerBuilder,
    super.markerBuilder,
    super.dowBuilder,
    super.headerTitleBuilder,
    super.weekNumberBuilder,
    required Widget Function(DateTime dateTime) buildDayLogo,
  }) : _buildDayLogo = buildDayLogo;
}
