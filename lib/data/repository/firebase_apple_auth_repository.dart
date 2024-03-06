import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:sigppang_e/domain/repository/firebase_auth_repository.dart';

final class FirebaseAppleAuthRepositoryImpl implements FirebaseAuthRepository {
  @override
  Future<UserCredential?> login() async {
    final AuthorizationCredentialAppleID appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
      ],
    );

    final OAuthCredential credential = OAuthProvider('apple.com').credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );

    return FirebaseAuth.instance.signInWithCredential(credential);
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
