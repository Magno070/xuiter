import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color.fromARGB(255, 190, 190, 190),
          onPressed: () => context.pop(),
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        backgroundColor: const Color.fromARGB(255, 50, 50, 50),
        title: const Text(
          'Perfil',
          style: TextStyle(
            color: Color.fromARGB(255, 190, 190, 190),
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
