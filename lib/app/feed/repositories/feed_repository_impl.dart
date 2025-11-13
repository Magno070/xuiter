import 'package:xuiter/app/feed/datasources/feed_datasource.dart';
import 'package:xuiter/app/feed/entities/xuit_entity.dart';
import 'package:xuiter/app/feed/models/xuit_model.dart';
import 'package:xuiter/app/feed/repositories/feed_repository.dart';

class FeedRepositoryImpl implements FeedRepository {
  final FeedDatasource _datasource;
  FeedRepositoryImpl({required FeedDatasource datasource})
    : _datasource = datasource;

  @override
  Future<List<XuitEntity>> fetchMyForYouItems() {
    final itemsFuture = _datasource.fetchMyForYouItems();
    return itemsFuture.then(
      (models) => models
          .map(
            (model) => XuitEntity(
              id: model.id,
              authorId: model.authorId,
              content: model.content,
              postedAt: model.postedAt,
              likes: model.likes,
              commentsAmmount: model.commentsAmmount,
              bombsAmount: model.bombsAmount,
            ),
          )
          .toList(),
    );
  }

  @override
  Future<bool> createXuit(XuitEntity xuit) async {
    final xuitModel = XuitModel(
      id: "",
      authorId: "",
      content: xuit.content,
      postedAt: xuit.postedAt,
      likes: xuit.likes,
      commentsAmmount: xuit.commentsAmmount,
      bombsAmount: xuit.bombsAmount,
    );

    return await _datasource.createXuit(xuitModel);
  }

  @override
  Future<bool> likeXuit(String xuitId) {
    // TODO: implement likeXuit
    throw UnimplementedError();
  }

  @override
  Future<bool> commentInXuit(String xuitId, String comment) {
    // TODO: implement commentInXuit
    throw UnimplementedError();
  }

  @override
  Future<bool> bombXuit(String xuitId) {
    // TODO: implement bombXuit
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteXuit(String xuitId) {
    // TODO: implement deleteXuit
    throw UnimplementedError();
  }
}
