import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

final class AuthNotifier extends ChangeNotifier {
  User? _user = FirebaseAuth.instance.currentUser;

  static final AuthNotifier instance = AuthNotifier._internal();

  factory AuthNotifier() => instance;

  AuthNotifier._internal() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  User? get currentUser => _user;
}
