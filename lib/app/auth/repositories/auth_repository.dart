abstract class AuthRepository {
  Future<String> login(String username, String password);
  Future<bool> register(String username, String password, int age);
  Future<bool> logout();
  Future<bool> isAuthenticated();
  Future<String?> getToken();
}
