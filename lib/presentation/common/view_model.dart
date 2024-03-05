import 'dart:async';
import 'package:sigppang_e/presentation/common/activity_tracker.dart';
import 'package:sigppang_e/presentation/common/screen_action.dart';

abstract class ViewModel<T extends ScreenAction> {
  final ActivityTracker activityTracker;

  Stream<bool> get isLoadingStream => activityTracker.isInactivity;

  ViewModel({
    required this.activityTracker,
  });

  initState() {}

  dispose() {
    activityTracker.dispose();
  }

  act(T action);
}