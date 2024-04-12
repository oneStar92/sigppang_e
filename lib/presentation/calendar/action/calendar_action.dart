import 'package:sigppang_e/domain/model/to_do.dart';
import 'package:sigppang_e/presentation/common/screen_action.dart';

sealed class CalendarScreenAction with ScreenAction {
  factory CalendarScreenAction.onPageChanged(DateTime data) = OnPageChanged;

  factory CalendarScreenAction.onDateSelected(DateTime data) = OnDateSelected;

  factory CalendarScreenAction.changeFormat() = ChangeFormat;

  factory CalendarScreenAction.addToDo() = AddToDo;

  factory CalendarScreenAction.delete(ToDo toDo) = Delete;

  factory CalendarScreenAction.guestLogout() = SignIn;
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

final class SignIn implements CalendarScreenAction {}
