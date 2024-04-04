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

typedef ToDoListByDate = Map<CustomDateTime, List<ToDo>>;
typedef StatusByDate = Map<CustomDateTime, DailyStatus>;
typedef CalendarItem = ({CalendarState calendarState, StatusByDate statusByDate});

final class CalendarViewModel extends ViewModel<CalendarScreenAction> {
  final FirebaseToDoReadUseCase _readUseCase;
  final BehaviorSubject<CalendarState> _calendarState;
  final BehaviorSubject<ToDoListByDate> _toDoListByDate;

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
        (selectedDate, Map<CustomDateTime, List<ToDo>> toDoMap) => toDoMap[CustomDateTime.from(selectedDate)] ?? [],
      );

  @override
  initState() {
    super.initState();
    _readUseCase.execute(query: null).listen(_toDoListByDate.add);
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
            break;
          case UpdateToDo():
            break;
          case DeleteToDo():
            break;
        }
      },
    );
  }

  @override
  dispose() {
    super.dispose();
    _calendarState.close();
    _toDoListByDate.close();
  }

  CalendarViewModel({
    required FirebaseToDoReadUseCase readUseCase,
  })  : _readUseCase = readUseCase,
        _calendarState = BehaviorSubject.seeded(CalendarState.init()),
        _toDoListByDate = BehaviorSubject.seeded({});
}
