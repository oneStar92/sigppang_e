import 'package:rxdart/rxdart.dart';
import 'package:sigppang_e/domain/model/to_do.dart';
import 'package:sigppang_e/domain/model/custom_date_time.dart';
import 'package:sigppang_e/presentation/calendar/model/calendar.dart';
import 'package:sigppang_e/presentation/common/screen_action.dart';
import 'package:sigppang_e/presentation/common/view_model.dart';

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
  final BehaviorSubject<bool> _isMonthFormat = BehaviorSubject.seeded(true);
  final BehaviorSubject<Map<CustomDateTime, List<ToDo>>> _toDoMap = BehaviorSubject.seeded({});

  Stream<Calendar> get calendar => Rx.combineLatest4(
        _focusedDay,
        _selectedDay,
    _isMonthFormat,
        _toDoMap.map(
          (event) => event.map(
            (key, value) => MapEntry(
              key,
              value.where((element) => element.isDone).length / value.length,
            ),
          ),
        ),
        (focusedDay, selectedDay, isMonthFormat, toDoMap) => Calendar(
          focusedDay: focusedDay,
          selectedDay: selectedDay,
          isMonthFormat: isMonthFormat,
          eventsMap: toDoMap,
        ),
      );

  Stream<String> get title => _focusedDay.map((event) => '${event.year}년 ${event.month}월');

  Stream<bool> get isMonthFormat => _isMonthFormat;

  Stream<List<ToDo>> get toDoList => Rx.combineLatest2(
        _selectedDay,
        _toDoMap,
        (selectedDate, Map<CustomDateTime, List<ToDo>> toDoMap) {
          return toDoMap[CustomDateTime.from(selectedDate)] ?? [];
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
            _isMonthFormat.add(_isMonthFormat.value ? false : true);
            break;
          case AddToDo():
            _toDoMap.add(
              _toDoMap.value
                ..update(
                  CustomDateTime.from(_selectedDay.value),
                  (events) => events..add(ToDo(title: '', isDone: false)),
                  ifAbsent: () => [ToDo(title: '', isDone: false)],
                ),
            );
            break;
          case UpdateToDo():
            break;
          case DeleteToDo():
            _toDoMap.add(
              _toDoMap.value
                ..update(
                   CustomDateTime.from(_selectedDay.value),
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

    _isMonthFormat.close();
    _selectedDay.close();
    _focusedDay.close();
  }
}
