import 'package:json_annotation/json_annotation.dart';

part "news_articles_entity.g.dart";

@JsonSerializable()
class NewsArticleEntity {
  final String title;
  final String urlToImage;
  final String url;

  NewsArticleEntity(this.title, this.urlToImage, this.url);

  factory NewsArticleEntity.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NewsArticleEntityToJson(this);
}
