import 'package:sigppang_e/common/constants/constants.dart';
import 'package:sigppang_e/domain/model/result.dart';
import 'package:sigppang_e/domain/repository/auth_repository.dart';
import 'package:sigppang_e/domain/use_case/use_case.dart';

final class FirebaseAppleLoginUseCase implements UseCase<Future<Result<void>>, void> {
  final AuthRepository _firebaseAppleAuthRepository;

  FirebaseAppleLoginUseCase({
    required AuthRepository firebaseAppleAuthRepository,
  }) : _firebaseAppleAuthRepository = firebaseAppleAuthRepository;

  @override
  Future<Result<void>> execute({query = ()}) {
    return _firebaseAppleAuthRepository
        .login()
        .then((value) => Result.success(null))
        .onError((error, stackTrace) => Result.error(loginErrorMessage));
  }
}
