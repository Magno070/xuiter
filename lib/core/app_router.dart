import 'package:go_router/go_router.dart';
import 'package:xuiter/app/auth/views/login_view.dart';
import 'package:xuiter/app/auth/views/register_view.dart';
import 'package:xuiter/app/home_view.dart';
import 'package:xuiter/app/splash_view.dart';
import 'package:xuiter/core/services/auth_service.dart';

class AppRouter {
  static final _authService = AuthService();

  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      final isAuthenticated = await _authService.isAuthenticated();
      final isSplash = state.matchedLocation == '/splash';
      final isLogin = state.matchedLocation == '/login';
      final isRegister = state.matchedLocation == '/register';

      // If is splash, await initialization
      if (isSplash) return null;

      // If is not authenticated and not in login/register, go to login
      if (!isAuthenticated && !isLogin && !isRegister) {
        return '/login';
      }

      // If is authenticated and tries to access login or register, go to home
      if (isAuthenticated && (isLogin || isRegister)) {
        return '/home';
      }

      // Otherwise, allow normal access
      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
