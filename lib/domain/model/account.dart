sealed class Account {
  final String uid;
  final String email;

  factory Account.user({required String uid, required String email}) = SigppangEUser;

  factory Account.guest() = Guest;

  Account({
    required this.uid,
    required this.email,
  }); // Option
}

class SigppangEUser implements Account {
  @override
  final String uid;
  @override
  final String email;

  SigppangEUser({required this.uid, required this.email});
}

class Guest implements Account {
  @override
  final String uid = 'Guest';
  @override
  final String email = 'Guest';

  Guest();
}
