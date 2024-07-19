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

  factory RegulationModel.fromJson(Map<String, dynamic> json) {
    return RegulationModel(
      regulation: json['regulation'],
      year: json['year'],
      initiator: json['initiator'],
      document: json['document'],
      title: json['title'],
      tags: json['tags'],
      url: json['url'],
      pdfUrl: json['pdfUrl'],
    );
  }

  Map<String, dynamic> toJson() {
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
