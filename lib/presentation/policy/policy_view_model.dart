import 'package:sigppang_e/presentation/common/screen_action.dart';
import 'package:sigppang_e/presentation/common/view_model.dart';

sealed class PolicyScreenAction with ScreenAction {}

final class PolicyViewModel extends ViewModel<PolicyScreenAction> {
  final String _title;
  final String _policy;
  
  String get title => _title;
  
  String get policy => _policy;

  PolicyViewModel({
    required super.activityTracker,
    required String title,
    required String policy,
  })  : _title = title,
        _policy = policy;
}
