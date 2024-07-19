part of 'models.dart';

class DiscussionModel {
  final String forumId;
  final String content;
  final Map<String, dynamic> user;
  final Timestamp createdAt;
  final Timestamp? updatedAt;
  final Timestamp? deletedAt;

  DiscussionModel({
    required this.forumId,
    required this.content,
    required this.user,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory DiscussionModel.fromJson(Map<String, dynamic> data) {
    return DiscussionModel(
      forumId: data['forumId'],
      content: data['content'],
      user: data['user'],
      createdAt: data['createdAt'],
      updatedAt: data['updatedAt'],
      deletedAt: data['deletedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'forumId': forumId,
      'content': content,
      'user': user,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
    };
  }
}
