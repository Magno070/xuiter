class XuitModel {
  final String id;
  final String authorId;
  final String content;
  final DateTime postedAt;
  final int likes;
  final int commentsAmmount;
  final int bombsAmount;

  XuitModel({
    required this.id,
    required this.authorId,
    required this.content,
    required this.postedAt,
    required this.likes,
    required this.commentsAmmount,
    required this.bombsAmount,
  });

  factory XuitModel.fromJson(Map<String, dynamic> json) {
    return XuitModel(
      id: json['id'],
      authorId: json['authorId'],
      content: json['content'],
      postedAt: DateTime.parse(json['postedAt']),
      likes: json['likes'],
      commentsAmmount: json['commentsAmmount'],
      bombsAmount: json['bombsAmount'],
    );
  }

  Map<String, dynamic> toCreation() {
    return {'content': content, 'postedAt': postedAt.toIso8601String()};
  }
}
