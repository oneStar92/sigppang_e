import 'package:sigppang_e/domain/use_case/firebase_logout_use_case.dart';
import 'package:sigppang_e/domain/use_case/firebase_sign_out_use_case.dart';
import 'package:sigppang_e/presentation/common/screen_action.dart';
import 'package:sigppang_e/presentation/common/view_model.dart';
import 'package:sigppang_e/presentation/util/activity_tracker.dart';
import 'package:sigppang_e/presentation/util/auth_notifier.dart';

sealed class ETCScreenAction with ScreenAction {
  factory ETCScreenAction.logout() = Logout;

  factory ETCScreenAction.login() = Login;

  factory ETCScreenAction.signOut() = SignOut;
}

final class Logout implements ETCScreenAction {}

final class Login implements ETCScreenAction {}

final class SignOut implements ETCScreenAction {}

final class ETCViewModel extends ViewModel<ETCScreenAction> {
  final FirebaseLogoutUseCase _logoutUseCase;
  final FirebaseSignOutUseCase _signOutUseCase;
  
  String get email => AuthNotifier.instance.currentUser?.email ?? 'Guest';
  
  bool get isGuest => AuthNotifier.instance.currentUser == null ? true : false;
  
  @override
  initState() {
    super.initState();
    
    actionStream.listen((event) {
      switch (event) {
        case Logout():
          _logoutUseCase.execute(query: null).trackActivity(activityTracker);
          break;
        case Login():
          break;
        case SignOut():
          _signOutUseCase.execute(query: null).trackActivity(activityTracker);
          break;
      }
    });
  }

  ETCViewModel({
    required FirebaseLogoutUseCase logoutUseCase,
    required FirebaseSignOutUseCase signOutUseCase,
  })  : _logoutUseCase = logoutUseCase,
        _signOutUseCase = signOutUseCase;
}