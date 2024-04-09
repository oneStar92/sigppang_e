import 'package:sigppang_e/domain/model/to_do.dart';
import 'package:sigppang_e/domain/repository/to_do_repository.dart';
import 'package:sigppang_e/domain/use_case/use_case.dart';

final class FirebaseToDoDeleteUseCase implements UseCase<Future<void>, ToDo> {
  final ToDoRepository _repository;

  const FirebaseToDoDeleteUseCase({
    required ToDoRepository repository,
  }) : _repository = repository;

  @override
  Future<void> execute({required ToDo query}) => _repository.delete(query);
}
