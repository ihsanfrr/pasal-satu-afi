part of 'models.dart';

class ForumModel {
  final DocumentReference? reference;
  final String title;
  final String description;
  final Map<String, dynamic> user;
  final String? coverImageUrl;
  final String? tags;
  final Timestamp createdAt;
  final Timestamp? updatedAt;
  final Timestamp? deletedAt;

  ForumModel({
    this.reference,
    required this.title,
    required this.description,
    required this.user,
    this.coverImageUrl,
    this.tags,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ForumModel.fromFirestore(QueryDocumentSnapshot<dynamic> doc) {
    final data = doc.data();
    return ForumModel(
      reference: doc.reference,
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

  Map<String, dynamic> toFirestore() {
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
