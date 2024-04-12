import 'package:sigppang_e/domain/model/to_do.dart';
import 'package:sigppang_e/domain/repository/to_do_repository.dart';
import 'package:sigppang_e/domain/use_case/use_case.dart';

final class FirebaseToDoReadUseCase implements UseCase<Stream<List<ToDo>>, void> {
  final ToDoRepository _repository;

  const FirebaseToDoReadUseCase({
    required ToDoRepository repository,
  }) : _repository = repository;

  @override
  Stream<List<ToDo>> execute({query}) => _repository.readAll();
}
