import 'package:sigppang_e/domain/model/to_do.dart';

final class ToDoMapper {
  static ToDo fromDocument(Map<String, Object?> json, String id) {
    final toDoJson = json;
    toDoJson['id'] = id;
    return ToDo.fromJson(toDoJson);
  }

  static Map<String, Object?> toDocument(ToDo toDo) {
    return toDo.toJson()..remove('id');
  }
}