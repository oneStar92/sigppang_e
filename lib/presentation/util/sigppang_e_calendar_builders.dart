import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/constants.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';
import 'package:sigppang_e/domain/model/custom_date_time.dart';
import 'package:sigppang_e/presentation/util/date_time+.dart';
import 'package:sigppang_e/presentation/util/sigppang_e_logo_builder.dart';
import 'package:table_calendar/table_calendar.dart';

final _readyLogo = SigppangELogoBuilder.buildReadyLogo(size: Sizes.calendarDayLogoSize);
final _doneLogo = SigppangELogoBuilder.buildDoneLogo(size: Sizes.calendarDayLogoSize);
final _unfinishedLogo = SigppangELogoBuilder.buildUnfinishedLogo(size: Sizes.calendarDayLogoSize);

final class SigppangECalendarBuilders extends CalendarBuilders {
  final Map<CustomDateTime, double> _events;

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
  };

  @override
  FocusedDayBuilder? get todayBuilder => (BuildContext context, DateTime day, DateTime focusedDay) {
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
  };

  @override
  FocusedDayBuilder? get defaultBuilder => (BuildContext context, DateTime day, DateTime focusedDay) {
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
  };

  @override
  FocusedDayBuilder? get outsideBuilder => (BuildContext context, DateTime day, DateTime focusedDay) {
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
  };

  Widget _buildIcon(DateTime day) {
    final progressOfDayWork = _events[CustomDateTime.from(day)];
    if (progressOfDayWork != null) {
      if (progressOfDayWork < 1.0 && day.isBeforeToNow()) return _unfinishedLogo;
      if (progressOfDayWork == 1.0) return _doneLogo;
      return ShaderMask(
        shaderCallback: (rect) => LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [Colors.white, Colors.transparent],
          stops: [progressOfDayWork , 1.0],
        ).createShader(rect),
        blendMode: BlendMode.softLight,
        child: _doneLogo,
      );
    } else {
      return _readyLogo;
    }
  }

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
    required Map<CustomDateTime, double> events,
  }) : _events = events;
}
