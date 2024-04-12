import 'package:rxdart/rxdart.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sigppang_e/domain/model/account.dart';

final class AuthNotifier extends ChangeNotifier {
  final BehaviorSubject<Account?> _accountSubject = BehaviorSubject.seeded(null);

  static final AuthNotifier instance = AuthNotifier._internal();

  factory AuthNotifier() => instance;

  Account? get account => _accountSubject.value;

  AuthNotifier._internal() {
    _accountSubject.listen((_) => notifyListeners());
    FirebaseAuth.instance.authStateChanges().listen((_) => sync());
  }

  loginAsGuest() {
    _accountSubject.add(Account.guest());
  }

  logoutAsGuest() {
    _accountSubject.add(null);
  }

  sync() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      _accountSubject.add(Account.user(uid: currentUser.uid, email: currentUser.email ?? 'Email UnVerified'));
    } else {
      _accountSubject.add(null);
    }
  }
}
