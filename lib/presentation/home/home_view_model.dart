import 'package:sigppang_e/presentation/common/screen_action.dart';
import 'package:sigppang_e/presentation/common/view_model.dart';

sealed class HomeScreenAction with ScreenAction {}

final class HomeViewModel extends ViewModel<HomeScreenAction> {
  HomeViewModel({required super.activityTracker});
}