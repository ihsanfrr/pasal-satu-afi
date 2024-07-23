part of 'models.dart';

class RegulationModel {
  final String regulation;
  final String year;
  final String initiator;
  final String document;
  final String title;
  final String tags;
  final String url;
  final String pdfUrl;

  RegulationModel({
    required this.regulation,
    required this.year,
    required this.initiator,
    required this.document,
    required this.title,
    required this.tags,
    required this.url,
    required this.pdfUrl,
  });

  factory RegulationModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return RegulationModel(
      regulation: data['regulation'],
      year: data['year'],
      initiator: data['initiator'],
      document: data['document'],
      title: data['title'],
      tags: data['tags'],
      url: data['url'],
      pdfUrl: data['pdfUrl'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'regulation': regulation,
      'year': year,
      'initiator': initiator,
      'document': document,
      'title': title,
      'tags': tags,
      'url': url,
      'pdfUrl': pdfUrl,
    };
  }
}
