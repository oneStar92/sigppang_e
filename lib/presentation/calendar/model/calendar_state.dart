import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'calendar_state.freezed.dart';

@freezed
class CalendarState with _$CalendarState {
  const factory CalendarState({
    required DateTime focusedDay,
    required DateTime selectedDay,
    required bool isMonthFormat,
  }) = _CalendarState;

  factory CalendarState.init() => CalendarState(focusedDay: DateTime.now(), selectedDay: DateTime.now(), isMonthFormat: true);
}