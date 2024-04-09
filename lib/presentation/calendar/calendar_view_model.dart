import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sigppang_e/domain/model/to_do.dart';
import 'package:sigppang_e/domain/model/custom_date_time.dart';
import 'package:sigppang_e/domain/model/daily_status.dart';
import 'package:sigppang_e/domain/use_case/firebase_to_do_read_use_case.dart';
import 'package:sigppang_e/presentation/calendar/model/calendar_state.dart';
import 'package:sigppang_e/presentation/common/screen_action.dart';
import 'package:sigppang_e/presentation/common/view_model.dart';
import 'package:sigppang_e/presentation/util/date_time+.dart';

sealed class CalendarScreenAction with ScreenAction {
  factory CalendarScreenAction.onPageChanged(DateTime data) = OnPageChanged;

  factory CalendarScreenAction.onDateSelected(DateTime data) = OnDateSelected;

  factory CalendarScreenAction.changeFormat() = ChangeFormat;

  factory CalendarScreenAction.addToDo() = AddToDo;

  factory CalendarScreenAction.delete(ToDo toDo) = Delete;
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

final class Delete implements CalendarScreenAction {
  final ToDo toDo;

  Delete(this.toDo);
}

typedef ToDoListByDate = Map<CustomDateTime, List<ToDo>>;
typedef StatusByDate = Map<CustomDateTime, DailyStatus>;
typedef CalendarItem = ({CalendarState calendarState, StatusByDate statusByDate});

final class CalendarViewModel extends ViewModel<CalendarScreenAction> {
  final FirebaseToDoReadUseCase _readUseCase;
  final BehaviorSubject<CalendarState> _calendarState;
  final BehaviorSubject<List<ToDo>> _toDoList;

  Stream<ToDoListByDate> get _toDoListByDate => _toDoList.map(
        (toDoList) {
          return toDoList.fold(
            <CustomDateTime, List<ToDo>>{},
            (previousValue, element) => previousValue
              ..update(
                CustomDateTime.from(element.createdAt),
                (value) => value..add(element),
                ifAbsent: () => [element],
              ),
          );
        },
      );

  Stream<Map<CustomDateTime, DailyStatus>> get _statusByDate => _toDoListByDate.map(
        (toDoListByDate) {
          return toDoListByDate.map(
            (date, toDoList) {
              if (toDoList.isEmpty) return MapEntry(date, DailyStatus.ready());
              final progress = toDoList.where((toDo) => toDo.isDone).length / toDoList.length;
              if (progress == 1) return MapEntry(date, DailyStatus.done());
              if (date.isBeforeToNow()) return MapEntry(date, DailyStatus.unfinished());
              return MapEntry(date, DailyStatus.inProgress(progress));
            },
          );
        },
      );

  Stream<CalendarItem> get calendarItem => Rx.combineLatest2(
        _calendarState,
        _statusByDate,
        (calendarState, statusByDate) => (calendarState: calendarState, statusByDate: statusByDate),
      );

  Stream<String> get title => _calendarState.map((state) => '${state.focusedDay.year}년 ${state.focusedDay.month}월');

  Stream<bool> get isMonthFormat => _calendarState.map((state) => state.isMonthFormat);

  Stream<List<ToDo>> get selectedToDoList => Rx.combineLatest2(
        _calendarState.map((state) => state.selectedDay),
        _toDoListByDate,
        (selectedDate, Map<CustomDateTime, List<ToDo>> toDoMap) =>
            toDoMap[CustomDateTime.from(selectedDate)]?.sorted((a, b) => a.createdAt.compareTo(b.createdAt)) ?? [],
      );

  @override
  initState() {
    super.initState();
    _readUseCase.execute(query: null).listen(_toDoList.add);
    actionStream.listen(
      (event) {
        switch (event) {
          case OnPageChanged():
            _calendarState.add(_calendarState.value.copyWith(focusedDay: event.data));
            break;
          case OnDateSelected():
            _calendarState.add(_calendarState.value.copyWith(focusedDay: event.data, selectedDay: event.data));
            break;
          case ChangeFormat():
            _calendarState.add(
              _calendarState.value.copyWith(
                isMonthFormat: _calendarState.value.isMonthFormat ? false : true,
              ),
            );
            break;
          case AddToDo():
            _toDoList.add(_toDoList.value..add(ToDo.empty(_calendarState.value.selectedDay)));
            break;
          case Delete():
            _toDoList.add(_toDoList.value..remove(event.toDo));
        }
      },
    );
  }

  @override
  dispose() {
    super.dispose();
    _calendarState.close();
    _toDoList.close();
  }

  CalendarViewModel({
    required FirebaseToDoReadUseCase readUseCase,
  })  : _readUseCase = readUseCase,
        _toDoList = BehaviorSubject.seeded([]),
        _calendarState = BehaviorSubject.seeded(CalendarState.init());
}
