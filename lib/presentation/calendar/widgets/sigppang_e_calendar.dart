import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/constants.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/presentation/common/sigppang_e_logo_builder.dart';
import 'package:table_calendar/table_calendar.dart';

final class SigppangECalendar extends StatelessWidget {
  final DateTime _firstDate = DateTime(1970, 1, 1);

  final DateTime _lastDate = DateTime(2099, 12, 31);

  final DateTime _focusedDay = DateTime.now();

  final double _dayOfWeekHeight = Sizes.dayOfWeekSize.height;

  final double _calendarRowHeight = Sizes.calendarRowSize.height;

  SigppangECalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: defaultLocale,
      focusedDay: _focusedDay,
      calendarFormat: CalendarFormat.month,
      firstDay: _firstDate,
      lastDay: _lastDate,
      headerVisible: false,
      daysOfWeekHeight: _dayOfWeekHeight,
      rowHeight: _calendarRowHeight,
      availableGestures: AvailableGestures.horizontalSwipe,
      selectedDayPredicate: (day) => isSameDay(day, DateTime(2024, 1, 24)),
      calendarBuilders: CalendarBuilders(
        dowBuilder: _dayOfWeekBuilder,
        selectedBuilder: _selectedDayBuilder,
        todayBuilder: _todayBuilder,
        defaultBuilder: _defaultDayBuilder,
        outsideBuilder: _outsideDayBuilder,
      ),
    );
  }

  Widget _dayOfWeekBuilder(BuildContext context, DateTime day) {
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
  }

  Widget _selectedDayBuilder(BuildContext context, DateTime day, DateTime focusedDay) {
    final logo = SigppangELogoBuilder.build(size: Sizes.calendarDayLogoSize);
    final selectedDay = day.day.toString();

    return Column(
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
    );
  }

  Widget _todayBuilder(BuildContext context, DateTime day, DateTime focusedDay) {
    final logo = SigppangELogoBuilder.build(size: Sizes.calendarDayLogoSize);
    final today = day.day.toString();

    return Column(
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
    );
  }

  Widget _defaultDayBuilder(BuildContext context, DateTime day, DateTime focusedDay) {
    final logo = SigppangELogoBuilder.build(size: Sizes.calendarDayLogoSize);
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
  }

  Widget _outsideDayBuilder(BuildContext context, DateTime day, DateTime focusedDay) {
    final logo = SigppangELogoBuilder.build(size: Sizes.calendarDayLogoSize);
    final outsideDay = day.day.toString();

    return Opacity(
      opacity: 0.4,
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
  }
}
