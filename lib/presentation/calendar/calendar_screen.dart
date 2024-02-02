import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/presentation/calendar/widgets/sigppang_e_calendar/sigppang_e_calendar_widget.dart';
import 'package:sigppang_e/presentation/calendar/widgets/to_do_list.dart';

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
