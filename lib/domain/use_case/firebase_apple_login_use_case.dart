import 'package:sigppang_e/domain/repository/auth_repository.dart';
import 'package:sigppang_e/domain/use_case/use_case.dart';

final class FirebaseAppleLoginUseCase implements UseCase<Future<void>, void> {
  final AuthRepository _authRepository;

  FirebaseAppleLoginUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute({query}) {
    return _authRepository.appleLogin();
  }
}
