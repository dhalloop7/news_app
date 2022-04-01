// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsListEntity _$NewsListEntityFromJson(Map<String, dynamic> json) =>
    NewsListEntity(
      json['status'] as String,
      (json['articles'] as List<dynamic>)
          .map((e) => NewsArticleEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsListEntityToJson(NewsListEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'articles': instance.newsArticles,
    };
