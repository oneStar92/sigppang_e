import 'package:sigppang_e/presentation/common/screen_action.dart';

sealed class LoginScreenAction with ScreenAction {
  factory LoginScreenAction.googleLogin() = GoogleLogin;

  factory LoginScreenAction.appleLogin() = AppleLogin;

  factory LoginScreenAction.guestLogin() = GuestLogin;
}

final class GoogleLogin implements LoginScreenAction {}

final class AppleLogin implements LoginScreenAction {}

final class GuestLogin implements LoginScreenAction {}
