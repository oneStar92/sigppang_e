import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';
import 'package:sigppang_e/domain/model/to_do.dart';
import 'package:sigppang_e/presentation/calendar/calednar_view_model.dart';
import 'package:sigppang_e/presentation/calendar/widgets/sigppang_e_calendar.dart';
import 'package:sigppang_e/presentation/calendar/widgets/to_do_item.dart';
import 'package:sigppang_e/presentation/common/base_view.dart';
import 'package:sigppang_e/presentation/util/sigppang_e_logo_builder.dart';

final class CalendarScreen extends BaseView<CalendarViewModel> {
  const CalendarScreen({
    super.key,
    required super.viewModel,
  });

  @override
  BaseViewState<CalendarViewModel, CalendarScreen> createState() => _CalendarScreenState();
}

final class _CalendarScreenState extends BaseViewState<CalendarViewModel, CalendarScreen> {
  @override
  Widget createBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildCalendarTitle(),
          SizedBox(height: Sizes.defaultPaddingOfHeight),
          _buildCalendar(),
          SizedBox(height: Sizes.defaultPaddingOfHeight * 2),
          _buildToDoTitle(),
          SizedBox(height: Sizes.defaultPaddingOfHeight),
          _buildToDoList(),
        ],
      ),
    );
  }

  Widget _buildCalendarTitle() {
    final size = Sizes.calendarHeaderSize;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Row(
        children: [
          StreamBuilder(
            stream: viewModel.title,
            builder: (context, snapshot) {
              return Text(
                snapshot.data ?? '',
                style: TextStyles.calendarHeaderTextStyle,
              );
            },
          ),
          IconButton(
            onPressed: () => viewModel.act(CalendarScreenAction.changeFormat()),
            icon: StreamBuilder(
              stream: viewModel.isMonthFormat,
              builder: (_, snapshot) {
                if (!snapshot.hasData) return const Icon(Icons.unfold_less);
                return snapshot.requireData ? const Icon(Icons.unfold_less) : const Icon(Icons.unfold_more);
              },
            ),
            padding: EdgeInsets.zero,
            iconSize: size.height * 0.7,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return StreamBuilder(
      stream: viewModel.calendar,
      builder: (context, snapshot) {
        final defaultIcon = SigppangELogoBuilder.build(
          size: Sizes.calendarDayLogoSize,
          state: ToDoState.ready,
        );
        final doneIcon = SigppangELogoBuilder.build(size: Sizes.calendarDayLogoSize);
        final unfinishedIcon = SigppangELogoBuilder.build(
          size: Sizes.calendarDayLogoSize,
          state: ToDoState.unfinished,
        );

        if (!snapshot.hasData) {
          return SigppangECalendar(
            events: LinkedHashMap(),
            defaultIcon: defaultIcon,
            doneIcon: doneIcon,
            unfinishedIcon: unfinishedIcon,
          );
        }
        return SigppangECalendar(
          focusedDay: snapshot.requireData.focusedDay,
          selectedDay: snapshot.requireData.selectedDay,
          format: snapshot.requireData.format,
          onPageChanged: (date) => viewModel.act(CalendarScreenAction.onPageChanged(date)),
          onDaySelected: (date) => viewModel.act(CalendarScreenAction.onDateSelected(date)),
          events: snapshot.requireData.eventsMap,
          defaultIcon: defaultIcon,
          doneIcon: doneIcon,
          unfinishedIcon: unfinishedIcon,
        );
      },
    );
  }

  Widget _buildToDoTitle() {
    final size = Sizes.toDoTitleSize;
    return SizedBox(
      height: size.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('To Do', style: TextStyles.toDoListTitleTextStyle),
          SizedBox(width: Sizes.defaultPaddingOfWidth),
          IconButton(
            onPressed: () => viewModel.act(CalendarScreenAction.addToDo()),
            icon: const Icon(Icons.add),
            padding: EdgeInsets.zero,
            iconSize: size.height * 0.7,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildToDoList() {
    return StreamBuilder(
      stream: viewModel.toDoList,
      builder: (context, snapshot) {
        return ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemCount: snapshot.hasData ? snapshot.requireData.length : 0,
          itemBuilder: (context, index) {
            if (!snapshot.hasData) return null;
            return ToDoItem(
              controller: TextEditingController(text: snapshot.requireData[index].title),
              checkBoxIcon: SigppangELogoBuilder.build(
                size: Sizes.toDoItemLogoSize,
                state: snapshot.requireData[index].toDoState,
              ),
              onChecked: () {},
              onSaved: () {},
              onDeleted: () {},
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: Sizes.separatorHeight,
              color: Colors.transparent,
            );
          },
        );
      },
    );
  }
}
