import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sigppang_e/common/constants/constants.dart';
import 'package:sigppang_e/presentation/common/sigppang_e_logo.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/presentation/calendar/widgets/sigppang_e_calendar/day_of_week_widget.dart';
import 'package:sigppang_e/presentation/calendar/widgets/sigppang_e_calendar/default_date_widget.dart';
import 'package:sigppang_e/presentation/calendar/widgets/sigppang_e_calendar/now_date_widget.dart';
import 'package:sigppang_e/presentation/calendar/widgets/sigppang_e_calendar/outside_date_widget.dart';
import 'package:sigppang_e/presentation/calendar/widgets/sigppang_e_calendar/selected_date_widget.dart';
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
    return Flex(
      direction: Axis.vertical,
      children: [
        _title(),
        SizedBox(height: 4.h),
        _calendar(),
      ],
    );
  }

  Widget _title() {
    final size = Sizes.calendarHeaderSize;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Row(
        children: [
          Text(
            '2024년 1월',
            style: TextStyles.calendarHeaderTextStyle,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.unfold_less),
            padding: EdgeInsets.zero,
            iconSize: size.height * 0.7,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _calendar() {
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
        dowBuilder: (_, day) {
          return DayOfWeek(day: day);
        },
        selectedBuilder: (_, selectedDate, currentDate) {
          return SelectedDate(
            logo: SigppangELogo.build(size: Sizes.calendarDayLogoSize),
            selectedDay: selectedDate.day.toString(),
          );
        },
        todayBuilder: (_, day, currentDay) {
          return NowDate(
            logo: SigppangELogo.build(size: Sizes.calendarDayLogoSize),
            day: day.day.toString(),
          );
        },
        defaultBuilder: (_, day, currentDay) {
          return DefaultDate(
            logo: SigppangELogo.build(size: Sizes.calendarDayLogoSize),
            day: day.day.toString(),
          );
        },
        outsideBuilder: (_, day, currentDay) {
          return OutsideDateWidget(
            logo: SigppangELogo.build(size: Sizes.calendarDayLogoSize),
            day: day.day.toString(),
          );
        },
      ),
    );
  }
}
