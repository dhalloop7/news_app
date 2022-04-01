import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/data/entity/news_articles_entity.dart';

part "news_list_entity.g.dart";

@JsonSerializable()
class NewsListEntity {
  final String status;
  @JsonKey(name: "articles")
  final List<NewsArticleEntity> newsArticles;

  NewsListEntity(this.status, this.newsArticles);

  factory NewsListEntity.fromJson(Map<String, dynamic> json) =>
      _$NewsListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NewsListEntityToJson(this);
}
