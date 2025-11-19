import 'package:go_router/go_router.dart';
import 'package:xuiter/app/app_view.dart';
import 'package:xuiter/app/auth/views/login_view.dart';
import 'package:xuiter/app/auth/views/register_view.dart';
import 'package:xuiter/app/feed/feed_view.dart';
import 'package:xuiter/app/messages/messages_view.dart';
import 'package:xuiter/app/notifications/notifications_view.dart';
import 'package:xuiter/app/profile/profile_view.dart';
import 'package:xuiter/app/search/search_view.dart';
import 'package:xuiter/app/splash_view.dart';
import 'package:xuiter/core/app_routes.dart';
import 'package:xuiter/core/services/auth_service.dart';

class AppRouter {
  static final _authService = AuthService();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      final isAuthenticated = await _authService.isAuthenticated();
      final isSplash = state.matchedLocation == AppRoutes.splash;
      final isLogin = state.matchedLocation == AppRoutes.login;
      final isRegister = state.matchedLocation == AppRoutes.register;

      // If is splash, await initialization
      if (isSplash) return null;

      // If is not authenticated and not in login/register, go to login
      if (!isAuthenticated && !isLogin && !isRegister) {
        return AppRoutes.login;
      }

      // If is authenticated and tries to access login or register, go to home
      if (isAuthenticated && (isLogin || isRegister)) {
        return AppRoutes.app;
      }

      // Otherwise, allow normal access
      return null;
    },
    routes: [
      // Splash Screen
      GoRoute(
        path: AppRoutes.splash,
        name: 'splash',
        builder: (context, state) => const SplashView(),
      ),
      // Auth Routes
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.register,
        name: 'register',
        builder: (context, state) => const RegisterView(),
      ),
      // App Routes
      GoRoute(
        path: AppRoutes.app,
        name: 'app',
        builder: (context, state) => const AppView(),
        routes: [
          GoRoute(
            path: 'profile',
            name: 'profile',
            builder: (context, state) => const ProfileView(),
          ),
          GoRoute(
            path: 'feed',
            name: 'feed',
            builder: (context, state) => const FeedView(),
          ),
          GoRoute(
            path: 'search',
            name: 'search',
            builder: (context, state) => const SearchView(),
          ),
          GoRoute(
            path: 'notifications',
            name: 'notifications',
            builder: (context, state) => const NotificationsView(),
          ),
          GoRoute(
            path: 'messages',
            name: 'messages',
            builder: (context, state) => const MessagesView(),
          ),
        ],
      ),
    ],
  );
}
