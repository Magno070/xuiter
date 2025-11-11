import 'package:dio/dio.dart';
import 'package:xuiter/core/services/auth_service.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  late final Dio _dio;
  final _authService = AuthService();

  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.99.74:3001',
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {'Content-Type': 'application/json'},
      ),
    );
    _setupInterceptors();
  }

  Dio get dio => _dio;

  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // add the token in all requests
          final token = await _authService.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          // If receives 401 (unauthorized), logs out
          if (error.response?.statusCode == 401) {
            await _authService.logout();
            // TODO: Navigate to login screen
          }
          return handler.next(error);
        },
      ),
    );
  }
}
