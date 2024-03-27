import 'package:go_router/go_router.dart';
import 'package:sigppang_e/di/screen_provider.dart';
import 'package:sigppang_e/presentation/util/auth_notifier.dart';

const loginScreenPath = '/login';
const homeScreenPath = '/home';
const calendarScreenPath = '/calendar';
const settingScreenPath = '/setting';
const initialLocation = loginScreenPath;

final router = GoRouter(
  initialLocation: initialLocation,
  routes: [
    GoRoute(path: loginScreenPath, builder: (context, state) => ScreenProvider.buildLoginScreen()),
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
              builder: (context, state) => ScreenProvider.buildSettingScreen(),
            ),
          ],
        ),
      ],
    )
  ],
  refreshListenable: AuthNotifier.instance,
  redirect: (context, state) {
    final currentUser = AuthNotifier.instance.currentUser;
    final currentPath = state.fullPath;
    if (currentUser != null) {
      if (currentPath == loginScreenPath) {
        return calendarScreenPath;
      } else {
        return currentPath;
      }
    } else {
      return loginScreenPath;
    }
  },
);
