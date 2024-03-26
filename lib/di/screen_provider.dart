import 'package:sigppang_e/data/repository/firebase_apple_auth_repository_impl.dart';
import 'package:sigppang_e/data/repository/firebase_google_auth_repository_impl.dart';
import 'package:sigppang_e/domain/use_case/firebase_apple_login_use_case.dart';
import 'package:sigppang_e/domain/use_case/firebase_google_login_use_case.dart';
import 'package:sigppang_e/presentation/home/home_screen.dart';
import 'package:sigppang_e/presentation/login/login_screen.dart';
import 'package:sigppang_e/presentation/login/login_view_model.dart';

final class ScreenProvider {
  ScreenProvider._internal();

  static LoginScreen buildLoginScreen() {
    final googleAuthRepository = FirebaseGoogleAuthRepositoryImpl();
    final appleAuthRepository = FirebaseAppleAuthRepositoryImpl();
    final googleLoginUseCase = FirebaseGoogleLoginUseCase(firebaseGoogleAuthRepository: googleAuthRepository);
    final appleLoginUseCase = FirebaseAppleLoginUseCase(firebaseAppleAuthRepository: appleAuthRepository);
    final viewModel = LoginViewModel(
      googleLoginUseCase: googleLoginUseCase,
      appleLoginUseCase: appleLoginUseCase,
    );
    return LoginScreen(viewModel: viewModel);
  }

  static HomeScreen buildHomeScreen() {
    return HomeScreen();
  }
}
