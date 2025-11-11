import 'package:xuiter/app/auth/datasources/auth_data_source.dart';
import 'package:xuiter/app/auth/repositories/auth_repository.dart';
import 'package:xuiter/core/services/auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;
  final AuthService _authService;

  AuthRepositoryImpl({
    required AuthDataSource dataSource,
    AuthService? authService,
  }) : _dataSource = dataSource,
       _authService = authService ?? AuthService();

  @override
  Future<String> login(String username, String password) async {
    try {
      final token = await _dataSource.login(username, password);

      await _authService.saveToken(token);

      return token;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> register(String username, String password, int age) async {
    try {
      final success = await _dataSource.register(username, password, age);

      return success;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      return await _authService.logout();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    try {
      return await _authService.isAuthenticated();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      return await _authService.getToken();
    } catch (e) {
      rethrow;
    }
  }
}
