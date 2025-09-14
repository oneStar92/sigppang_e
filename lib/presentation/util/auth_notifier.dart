import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sigppang_e/domain/model/account.dart';

final class AuthNotifier extends ChangeNotifier {
  static final AuthNotifier instance = AuthNotifier._internal();

  factory AuthNotifier() => instance;

  Account? _account;

  Account? get account => _account;

  AuthNotifier._internal() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        _account = Account.user(uid: user.uid, email: user.email ?? 'Email UnVerified');
      } else {
        _account = null;
      }
      notifyListeners();
    });
  }

  loginAsGuest() {
    _account = Account.guest();
    notifyListeners();
  }

  logoutAsGuest() {
    _account = null;
    notifyListeners();
  }
}
