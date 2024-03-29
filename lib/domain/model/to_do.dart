import 'package:sigppang_e/presentation/calendar/widgets/sigppang_e_calendar.dart';

enum ToDoState { ready, done, unfinished }

final class ToDo implements CalendarEvent {
  final String title;
  final ToDoState toDoState;

  ToDo({
    required this.title,
    this.toDoState = ToDoState.ready,
  });

  @override
  bool get isDone => toDoState == ToDoState.done;
}
