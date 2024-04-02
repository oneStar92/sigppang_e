import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'to_do.freezed.dart';

part 'to_do.g.dart';

@freezed
class ToDo with _$ToDo {
  const factory ToDo({
    required String title,
    required bool isDone,
  }) = _ToDo;
  
  factory ToDo.fromJson(Map<String, Object?> json) => _$ToDoFromJson(json); 
}