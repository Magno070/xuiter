import 'package:flutter/material.dart';
import 'package:xuiter/app/auth/repositories/auth_repository.dart';

class RegisterViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  RegisterViewModel({required AuthRepository authRepository})
    : _authRepository = authRepository;

  final usernameController = TextEditingController();
  final ageController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  @override
  void dispose() {
    usernameController.dispose();
    ageController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu nome';
    }
    return null;
  }

  String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira sua idade';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira sua senha';
    }
    if (value.length < 6) {
      return 'A senha deve ter no mínimo 6 caracteres';
    }
    return null;
  }

  Future<String?> register({
    required String username,
    required String age,
    required String password,
  }) async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final ageInt = int.parse(age);
      await _authRepository.register(
        username.toLowerCase().trim(),
        password,
        ageInt,
      );

      _isLoading = false;
      notifyListeners();
      return 'success';
    } catch (e) {
      _errorMessage = 'Erro ao criar conta, por favor tente novamente.';
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }
}
