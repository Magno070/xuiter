import 'package:xuiter/app/feed/datasources/feed_datasource.dart';
import 'package:xuiter/app/feed/models/xuit_model.dart';
import 'package:xuiter/core/services/dio_client.dart';

class FeedDatasourceImpl implements FeedDatasource {
  static const String _mainPath = '/feed';
  final String _forYouPath = '$_mainPath/for-you';
  final _dioClient = DioClient();

  @override
  Future<List<XuitModel>> fetchMyForYouItems() async {
    final response = await _dioClient.dio.get("$_forYouPath/fetch");

    final List<dynamic> data = response.data['items'];
    return data.map((item) => XuitModel.fromJson(item)).toList();
  }

  @override
  Future<bool> createXuit(XuitModel xuit) async {
    final response = await _dioClient.dio.post("$_mainPath/create", data: xuit);
    final statusCode = response.statusCode;
    return statusCode != null && statusCode >= 200 && statusCode < 300;
  }

  @override
  Future<bool> deleteXuit(String xuitId) async {
    final response = await _dioClient.dio.delete("$_mainPath/delete/$xuitId");
    final statusCode = response.statusCode;
    return statusCode != null && statusCode >= 200 && statusCode < 300;
  }

  @override
  Future<bool> likeXuit(String xuitId) async {
    final response = await _dioClient.dio.post("$_mainPath/like/$xuitId");
    final statusCode = response.statusCode;
    return statusCode != null && statusCode >= 200 && statusCode < 300;
  }

  @override
  Future<bool> commentInXuit(String xuitId, String comment) async {
    final response = await _dioClient.dio.post(
      "$_mainPath/comment/$xuitId",
      data: {'comment': comment},
    );
    final statusCode = response.statusCode;
    return statusCode != null && statusCode >= 200 && statusCode < 300;
  }

  @override
  Future<bool> bombXuit(String xuitId) async {
    final response = await _dioClient.dio.post("$_mainPath/bomb/$xuitId");
    final statusCode = response.statusCode;
    return statusCode != null && statusCode >= 200 && statusCode < 300;
  }
}
