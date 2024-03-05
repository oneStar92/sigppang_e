import 'package:sigppang_e/presentation/common/screen_action.dart';

sealed class LoginScreenAction with ScreenAction {}

final class GoogleLogin extends LoginScreenAction {}

final class AppleLogin extends LoginScreenAction {}

final class GuestLogin extends LoginScreenAction {}
