import 'dart:collection';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/constants.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/presentation/util/date_time+.dart';
import 'package:table_calendar/table_calendar.dart';

typedef CalendarEvents = LinkedHashMap<DateTime, List<CalendarEvent>>;

abstract interface class CalendarEvent {
  bool get isDone;
}

final class SigppangECalendar extends StatelessWidget {
  final DateTime _firstDate = DateTime(1970, 1, 1);

  final DateTime _lastDate = DateTime(2099, 12, 31);

  final double _dayOfWeekHeight = Sizes.dayOfWeekSize.height;

  final double _calendarRowHeight = Sizes.calendarRowSize.height;

  final CalendarEvents _events;

  final Widget _defaultIcon;

  final Widget _doneIcon;

  final Widget _unfinishedIcon;

  final DateTime _focusedDay;

  final DateTime _selectedDay;

  final CalendarFormat _format;

  final Function(DateTime)? _onPageChanged;

  final Function(DateTime)? _onDaySelected;

  SigppangECalendar({
    super.key,
    DateTime? focusedDay,
    DateTime? selectedDay,
    CalendarFormat? format,
    required CalendarEvents events,
    required Widget defaultIcon,
    required Widget doneIcon,
    required Widget unfinishedIcon,
    Function(DateTime)? onPageChanged,
    Function(DateTime)? onDaySelected,
  })  : _focusedDay = focusedDay ?? DateTime.now(),
        _selectedDay = selectedDay ?? DateTime.now(),
        _format = format ?? CalendarFormat.month,
        _events = events,
        _defaultIcon = defaultIcon,
        _doneIcon = doneIcon,
        _unfinishedIcon = unfinishedIcon,
        _onPageChanged = onPageChanged,
        _onDaySelected = onDaySelected;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: defaultLocale,
      focusedDay: _focusedDay,
      calendarFormat: _format,
      firstDay: _firstDate,
      lastDay: _lastDate,
      headerVisible: false,
      daysOfWeekHeight: _dayOfWeekHeight,
      rowHeight: _calendarRowHeight,
      availableGestures: AvailableGestures.horizontalSwipe,
      selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
      calendarBuilders: CalendarBuilders(
        dowBuilder: _dayOfWeekBuilder,
        selectedBuilder: _selectedDayBuilder,
        todayBuilder: _todayBuilder,
        defaultBuilder: _defaultDayBuilder,
        outsideBuilder: _outsideDayBuilder,
      ),
      onPageChanged: (day) => _onPageChanged?.call(day),
      onDaySelected: (day, _) => _onDaySelected?.call(day),
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
    final logo = _buildIcon(day);
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
    final logo = _buildIcon(day);
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
    final logo = _buildIcon(day);
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
    final logo = _buildIcon(day);
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

  Widget _buildIcon(DateTime day) {
    final events = _events[day];
    if (events != null && events.isNotEmpty) {
      final countOfUnfinished = events.where((element) => !element.isDone).length;
      if (countOfUnfinished > 0 && day.isBeforeToNow()) return _unfinishedIcon;
      if (countOfUnfinished == 0) return _doneIcon;
      return ShaderMask(
        shaderCallback: (rect) => LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [Colors.white, Colors.transparent],
          stops: [countOfUnfinished / events.length, 1.0],
        ).createShader(rect),
        blendMode: BlendMode.softLight,
        child: _doneIcon,
      );
    } else {
      return _defaultIcon;
    }
  }
}
