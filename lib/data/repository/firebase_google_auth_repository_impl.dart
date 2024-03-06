import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sigppang_e/domain/repository/firebase_auth_repository.dart';

final class FirebaseGoogleAuthRepositoryImpl implements FirebaseAuthRepository {
  @override
  Future<UserCredential?> login() async {
    final GoogleSignInAccount? account = await GoogleSignIn().signIn();

    if (account != null) {
      final GoogleSignInAuthentication authentication = await account.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken,
      );

      return FirebaseAuth.instance.signInWithCredential(credential);
    }
    return Future.value(null);
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