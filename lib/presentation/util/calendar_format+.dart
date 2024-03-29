import 'package:table_calendar/table_calendar.dart';

extension CalednarSwap on CalendarFormat {
  CalendarFormat swap() {
    switch (this) {
      case CalendarFormat.month:
        return CalendarFormat.week;
      case CalendarFormat.twoWeeks:
        return this;
      case CalendarFormat.week:
        return CalendarFormat.month;
    }
  }
}