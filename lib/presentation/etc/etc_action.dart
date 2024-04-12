import 'package:sigppang_e/presentation/common/screen_action.dart';

sealed class ETCScreenAction with ScreenAction {
  factory ETCScreenAction.logout() = Logout;

  factory ETCScreenAction.signIn() = SingIn;

  factory ETCScreenAction.signOut() = SignOut;
}

final class Logout implements ETCScreenAction {}

final class SingIn implements ETCScreenAction {}

final class SignOut implements ETCScreenAction {}
