import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:sigppang_e/domain/repository/auth_repository.dart';

final class FirebaseAppleAuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> login() async {
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
        .then((value) => value != null ? Future.value() : Future.error(Error()));
  }

  @override
  Future<void> logout() {
    return FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }
}
