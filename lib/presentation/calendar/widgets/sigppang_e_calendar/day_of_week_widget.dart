import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sigppang_e/common/constants/constants.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';

final class DayOfWeek extends StatelessWidget {
  final DateTime _day;

  const DayOfWeek({
    super.key,
    required DateTime day,
  }) : _day = day;

  String get _text => DateFormat.E(defaultLocale).format(_day);

  TextStyle get _textStyle {
    switch (_day.weekday) {
      case DateTime.sunday:
        return TextStyles.sundayTextStyle;
      case DateTime.saturday:
        return TextStyles.saturdayTextStyle;
      default:
        return TextStyles.defaultDayOfWeekTextStyle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _text,
        style: _textStyle,
      ),
    );
  }
}
