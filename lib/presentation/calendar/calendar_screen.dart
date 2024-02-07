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
          _calendarTitle(),
          SizedBox(height: Sizes.defaultPaddingOfHeight),
          SigppangECalendar(),
          SizedBox(height: Sizes.defaultPaddingOfHeight * 2),
          _toDoTitle(),
          SizedBox(height: Sizes.defaultPaddingOfHeight),
          _toDoList(),
        ],
      ),
    );
  }

  Widget _calendarTitle() {
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
            icon: const Icon(Icons.unfold_less),
            padding: EdgeInsets.zero,
            iconSize: size.height * 0.7,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _toDoTitle() {
    final size = Sizes.toDoTitleSize;
    return SizedBox(
      height: size.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('To Do', style: TextStyles.toDoListTitleTextStyle),
          SizedBox(width: Sizes.defaultPaddingOfWidth),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            padding: EdgeInsets.zero,
            iconSize: size.height * 0.7,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _toDoList() {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ToDoItem();
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: Sizes.separatorHeight,
          color: Colors.transparent,
        );
      },
    );
  }
}
