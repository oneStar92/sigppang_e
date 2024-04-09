import 'package:sigppang_e/domain/repository/auth_repository.dart';
import 'package:sigppang_e/domain/use_case/use_case.dart';

final class FirebaseLogoutUseCase implements UseCase<Future<void>, void> {
  final AuthRepository _repository;

  const FirebaseLogoutUseCase({
    required AuthRepository repository,
  }) : _repository = repository;

  @override
  Future<void> execute({required void query}) => _repository.logout();
}
