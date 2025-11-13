import 'package:xuiter/app/feed/entities/xuit_entity.dart';

abstract class FeedRepository {
  Future<List<XuitEntity>> fetchMyForYouItems();
  Future<bool> createXuit(XuitEntity xuit);
  Future<bool> deleteXuit(String xuitId);
  Future<bool> likeXuit(String xuitId);
  Future<bool> commentInXuit(String xuitId, String comment);
  Future<bool> bombXuit(String xuitId);
}
