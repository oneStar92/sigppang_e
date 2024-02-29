import 'dart:async';
import 'package:sigppang_e/presentation/common/activity_tracker.dart';

abstract class ViewModel {
  final ActivityTracker activityTracker;

  Stream<bool> get isLoadingStream => activityTracker.isInactivity;

  ViewModel({
    required this.activityTracker,
  });

  initState() {}

  dispose() {
    activityTracker.dispose();
  }
}