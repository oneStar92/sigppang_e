import 'package:sigppang_e/domain/model/custom_date_time.dart';

final class Calendar {
  final DateTime focusedDay;
  final DateTime selectedDay;
  final bool isMonthFormat;
  final Map<CustomDateTime, double> eventsMap;

  Calendar({
    required this.focusedDay,
    required this.selectedDay,
    required this.isMonthFormat,
    required this.eventsMap,
  });
}
