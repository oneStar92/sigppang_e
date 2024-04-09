import 'package:sigppang_e/domain/repository/auth_repository.dart';
import 'package:sigppang_e/domain/repository/to_do_repository.dart';
import 'package:sigppang_e/domain/use_case/use_case.dart';

final class FirebaseSignOutUseCase implements UseCase<Future<void>, void> {
  final AuthRepository _authRepository;
  final ToDoRepository _toDoRepository;

  const FirebaseSignOutUseCase({
    required AuthRepository authRepository,
    required ToDoRepository toDoRepository,
  })  : _authRepository = authRepository,
        _toDoRepository = toDoRepository;

  @override
  Future<void> execute({required void query}) => _toDoRepository.deleteAll().then((_) => _authRepository.signOut());
}
