part of 'models.dart';

class QuestionModel {
  final String text;
  final String userId;
  final String status;
  final String? language;
  final Timestamp createdAt;
  final Timestamp? deletedAt;

  QuestionModel({
    required this.text,
    required this.userId,
    required this.status,
    this.language,
    required this.createdAt,
    this.deletedAt,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> data) {
    return QuestionModel(
      text: data['text'],
      userId: data['userId'],
      status: data['status'],
      language: data['language'],
      createdAt: data['createdAt'],
      deletedAt: data['deletedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'userId': userId,
      'status': status,
      'language': language,
      'createdAt': createdAt,
      'deletedAt': deletedAt,
    };
  }
}
