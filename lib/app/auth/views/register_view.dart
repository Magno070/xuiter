import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:xuiter/app/auth/datasources/auth_data_source_impl.dart';
import 'package:xuiter/app/auth/repositories/auth_repository_impl.dart';
import 'package:xuiter/app/auth/viewmodels/register_viewmodel.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterViewModel(
        authRepository: AuthRepositoryImpl(dataSource: AuthDataSourceImpl()),
      ),
      child: const _RegisterViewContent(),
    );
  }
}

class _RegisterViewContent extends StatelessWidget {
  const _RegisterViewContent();

  Future<void> _handleRegister(BuildContext context) async {
    final viewModel = context.read<RegisterViewModel>();

    if (!viewModel.formKey.currentState!.validate()) return;

    final result = await viewModel.register(
      username: viewModel.usernameController.text,
      age: viewModel.ageController.text,
      password: viewModel.passwordController.text,
    );

    if (result != null && context.mounted) {
      context.go('/login');
    } else if (context.mounted && viewModel.errorMessage != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(viewModel.errorMessage!)));
      viewModel.clearError();
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RegisterViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Criar Conta')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: viewModel.usernameController,
                decoration: const InputDecoration(
                  labelText: 'Nome de Usuário',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
                validator: viewModel.validateUsername,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: viewModel.ageController,
                decoration: const InputDecoration(
                  labelText: 'Idade',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: viewModel.validateAge,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: viewModel.passwordController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: viewModel.validatePassword,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: viewModel.isLoading
                      ? null
                      : () => _handleRegister(context),
                  child: viewModel.isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Criar Conta'),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => context.go('/login'),
                child: const Text('Já tenho uma conta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
