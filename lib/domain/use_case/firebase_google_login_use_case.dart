import 'package:sigppang_e/common/constants/constants.dart';
import 'package:sigppang_e/domain/model/result.dart';
import 'package:sigppang_e/domain/repository/auth_repository.dart';
import 'package:sigppang_e/domain/use_case/use_case.dart';

final class FirebaseGoogleLoginUseCase implements UseCase<Future<Result<void>>, void> {
  final AuthRepository _firebaseGoogleAuthRepository;

  FirebaseGoogleLoginUseCase({
    required AuthRepository firebaseGoogleAuthRepository,
  }) : _firebaseGoogleAuthRepository = firebaseGoogleAuthRepository;

  @override
  Future<Result<void>> execute({query = ()}) {
    return _firebaseGoogleAuthRepository
        .login()
        .then((value) => Result.success(null))
        .onError((error, stackTrace) => Result.error(loginErrorMessage));
  }
}
