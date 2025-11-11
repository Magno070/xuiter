import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _tokenKey = 'auth_token';

  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<bool> isAuthenticated() async {
    await init();
    final token = _prefs?.getString(_tokenKey);
    return token != null && token.isNotEmpty;
  }

  Future<String?> getToken() async {
    await init();
    return _prefs?.getString(_tokenKey);
  }

  Future<bool> saveToken(String token) async {
    await init();
    return await _prefs?.setString(_tokenKey, token) ?? false;
  }

  Future<bool> logout() async {
    await init();
    return await _prefs?.remove(_tokenKey) ?? false;
  }

  Future<bool> clearAll() async {
    await init();
    return await _prefs?.clear() ?? false;
  }
}
