import 'package:intl/intl.dart';
import 'package:newsapp/model/source.dart';

class NewsModel {
  final String title;
  final String description;
  final String content;
  final String url;
  final String image;
  final String publishedAt;
  final Source source;

  NewsModel({
    required this.title,
    required this.description,
    required this.content,
    required this.url,
    required this.image,
    required this.publishedAt,
    required this.source,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    String formattedPublishedAt = formatDate(json['publishedAt']);

    return NewsModel(
      title: json['title'],
      description: json['description'],
      content: json['content'],
      url: json['url'],
      image: json['image'],
      publishedAt: formattedPublishedAt,
      source: Source.fromJson(json['source']),
    );
  }

  static String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
}
