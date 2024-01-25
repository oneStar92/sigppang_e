import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/constants.dart';
import 'package:sigppang_e/common/di/logo_container.dart';
import 'package:sigppang_e/common/constants/size_constants.dart';
import 'package:sigppang_e/presentation/calendar/widgets/sigppang_e_calednar/day_of_week_widget.dart';
import 'package:sigppang_e/presentation/calendar/widgets/sigppang_e_calednar/default_date_widget.dart';
import 'package:sigppang_e/presentation/calendar/widgets/sigppang_e_calednar/now_date_widget.dart';
import 'package:sigppang_e/presentation/calendar/widgets/sigppang_e_calednar/outside_date_widget.dart';
import 'package:sigppang_e/presentation/calendar/widgets/sigppang_e_calednar/selected_date_widget.dart';
import 'package:table_calendar/table_calendar.dart';

final class SigppangECalendar extends StatelessWidget {
  final DateTime _firstDate = DateTime(1970, 1, 1);
  final DateTime _lastDate = DateTime(2099, 12, 31);
  final DateTime _focusedDay = DateTime.now();
  final double _dayOfWeekHeight = SizeConstants.dayOfWeek.value.height;
  final double _calendarRowHeight = SizeConstants.calendarRow.value.height;
  SigppangECalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: defaultLocale,
      focusedDay: _focusedDay,
      firstDay: _firstDate,
      lastDay: _lastDate,
      headerVisible: false,
      daysOfWeekHeight: _dayOfWeekHeight,
      rowHeight: _calendarRowHeight,
      selectedDayPredicate: (day) => isSameDay(day, DateTime(2024, 1, 24)),
      calendarBuilders: CalendarBuilders(
        dowBuilder: (_, day) {
          return DayOfWeek(day: day);
        },
        selectedBuilder: (_, selectedDate, currentDate) {
          return SelectedDate(
            logo: LogoDIContainer.instance.calendarLogo(),
            selectedDay: selectedDate.day.toString(),
          );
        },
        todayBuilder: (_, day, currentDay) {
          return NowDate(
            logo: LogoDIContainer.instance.calendarLogo(),
            day: day.day.toString(),
          );
        },
        defaultBuilder: (_, day, currentDay) {
          return DefaultDate(
            logo: LogoDIContainer.instance.calendarLogo(),
            day: day.day.toString(),
          );
        },
        outsideBuilder: (_, day, currentDay) {
          return OutsideDateWidget(
            logo: LogoDIContainer.instance.calendarLogo(),
            day: day.day.toString(),
          );
        },
      ),
    );
  }
}
