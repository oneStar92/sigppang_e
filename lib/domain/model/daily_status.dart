sealed class DailyStatus {
  factory DailyStatus.ready() = Ready;

  factory DailyStatus.inProgress(double progress) = InProgress;

  factory DailyStatus.done() = Done;

  factory DailyStatus.unfinished() = Unfinished;
}

class Ready implements DailyStatus {
  Ready();
}

class InProgress implements DailyStatus {
  final double progress;

  InProgress(this.progress);
}

class Done implements DailyStatus {
  Done();
}

class Unfinished implements DailyStatus {
  Unfinished();
}
