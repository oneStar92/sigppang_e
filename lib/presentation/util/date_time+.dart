extension IsBeforeToNow on DateTime {
  bool isBeforeToNow() => isBefore(
        DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
        ),
      );
}
