import 'package:rxdart/rxdart.dart';

final class ActivityTracker {
  final _inactivity = BehaviorSubject<bool>.seeded(true);

  Stream<bool> get isInactivity => _inactivity.stream;

  Future<T> _trackActivity<T, U extends Future<T>>(U source) {
    _load();
    return source.whenComplete(() => _done());
  }

  _load() {
    _inactivity.sink.add(false);
  }

  _done() {
    _inactivity.sink.add(true);
  }

  dispose() {
    _inactivity.close();
  }
}

extension TrackActivity<T> on Future<T> {
  Future<T> trackActivity(ActivityTracker activityTracker) {
    return activityTracker._trackActivity(this);
  }
}