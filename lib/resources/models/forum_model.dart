part of 'models.dart';

class ForumModel {
  final String title;
  final String description;
  final Map<String, dynamic> user;
  final String? coverImageUrl;
  final String? tags;
  final Timestamp createdAt;
  final Timestamp? updatedAt;
  final Timestamp? deletedAt;

  ForumModel({
    required this.title,
    required this.description,
    required this.user,
    this.coverImageUrl,
    this.tags,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ForumModel.fromJson(Map<String, dynamic> data) {
    return ForumModel(
      title: data['title'],
      description: data['description'],
      user: data['user'],
      coverImageUrl: data['coverImageUrl'],
      tags: data['tags'],
      createdAt: data['createdAt'],
      updatedAt: data['updatedAt'],
      deletedAt: data['deletedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'user': user,
      'coverImageUrl': coverImageUrl,
      'tags': tags,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
    };
  }
}
