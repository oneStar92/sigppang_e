import 'package:sigppang_e/presentation/common/screen_action.dart';

sealed class ToDoItemAction with ScreenAction {
  factory ToDoItemAction.changeTitle(String title) = ChangeTitle;

  factory ToDoItemAction.changeStatus() = ChangeStatus;

  factory ToDoItemAction.save() = Save;

  factory ToDoItemAction.delete() = Delete;
}

final class ChangeTitle implements ToDoItemAction {
  final String title;

  ChangeTitle(this.title);
}

final class ChangeStatus implements ToDoItemAction {
  ChangeStatus();
}

final class Save implements ToDoItemAction {
  Save();
}

final class Delete implements ToDoItemAction {
  Delete();
}
