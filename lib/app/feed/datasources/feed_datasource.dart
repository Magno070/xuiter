import 'package:xuiter/app/feed/models/xuit_model.dart';

abstract class FeedDatasource {
  Future<List<XuitModel>> fetchMyForYouItems();
  Future<bool> createXuit(XuitModel xuit);
  Future<bool> likeXuit(String xuitId);
  Future<bool> commentInXuit(String xuitId, String comment);
  Future<bool> bombXuit(String xuitId);
  Future<bool> deleteXuit(String xuitId);
}
