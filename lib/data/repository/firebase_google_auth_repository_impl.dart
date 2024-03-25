import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sigppang_e/domain/repository/auth_repository.dart';

final class FirebaseGoogleAuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> login() async {
    final account = await GoogleSignIn().signIn();

    if (account != null) {
      final GoogleSignInAuthentication authentication = await account.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken,
      );

      return FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) => value != null ? Future.value(null) : Future.error(Error()));
    }
    return Future.error(Error());
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
