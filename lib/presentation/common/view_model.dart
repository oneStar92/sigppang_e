import 'dart:async';
import 'package:sigppang_e/presentation/util/activity_tracker.dart';
import 'package:sigppang_e/presentation/common/screen_action.dart';

abstract class ViewModel<T extends ScreenAction> {
  final ActivityTracker activityTracker;
  final StreamController<T> _actionController = StreamController<T>.broadcast();

  Stream<bool> get isLoadingStream => activityTracker.isInactivity;

  Stream<T> get actionStream => _actionController.stream;

  ViewModel({
    required this.activityTracker,
  });

  initState() {}

  dispose() {
    activityTracker.dispose();
    _actionController.close();
  }

  act(T action) => _actionController.add(action);
}
