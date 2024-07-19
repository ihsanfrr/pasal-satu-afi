part of 'models.dart';

class ArticleModel {
  final String title;
  final String author;
  final String content;
  final String coverImageUrl;
  final int likes;
  final String tags;
  final bool isPopular;
  final Timestamp createdAt;
  final Timestamp? publishedAt;

  ArticleModel({
    required this.title,
    required this.author,
    required this.content,
    required this.coverImageUrl,
    required this.likes,
    required this.tags,
    required this.isPopular,
    required this.createdAt,
    this.publishedAt,
  });

  factory ArticleModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return ArticleModel(
      title: data['title'],
      author: data['author'],
      content: data['content'],
      coverImageUrl: data['coverImageUrl'],
      likes: data['likes'],
      tags: data['tags'],
      isPopular: data['isPopular'],
      createdAt: data['createdAt'],
      publishedAt: data['publishedAt'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'author': author,
      'content': content,
      'coverImageUrl': coverImageUrl,
      'likes': likes,
      'tags': tags,
      'isPopular': isPopular,
      'createdAt': createdAt,
      'publishedAt': publishedAt,
    };
  }
}
