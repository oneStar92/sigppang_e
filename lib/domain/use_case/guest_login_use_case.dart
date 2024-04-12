import 'package:sigppang_e/domain/use_case/use_case.dart';
import 'package:sigppang_e/presentation/util/auth_notifier.dart';

final class GuestLoginUseCase implements UseCase<void, void> {
  GuestLoginUseCase();

  @override
  execute({query}) => AuthNotifier.instance.loginAsGuest();
}