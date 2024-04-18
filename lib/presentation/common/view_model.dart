import 'dart:async';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sigppang_e/presentation/util/activity_tracker.dart';
import 'package:sigppang_e/presentation/common/screen_action.dart';

abstract class ViewModel<T extends ScreenAction> {
  final ActivityTracker activityTracker;
  final StreamController<T> _actionController = StreamController<T>.broadcast();
  late final Stream<String> versionStream;

  Stream<bool> get isLoadingStream => activityTracker.isInactivity;

  Stream<T> get actionStream => _actionController.stream;

  ViewModel({
    required this.activityTracker,
  });

  initState() {
    versionStream = PackageInfo.fromPlatform().then((value) => value.version).asStream();
  }

  dispose() {
    activityTracker.dispose();
    _actionController.close();
  }

  act(T action) => _actionController.add(action);
}
