// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_articles_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsArticleEntity _$NewsArticleEntityFromJson(Map<String, dynamic> json) =>
    NewsArticleEntity(
      json['title'] as String,
      json['urlToImage'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$NewsArticleEntityToJson(NewsArticleEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'urlToImage': instance.urlToImage,
      'url': instance.url,
    };
