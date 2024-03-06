import 'package:firebase_auth/firebase_auth.dart';

abstract interface class FirebaseAuthRepository {
  Future<UserCredential?> login();

  Future<void> logout();

  Future<void> signOut();
}
