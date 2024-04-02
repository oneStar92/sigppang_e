import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/constants.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';
import 'package:sigppang_e/presentation/calendar/calendar_view_model.dart';
import 'package:sigppang_e/presentation/calendar/widgets/to_do_item.dart';
import 'package:sigppang_e/presentation/common/base_view.dart';
import 'package:sigppang_e/presentation/util/sigppang_e_calendar_builders.dart';
import 'package:sigppang_e/presentation/util/sigppang_e_logo_builder.dart';
import 'package:table_calendar/table_calendar.dart';

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
                return snapshot.data ?? true ? const Icon(Icons.unfold_less) : const Icon(Icons.unfold_more);
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
        return TableCalendar(
          locale: defaultLocale,
          focusedDay: snapshot.data?.focusedDay ?? DateTime.now(),
          calendarFormat: snapshot.data?.isMonthFormat ?? true ? CalendarFormat.month : CalendarFormat.week,
          firstDay: DateTime(1970, 1, 1),
          lastDay: DateTime(2099, 12, 31),
          headerVisible: false,
          daysOfWeekHeight: Sizes.dayOfWeekSize.height,
          rowHeight: Sizes.calendarRowSize.height,
          availableGestures: AvailableGestures.horizontalSwipe,
          selectedDayPredicate: (day) => isSameDay(day, snapshot.data?.selectedDay ?? DateTime.now()),
          calendarBuilders: SigppangECalendarBuilders(events: snapshot.data?.eventsMap ?? {}),
          onPageChanged: (date) => viewModel.act(CalendarScreenAction.onPageChanged(date)),
          onDaySelected: (date, _) => viewModel.act(CalendarScreenAction.onDateSelected(date)),
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
          itemCount: snapshot.data?.length ?? 0,
          itemBuilder: (context, index) {
            if (!snapshot.hasData) return null;
            return ToDoItem(
              controller: TextEditingController(text: snapshot.data?[index].title),
              checkBoxIcon: snapshot.data?[index].isDone ?? false
                  ? SigppangELogoBuilder.buildDoneLogo(size: Sizes.toDoItemLogoSize)
                  : SigppangELogoBuilder.buildReadyLogo(size: Sizes.toDoItemLogoSize),
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
