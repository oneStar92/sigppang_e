import 'package:sigppang_e/domain/model/to_do.dart';

abstract interface class ToDoRepository {
  Stream<List<ToDo>> readAll();
  Future<void> create(ToDo toDo);
  Future<void> update(ToDo toDo);
  Future<void> delete(ToDo toDo);
}
