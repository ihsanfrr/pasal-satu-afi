part of 'models.dart';

class ConversationModel {
  final String questionId;
  final String sender;
  final String text;
  final String attachments;
  final Timestamp createdAt;

  ConversationModel({
    required this.questionId,
    required this.sender,
    required this.text,
    required this.attachments,
    required this.createdAt,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> data) {
    return ConversationModel(
      questionId: data['questionId'],
      sender: data['sender'],
      text: data['text'],
      attachments: data['attachments'],
      createdAt: data['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questionId': questionId,
      'sender': sender,
      'text': text,
      'attachments': attachments,
      'createdAt': createdAt,
    };
  }
}
