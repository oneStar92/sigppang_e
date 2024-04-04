import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sigppang_e/domain/model/to_do.dart';
import 'package:sigppang_e/domain/repository/to_do_repository.dart';
import 'package:sigppang_e/presentation/util/auth_notifier.dart';

final class FirebaseToDoRepositoryImpl implements ToDoRepository {
  @override
  Stream<List<ToDo>> readAll() {
    final user = AuthNotifier.instance.currentUser;
    if (user != null) {
      return FirebaseFirestore.instance
          .collection(user.uid)
          .snapshots()
          .map((collection) => collection.docs.map((doc) => ToDo.fromJson(doc.data())).toList());
    } else {
      return Stream.error(Error());
    }
  }
}
