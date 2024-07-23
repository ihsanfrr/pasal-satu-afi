part of 'models.dart';

class ConversationModel {
  final DocumentReference? reference;
  final String questionId;
  final String sender;
  final String text;
  final String attachments;
  final Timestamp createdAt;

  ConversationModel({
    this.reference,
    required this.questionId,
    required this.sender,
    required this.text,
    required this.attachments,
    required this.createdAt,
  });

  factory ConversationModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return ConversationModel(
      reference: doc.reference,
      questionId: data['questionId'],
      sender: data['sender'],
      text: data['text'],
      attachments: data['attachments'],
      createdAt: data['createdAt'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'questionId': questionId,
      'sender': sender,
      'text': text,
      'attachments': attachments,
      'createdAt': createdAt,
    };
  }
}
