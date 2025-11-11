abstract class AuthDataSource {
  Future<String> login(String username, String password);
  Future<bool> register(String username, String password, int age);
}
