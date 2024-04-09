abstract interface class AuthRepository {
  Future<void> googleLogin();

  Future<void> appleLogin();

  Future<void> logout();

  Future<void> signOut();
}
