import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sigppang_e/data/mappper/to_do_mapper.dart';
import 'package:sigppang_e/domain/model/to_do.dart';
import 'package:sigppang_e/domain/repository/to_do_repository.dart';
import 'package:sigppang_e/presentation/util/auth_notifier.dart';

final class FirebaseToDoRepositoryImpl implements ToDoRepository {
  static final FirebaseToDoRepositoryImpl instance = FirebaseToDoRepositoryImpl._internal();

  factory FirebaseToDoRepositoryImpl() => instance;

  FirebaseToDoRepositoryImpl._internal();

  final _user = AuthNotifier.instance.currentUser;

  String get userId => _user != null ? _user.uid : throw Error();

  @override
  Stream<List<ToDo>> readAll() {
    return FirebaseFirestore.instance
        .collection(userId)
        .snapshots()
        .map((collection) => collection.docs.map((doc) => ToDoMapper.fromDocument(doc.data(), doc.id)).toList());
  }

  @override
  Future<void> create(ToDo toDo) {
    return FirebaseFirestore.instance.collection(userId).doc().set(ToDoMapper.toDocument(toDo));
  }

  @override
  Future<void> update(ToDo toDo) {
    return FirebaseFirestore.instance.collection(userId).doc(toDo.id).update(ToDoMapper.toDocument(toDo));
  }

  @override
  Future<void> delete(ToDo toDo) {
    return FirebaseFirestore.instance.collection(userId).doc(toDo.id).delete();
  }
}
