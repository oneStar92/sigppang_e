import 'package:go_router/go_router.dart';
import 'package:sigppang_e/di/screen_provider.dart';
import 'package:sigppang_e/presentation/util/auth_notifier.dart';

const loginScreenPath = '/login';
const termsAndConditionsScreenPath = 'termsAndConditions';
const personalInformationProcessingPolicyScreenPath = 'personalInformationProcessingPolicy';
const calendarScreenPath = '/calendar';
const settingScreenPath = '/setting';
const homeScreenPath = calendarScreenPath;
const initialLocation = loginScreenPath;

final router = GoRouter(
  initialLocation: initialLocation,
  routes: [
    GoRoute(
      path: loginScreenPath,
      builder: (context, state) => ScreenProvider.buildLoginScreen(),
      routes: [
        GoRoute(
          path: termsAndConditionsScreenPath,
          name: termsAndConditionsScreenPath,
          builder: (context, state) => ScreenProvider.buildTermsAndConditions(),
        ),
        GoRoute(
          path: personalInformationProcessingPolicyScreenPath,
          name: personalInformationProcessingPolicyScreenPath,
          builder: (context, state) => ScreenProvider.buildPersonalInformationProcessingPolicy(),
        ),
      ],
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => ScreenProvider.buildHomeScreen(navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: calendarScreenPath,
              builder: (context, state) => ScreenProvider.buildCalendarScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: settingScreenPath,
              builder: (context, state) => ScreenProvider.buildETCScreen(),
            ),
          ],
        ),
      ],
    )
  ],
  refreshListenable: AuthNotifier.instance,
  redirect: (context, state) {
    final account = AuthNotifier.instance.account;

    if (account != null && state.topRoute?.path == loginScreenPath) {
      return calendarScreenPath;
    } else if (account != null && state.topRoute?.path != loginScreenPath) {
      return state.fullPath;
    } else if (account == null &&
        (state.topRoute?.path == personalInformationProcessingPolicyScreenPath ||
            state.topRoute?.path == termsAndConditionsScreenPath)) {
      return state.fullPath;
    } else {
      return loginScreenPath;
    }
  },
);
