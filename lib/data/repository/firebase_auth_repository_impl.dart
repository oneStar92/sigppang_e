import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:sigppang_e/domain/repository/auth_repository.dart';
import 'package:sigppang_e/presentation/util/auth_notifier.dart';

final class FirebaseAuthRepositoryImpl implements AuthRepository {
  static final FirebaseAuthRepositoryImpl instance = FirebaseAuthRepositoryImpl._internal();

  factory FirebaseAuthRepositoryImpl() => instance;

  FirebaseAuthRepositoryImpl._internal();

  @override
  Future<void> googleLogin() async {
    final account = await GoogleSignIn().signIn();

    if (account != null) {
      final GoogleSignInAuthentication authentication = await account.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken,
      );

      return FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) => value.user != null ? Future.value(null) : Future.error(Error()));
    }
    return Future.error(Error());
  }

  @override
  Future<void> appleLogin() async {
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
      ],
    );

    final credential = OAuthProvider('apple.com').credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );

    return FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) => value.user != null ? Future.value() : Future.error(Error()));
  }

  @override
  Future<void> logout() {
    return FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> signOut() async {
    return AuthNotifier.instance.currentUser?.delete();
  }
}
