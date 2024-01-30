import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sigppang_e/presentation/common/sigppang_e_logo.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/presentation/calendar/widgets/sigppang_e_calendar/sigppang_e_calendar_widget.dart';
import 'package:sigppang_e/presentation/calendar/widgets/to_do_list.dart';

final class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: REdgeInsets.only(left: 16),
          child: SigppangELogo.build(size: Sizes.appbarLogoSize),
        ),
        actions: [PopupMenuButton(itemBuilder: (_) => [])],
      ),
      body: SingleChildScrollView(
        padding: REdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SigppangECalendar(),
            SizedBox(height: 16.h),
            ToDoList(title: 'To Do')
          ],
        ),
      ),
    );
  }
}
