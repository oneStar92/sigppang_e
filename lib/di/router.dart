import 'package:go_router/go_router.dart';
import 'package:sigppang_e/di/screen_provider.dart';
import 'package:sigppang_e/presentation/util/auth_notifier.dart';

const loginScreenPath = '/login';
const homeScreenPath = '/home';
const initialLocation = loginScreenPath;

final router = GoRouter(
  initialLocation: initialLocation,
  routes: [
    GoRoute(path: loginScreenPath, builder: (context, state) => ScreenProvider.buildLoginScreen()),
    GoRoute(path: homeScreenPath, builder: (context, state) => ScreenProvider.buildHomeScreen()),
  ],
  refreshListenable: AuthNotifier.instance,
  redirect: (context, state) {
    final currentUser = AuthNotifier.instance.currentUser;
    final currentPath = state.fullPath;
    if (currentUser != null) {
      if (currentPath == loginScreenPath) {
        return homeScreenPath;
      } else {
        return currentPath;
      }
    } else {
      return loginScreenPath;
    }
  },
);
