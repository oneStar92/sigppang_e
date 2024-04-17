import 'package:sigppang_e/domain/model/account.dart';
import 'package:sigppang_e/domain/use_case/firebase_logout_use_case.dart';
import 'package:sigppang_e/domain/use_case/firebase_sign_out_use_case.dart';
import 'package:sigppang_e/domain/use_case/guest_logout_use_case.dart';
import 'package:sigppang_e/presentation/common/view_model.dart';
import 'package:sigppang_e/presentation/etc/etc_action.dart';
import 'package:sigppang_e/presentation/util/activity_tracker.dart';
import 'package:sigppang_e/presentation/util/auth_notifier.dart';

final class ETCViewModel extends ViewModel<ETCScreenAction> {
  final FirebaseLogoutUseCase _logoutUseCase;
  final FirebaseSignOutUseCase _signOutUseCase;
  final GuestLogoutUseCase _guestLogoutUseCase;

  ETCViewModel({
    required super.activityTracker,
    required FirebaseLogoutUseCase logoutUseCase,
    required FirebaseSignOutUseCase signOutUseCase,
    required GuestLogoutUseCase guestLogoutUseCase,
  })  : _logoutUseCase = logoutUseCase,
        _signOutUseCase = signOutUseCase,
        _guestLogoutUseCase = guestLogoutUseCase;

  String get email => AuthNotifier.instance.account?.email ?? '';

  bool get isGuest => AuthNotifier.instance.account is Guest ? true : false;

  @override
  Stream<bool> get isLoadingStream => Stream.value(true);

  @override
  initState() {
    super.initState();

    actionStream.listen((event) {
      switch (event) {
        case Logout():
          _logoutUseCase.execute().trackActivity(activityTracker);
          break;
        case SingIn():
          _guestLogoutUseCase.execute();
          break;
        case SignOut():
          _signOutUseCase.execute().trackActivity(activityTracker);
          break;
      }
    });
  }
}
