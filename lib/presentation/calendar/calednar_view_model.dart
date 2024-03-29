import 'dart:collection';
import 'package:rxdart/rxdart.dart';
import 'package:sigppang_e/domain/model/to_do.dart';
import 'package:sigppang_e/presentation/calendar/model/calendar.dart';
import 'package:sigppang_e/presentation/common/screen_action.dart';
import 'package:sigppang_e/presentation/common/view_model.dart';
import 'package:sigppang_e/presentation/util/calendar_format+.dart';
import 'package:table_calendar/table_calendar.dart';

sealed class CalendarScreenAction with ScreenAction {
  factory CalendarScreenAction.onPageChanged(DateTime data) = OnPageChanged;

  factory CalendarScreenAction.onDateSelected(DateTime data) = OnDateSelected;

  factory CalendarScreenAction.changeFormat() = ChangeFormat;

  factory CalendarScreenAction.addToDo() = AddToDo;

  factory CalendarScreenAction.updateToDo(int index, String title, bool isDone) = UpdateToDo;

  factory CalendarScreenAction.deleteToDo(int data) = DeleteToDo;
}

final class OnPageChanged implements CalendarScreenAction {
  final DateTime data;

  OnPageChanged(this.data);
}

final class OnDateSelected implements CalendarScreenAction {
  final DateTime data;

  OnDateSelected(this.data);
}

final class ChangeFormat implements CalendarScreenAction {}

final class AddToDo implements CalendarScreenAction {}

final class UpdateToDo implements CalendarScreenAction {
  final int index;
  final String title;
  final bool isDone;

  UpdateToDo(this.index, this.title, this.isDone);
}

final class DeleteToDo implements CalendarScreenAction {
  final int data;

  DeleteToDo(this.data);
}

final class CalendarViewModel extends ViewModel<CalendarScreenAction> {
  final BehaviorSubject<DateTime> _focusedDay = BehaviorSubject.seeded(DateTime.now());
  final BehaviorSubject<DateTime> _selectedDay = BehaviorSubject.seeded(DateTime.now());
  final BehaviorSubject<CalendarFormat> _format = BehaviorSubject.seeded(CalendarFormat.month);
  final BehaviorSubject<LinkedHashMap<DateTime, List<ToDo>>> _toDoMap = BehaviorSubject.seeded(
    LinkedHashMap(
      equals: isSameDay,
      hashCode: _makeHashCode,
    )
  );

  Stream<Calendar> get calendar => Rx.combineLatest4(
        _focusedDay,
        _selectedDay,
        _format,
        _toDoMap,
        (focusedDay, selectedDay, format, toDoMap) => Calendar(
          focusedDay: focusedDay,
          selectedDay: selectedDay,
          format: format,
          eventsMap: toDoMap,
        ),
      );

  Stream<String> get title => _focusedDay.map((event) => '${event.year}년 ${event.month}월');

  Stream<bool> get isMonthFormat => _format.map((event) => event == CalendarFormat.month);

  Stream<List<ToDo>> get toDoList => Rx.combineLatest2(
        _selectedDay,
        _toDoMap,
        (selectedDate, LinkedHashMap<DateTime, List<ToDo>> toDoMap) {
          return toDoMap[selectedDate] ?? [];
        },
      );

  @override
  initState() {
    super.initState();

    actionStream.listen(
      (event) {
        switch (event) {
          case OnPageChanged():
            _focusedDay.add(event.data);
            break;
          case OnDateSelected():
            _focusedDay.add(event.data);
            _selectedDay.add(event.data);
            break;
          case ChangeFormat():
            _format.add(_format.value.swap());
            break;
          case AddToDo():
            _toDoMap.add(
              _toDoMap.value
                ..update(
                  _selectedDay.value,
                  (events) => events..add(ToDo(title: '')),
                  ifAbsent: () => [ToDo(title: '')],
                ),
            );
            break;
          case UpdateToDo():
            break;
          case DeleteToDo():
            _toDoMap.add(
              _toDoMap.value
                ..update(
                  _selectedDay.value,
                  (events) => events..removeAt(event.data),
                ),
            );
            break;
        }
      },
    );
  }

  @override
  dispose() {
    super.dispose();

    _format.close();
    _selectedDay.close();
    _focusedDay.close();
  }

  static int _makeHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }
}
