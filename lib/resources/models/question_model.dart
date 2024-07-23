part of 'models.dart';

class QuestionModel {
  final DocumentReference? reference;
  final String text;
  final String userId;
  final String status;
  final String? language;
  final Timestamp createdAt;
  final Timestamp? deletedAt;

  QuestionModel({
    this.reference,
    required this.text,
    required this.userId,
    required this.status,
    this.language,
    required this.createdAt,
    this.deletedAt,
  });

  factory QuestionModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return QuestionModel(
      reference: doc.reference,
      text: data['text'],
      userId: data['userId'],
      status: data['status'],
      language: data['language'],
      createdAt: data['createdAt'],
      deletedAt: data['deletedAt'],
    );
  }
  Map<String, dynamic> toFirestore() {
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
