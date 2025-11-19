import 'package:flutter/material.dart';
import 'package:xuiter/core/app_routes.dart';
import 'package:xuiter/core/services/auth_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final _authService = AuthService();
  bool _hasError = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    try {
      // wait a moment to show the splash
      await Future.delayed(const Duration(milliseconds: 500));

      // verify if user is authenticated
      final isAuthenticated = await _authService.isAuthenticated();

      if (!mounted) return;

      // navigation logic
      if (isAuthenticated) {
        AppRoutes.goToApp(context);
      } else {
        AppRoutes.goToLogin(context);
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _hasError = true;
        _errorMessage = 'Erro ao inicializar: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _hasError
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 16),
                  Text(
                    _errorMessage,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _hasError = false;
                        _errorMessage = '';
                      });
                      _checkAuthentication();
                    },
                    child: const Text('Tentar novamente'),
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
