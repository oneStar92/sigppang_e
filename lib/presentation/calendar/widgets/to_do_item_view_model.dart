import 'package:rxdart/rxdart.dart';
import 'package:sigppang_e/domain/model/to_do.dart';
import 'package:sigppang_e/domain/use_case/firebase_to_do_create_use_case.dart';
import 'package:sigppang_e/domain/use_case/firebase_to_do_delete_use_case.dart';
import 'package:sigppang_e/domain/use_case/firebase_to_do_update_use_case.dart';
import 'package:sigppang_e/presentation/calendar/action/to_do_action.dart';

final class ToDoItemViewModel {
  final FirebaseToDoCreateUseCase _createUseCase;
  final FirebaseToDoUpdateUseCase _updateUseCase;
  final FirebaseToDoDeleteUseCase _deleteUseCase;
  final BehaviorSubject<ToDo> _toDo;
  final Function() _unfocusAction;
  final Function(ToDo toDo) _deleteOnMemory;

  ToDoItemViewModel({
    required FirebaseToDoCreateUseCase createUseCase,
    required FirebaseToDoUpdateUseCase updateUseCase,
    required FirebaseToDoDeleteUseCase deleteUseCase,
    required ToDo toDo,
    required Function() unfocusAction,
    required Function(ToDo toDo) deleteOnMemory,
  })  : _createUseCase = createUseCase,
        _updateUseCase = updateUseCase,
        _deleteUseCase = deleteUseCase,
        _toDo = BehaviorSubject.seeded(toDo),
        _unfocusAction = unfocusAction,
        _deleteOnMemory = deleteOnMemory;

  ToDo get toDo => _toDo.value;

  String get title => _toDo.value.title;

  Stream<bool> get isDone => _toDo.map((toDo) => toDo.isDone);

  act(ToDoItemAction action) {
    switch (action) {
      case ChangeTitle():
        _toDo.add(_toDo.value.copyWith(title: action.title));
        break;
      case ChangeStatus():
        if (toDo.title.isNotEmpty) {
          if (toDo.id == null) {
            _createUseCase.execute(query: toDo.copyWith(isDone: _toDo.value.isDone ? false : true));
          } else {
            _updateUseCase.execute(query: toDo.copyWith(isDone: _toDo.value.isDone ? false : true));
          }
          _unfocusAction();
        }
        break;
      case Save():
        if (toDo.title.isEmpty && toDo.id == null) {
          _deleteOnMemory(toDo);
        } else if (toDo.title.isEmpty && toDo.id != null) {
          _deleteUseCase.execute(query: toDo);
          _unfocusAction();
        } else if (toDo.title.isNotEmpty && toDo.id == null) {
          _createUseCase.execute(query: toDo);
          _unfocusAction();
        } else {
          _updateUseCase.execute(query: toDo);
          _unfocusAction();
        }
        break;
      case Delete():
        if (toDo.id != null) {
          _deleteUseCase.execute(query: toDo);
          _unfocusAction();
        } else {
          _deleteOnMemory(toDo);
        }
        break;
    }
  }
}
