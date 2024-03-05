import 'package:sigppang_e/presentation/common/view_model.dart';
import 'package:sigppang_e/presentation/login/model/login_screen_action.dart';

final class LoginViewModel extends ViewModel<LoginScreenAction> {
  LoginViewModel({
    required super.activityTracker,
  });

  @override
  act(LoginScreenAction action) {
    switch (action) {
      case GoogleLogin():
        _googleLogin();
      case AppleLogin():
        _appleLogin();
      case GuestLogin():
        _guestLogin();
    }
  }

  _googleLogin() {}

  _appleLogin() {}

  _guestLogin() {}
}
