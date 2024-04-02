final class CustomDateTime extends DateTime {
  CustomDateTime(super.year, super.month, super.day);

  @override
  int get hashCode => day * 1000000 + month * 10000 + year;

  @override
  bool operator ==(covariant DateTime other) => _isSameDay(this, other);

  factory CustomDateTime.from(DateTime dateTime) {
    return CustomDateTime(dateTime.year, dateTime.month, dateTime.day);
  }
}

bool _isSameDay(DateTime? a, DateTime? b) {
  if (a == null || b == null) {
    return false;
  }

  return a.year == b.year && a.month == b.month && a.day == b.day;
}