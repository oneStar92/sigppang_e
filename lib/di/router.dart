import 'package:go_router/go_router.dart';
import 'package:sigppang_e/di/screen_provider.dart';

const loginScreenPath = '/Login';
const initialLocation = loginScreenPath;

final router = GoRouter(
  initialLocation: initialLocation,
  routes: [
    GoRoute(path: loginScreenPath, builder: (context, state) => ScreenProvider.buildLoginScreen()),
  ],
);
