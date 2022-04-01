import 'package:dartz/dartz.dart';
import 'package:news_app/data/entity/news_articles_entity.dart';
import 'package:news_app/domain/usecase/base_usecase.dart';

abstract class NewsRepository {
  Future<Either<BaseError, List<NewsArticleEntity>>> fetchNewsList();
}
