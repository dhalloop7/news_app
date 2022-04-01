import 'package:dartz/dartz.dart';
import 'package:news_app/data/entity/news_articles_entity.dart';
import 'package:news_app/data/source/news_remote_source.dart';
import 'package:news_app/domain/repository/news_repository.dart';
import 'package:news_app/domain/usecase/base_usecase.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsRemoteSource _remoteDs;

  NewsRepositoryImpl(this._remoteDs);

  @override
  Future<Either<BaseError, List<NewsArticleEntity>>> fetchNewsList() async {
    final result = await _remoteDs.fetchNewsList();

    if (result.response.statusCode != 200) {
      return Left(NetworkError(cause: Exception("Something Went Wrong")));
    }

    return Right(result.data.newsArticles);
  }
}
