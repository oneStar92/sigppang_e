import 'package:rxdart/rxdart.dart';
import 'package:sigppang_e/domain/model/result.dart';
import 'package:sigppang_e/domain/use_case/firebase_apple_login_use_case.dart';
import 'package:sigppang_e/domain/use_case/firebase_google_login_use_case.dart';
import 'package:sigppang_e/domain/use_case/guest_login_use_case.dart';
import 'package:sigppang_e/presentation/common/screen_action.dart';
import 'package:sigppang_e/presentation/common/view_model.dart';
import 'package:sigppang_e/presentation/util/activity_tracker.dart';

sealed class LoginScreenAction with ScreenAction {
  factory LoginScreenAction.googleLogin() = GoogleLogin;

  factory LoginScreenAction.appleLogin() = AppleLogin;

  factory LoginScreenAction.guestLogin() = GuestLogin;
}

final class GoogleLogin implements LoginScreenAction {}

final class AppleLogin implements LoginScreenAction {}

final class GuestLogin implements LoginScreenAction {}

final class LoginViewModel extends ViewModel<LoginScreenAction> {
  final FirebaseGoogleLoginUseCase _googleLoginUseCase;
  final FirebaseAppleLoginUseCase _appleLoginUseCase;
  final GuestLoginUseCase _guestLoginUseCase;

  LoginViewModel({
    required FirebaseGoogleLoginUseCase googleLoginUseCase,
    required FirebaseAppleLoginUseCase appleLoginUseCase,
    required GuestLoginUseCase guestLoginUseCase,
  })  : _googleLoginUseCase = googleLoginUseCase,
        _appleLoginUseCase = appleLoginUseCase,
        _guestLoginUseCase = guestLoginUseCase;

  @override
  initState() {
    super.initState();

    actionStream.listen((event) {
      switch (event) {
        case GoogleLogin():
          _googleLoginUseCase.execute().trackActivity(activityTracker);
          break;
        case AppleLogin():
          _appleLoginUseCase.execute().trackActivity(activityTracker);
          break;
        case GuestLogin():
          _guestLoginUseCase.execute();
          break;
      }
    });
  }
}
