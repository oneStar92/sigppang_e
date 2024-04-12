import 'package:sigppang_e/domain/use_case/use_case.dart';
import 'package:sigppang_e/presentation/util/auth_notifier.dart';

final class GuestLogoutUseCase implements UseCase<void, void> {
  GuestLogoutUseCase();

  @override
  execute({query}) => AuthNotifier.instance.logoutAsGuest();
}