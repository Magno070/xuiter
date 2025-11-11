import 'package:xuiter/app/auth/datasources/auth_data_source.dart';
import 'package:xuiter/core/services/dio_client.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final String _mainPath = '/auth';
  final _dioClient = DioClient();

  @override
  Future<String> login(String username, String password) async {
    final response = await _dioClient.dio.post(
      '$_mainPath/login',
      data: {'username': username, 'password': password},
    );
    return response.data['access_token'];
  }

  @override
  Future<bool> register(String username, String password, int age) async {
    final response = await _dioClient.dio.post(
      '$_mainPath/register',
      data: {'username': username, 'password': password, 'age': age},
    );
    final status = response.statusCode ?? 0;
    return status >= 200 && status < 300;
  }
}
