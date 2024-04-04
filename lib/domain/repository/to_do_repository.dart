import 'package:sigppang_e/domain/model/to_do.dart';

abstract interface class ToDoRepository {
  Stream<List<ToDo>> readAll();
}
