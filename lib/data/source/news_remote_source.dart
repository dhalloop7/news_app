import 'package:news_app/data/entity/news_list_entity.dart';
import 'package:news_app/data/network/api_service.dart';
import 'package:retrofit/dio.dart';

abstract class NewsRemoteSource {
  Future<HttpResponse<NewsListEntity>> fetchNewsList();
}

class NewsRemoteDataSourceImpl extends NewsRemoteSource {
  final ApiService _service;

  NewsRemoteDataSourceImpl(this._service);

  @override
  Future<HttpResponse<NewsListEntity>> fetchNewsList() {
    return _service.fetchNewsList();
  }
}
