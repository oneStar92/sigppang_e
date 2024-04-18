import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sigppang_e/common/constants/constants.dart';
import 'package:sigppang_e/data/repository/firebase_auth_repository_impl.dart';
import 'package:sigppang_e/data/repository/firebase_to_do_repository_impl.dart';
import 'package:sigppang_e/domain/model/to_do.dart';
import 'package:sigppang_e/domain/use_case/firebase_apple_login_use_case.dart';
import 'package:sigppang_e/domain/use_case/firebase_google_login_use_case.dart';
import 'package:sigppang_e/domain/use_case/firebase_logout_use_case.dart';
import 'package:sigppang_e/domain/use_case/firebase_sign_out_use_case.dart';
import 'package:sigppang_e/domain/use_case/firebase_to_do_create_use_case.dart';
import 'package:sigppang_e/domain/use_case/firebase_to_do_delete_use_case.dart';
import 'package:sigppang_e/domain/use_case/firebase_to_do_read_use_case.dart';
import 'package:sigppang_e/domain/use_case/firebase_to_do_update_use_case.dart';
import 'package:sigppang_e/domain/use_case/guest_login_use_case.dart';
import 'package:sigppang_e/domain/use_case/guest_logout_use_case.dart';
import 'package:sigppang_e/presentation/calendar/calendar_view_model.dart';
import 'package:sigppang_e/presentation/calendar/calendar_screen.dart';
import 'package:sigppang_e/presentation/calendar/widgets/to_do_item.dart';
import 'package:sigppang_e/presentation/calendar/widgets/to_do_item_view_model.dart';
import 'package:sigppang_e/presentation/home/home_screen.dart';
import 'package:sigppang_e/presentation/home/home_view_model.dart';
import 'package:sigppang_e/presentation/login/login_screen.dart';
import 'package:sigppang_e/presentation/login/login_view_model.dart';
import 'package:sigppang_e/presentation/etc/etc_view_model.dart';
import 'package:sigppang_e/presentation/etc/etc_screen.dart';
import 'package:sigppang_e/presentation/policy/policy_screen.dart';
import 'package:sigppang_e/presentation/policy/policy_view_model.dart';
import 'package:sigppang_e/presentation/util/activity_tracker.dart';

final class ScreenProvider {
  ScreenProvider._internal();

  static final _homeScreenActivityTracker = ActivityTracker();

  static LoginScreen buildLoginScreen() {
    final authRepository = FirebaseAuthRepositoryImpl.instance;
    final guestLoginUseCase = GuestLoginUseCase();
    final googleLoginUseCase = FirebaseGoogleLoginUseCase(authRepository: authRepository);
    final appleLoginUseCase = FirebaseAppleLoginUseCase(authRepository: authRepository);
    final viewModel = LoginViewModel(
      activityTracker: ActivityTracker(),
      googleLoginUseCase: googleLoginUseCase,
      appleLoginUseCase: appleLoginUseCase,
      guestLoginUseCase: guestLoginUseCase,
    );
    return LoginScreen(viewModel: viewModel);
  }

  static PolicyScreen buildTermsAndConditions() {
    final viewModel = PolicyViewModel(
      activityTracker: ActivityTracker(),
      title: '서비스 이용약관',
      policy: termsAndConditions,
    );
    return PolicyScreen(viewModel: viewModel);
  }

  static PolicyScreen buildPersonalInformationProcessingPolicy() {
    final viewModel = PolicyViewModel(
      activityTracker: ActivityTracker(),
      title: '개인정보처리방침',
      policy: personalInformationProcessingPolicy,
    );
    return PolicyScreen(viewModel: viewModel);
  }

  static HomeScreen buildHomeScreen(StatefulNavigationShell navigationShell) {
    final viewModel = HomeViewModel(activityTracker: _homeScreenActivityTracker);
    return HomeScreen(navigationShell: navigationShell, viewModel: viewModel);
  }

  static CalendarScreen buildCalendarScreen() {
    final repository = FirebaseToDoRepositoryImpl.instance;
    final readUseCase = FirebaseToDoReadUseCase(repository: repository);
    final guestLogoutUseCase = GuestLogoutUseCase();
    final viewModel = CalendarViewModel(
      activityTracker: _homeScreenActivityTracker,
      readUseCase: readUseCase,
      guestLogoutUseCase: guestLogoutUseCase,
    );
    return CalendarScreen(viewModel: viewModel);
  }

  static ETCScreen buildETCScreen() {
    final authRepository = FirebaseAuthRepositoryImpl.instance;
    final toDoRepository = FirebaseToDoRepositoryImpl.instance;
    final logoutUseCase = FirebaseLogoutUseCase(repository: authRepository);
    final signOutUseCase = FirebaseSignOutUseCase(authRepository: authRepository, toDoRepository: toDoRepository);
    final guestLogoutUseCase = GuestLogoutUseCase();
    final viewModel = ETCViewModel(
      activityTracker: _homeScreenActivityTracker,
      logoutUseCase: logoutUseCase,
      signOutUseCase: signOutUseCase,
      guestLogoutUseCase: guestLogoutUseCase,
    );
    return ETCScreen(viewModel: viewModel);
  }

  static ToDoItem buildToDoItem(ToDo toDo, {required Function(ToDo toDo) deletedOnMemory}) {
    final repository = FirebaseToDoRepositoryImpl.instance;
    final createUseCase = FirebaseToDoCreateUseCase(repository: repository);
    final updateUseCase = FirebaseToDoUpdateUseCase(repository: repository);
    final deleteUseCase = FirebaseToDoDeleteUseCase(repository: repository);
    final focusNode = FocusNode();
    final viewModel = ToDoItemViewModel(
      createUseCase: createUseCase,
      updateUseCase: updateUseCase,
      deleteUseCase: deleteUseCase,
      toDo: toDo,
      unfocusAction: () => focusNode.unfocus(),
      deleteOnMemory: deletedOnMemory,
    );
    return ToDoItem(
      viewModel: viewModel,
      focusNode: focusNode,
    );
  }
}
