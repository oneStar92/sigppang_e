import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sigppang_e/data/mappper/to_do_mapper.dart';
import 'package:sigppang_e/domain/error/not_logged_in.dart';
import 'package:sigppang_e/domain/model/to_do.dart';
import 'package:sigppang_e/domain/repository/to_do_repository.dart';
import 'package:sigppang_e/presentation/util/auth_notifier.dart';

final class FirebaseToDoRepositoryImpl implements ToDoRepository {
  static final FirebaseToDoRepositoryImpl instance = FirebaseToDoRepositoryImpl._internal();

  factory FirebaseToDoRepositoryImpl() => instance;

  FirebaseToDoRepositoryImpl._internal();

  @override
  Stream<List<ToDo>> readAll() {
    final uid = AuthNotifier.instance.account?.uid;
    if (uid != null) {
      return FirebaseFirestore.instance
          .collection(uid)
          .snapshots()
          .map((collection) => collection.docs.map((doc) => ToDoMapper.fromDocument(doc.data(), doc.id)).toList());
    } else {
      return Stream.value([]);
    }
  }

  @override
  Future<void> create(ToDo toDo) {
    final uid = AuthNotifier.instance.account?.uid;
    if (uid != null) {
      return FirebaseFirestore.instance.collection(uid).doc().set(ToDoMapper.toDocument(toDo));
    } else {
      return Future.error(NotLoggedIn);
    }
  }

  @override
  Future<void> update(ToDo toDo) {
    final uid = AuthNotifier.instance.account?.uid;
    if (uid != null) {
      return FirebaseFirestore.instance.collection(uid).doc(toDo.id).update(ToDoMapper.toDocument(toDo));
    } else {
      return Future.error(NotLoggedIn);
    }
  }

  @override
  Future<void> delete(ToDo toDo) {
    final uid = AuthNotifier.instance.account?.uid;
    if (uid != null) {
      return FirebaseFirestore.instance.collection(uid).doc(toDo.id).delete();
    } else {
      return Future.error(NotLoggedIn);
    }
  }

  @override
  Future<void> deleteAll() async {
    final uid = AuthNotifier.instance.account?.uid;
    if (uid != null) {
      final batch = FirebaseFirestore.instance.batch();

      return FirebaseFirestore.instance.collection(uid).get().then(
        (querySnapshot) {
          for (var doc in querySnapshot.docs) {
            batch.delete(doc.reference);
          }
          batch.commit();
        },
      );
    } else {
      return Future.error(NotLoggedIn);
    }
  }
}
