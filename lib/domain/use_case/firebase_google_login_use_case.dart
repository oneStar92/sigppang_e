import 'package:sigppang_e/common/constants/constants.dart';
import 'package:sigppang_e/domain/model/result.dart';
import 'package:sigppang_e/domain/repository/auth_repository.dart';
import 'package:sigppang_e/domain/use_case/use_case.dart';

final class FirebaseGoogleLoginUseCase implements UseCase<Future<Result<void>>, void> {
  final AuthRepository _authRepository;

  FirebaseGoogleLoginUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Result<void>> execute({query = ()}) {
    return _authRepository
        .googleLogin()
        .then((value) => Result.success(null))
        .onError((error, stackTrace) => Result.error(loginErrorMessage));
  }
}
