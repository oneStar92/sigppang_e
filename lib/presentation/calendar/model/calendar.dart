import 'dart:collection';

import 'package:sigppang_e/domain/model/to_do.dart';
import 'package:table_calendar/table_calendar.dart';

final class Calendar {
  final DateTime focusedDay;
  final DateTime selectedDay;
  final CalendarFormat format;
  final LinkedHashMap<DateTime, List<ToDo>> eventsMap;

  Calendar({
    required this.focusedDay,
    required this.selectedDay,
    required this.format,
    required this.eventsMap,
  });
}
