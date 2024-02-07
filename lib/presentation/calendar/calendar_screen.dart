import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';
import 'package:sigppang_e/presentation/calendar/widgets/sigppang_e_calendar.dart';
import 'package:sigppang_e/presentation/calendar/widgets/to_do_item.dart';

final class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SigppangECalendar(),
          SizedBox(height: Sizes.defaultPaddingOfHeight * 2),
          ToDoList(title: 'To Do'),
        ],
      ),
    );
  }
}
