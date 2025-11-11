import 'package:flutter/material.dart';
import 'package:xuiter/core/app_router.dart';
import 'package:xuiter/core/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AuthService().init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
