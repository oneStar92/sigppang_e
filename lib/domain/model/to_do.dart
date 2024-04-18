import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:sigppang_e/domain/util/timestamp_converter.dart';

part 'to_do.freezed.dart';

part 'to_do.g.dart';

@freezed
class ToDo with _$ToDo {
  const factory ToDo({
    String? id,
    required String title,
    required bool isDone,
    @TimestampConverter() required DateTime date,
    @TimestampConverter() required DateTime createdAt,
  }) = _ToDo;

  factory ToDo.create(DateTime date) => ToDo(title: '', isDone: false, date: date, createdAt: DateTime.now());

  factory ToDo.fromJson(Map<String, Object?> json) => _$ToDoFromJson(json);
}
