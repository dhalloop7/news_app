import 'package:dartz/dartz.dart';
import 'package:news_app/data/entity/news_articles_entity.dart';
import 'package:news_app/domain/repository/news_repository.dart';
import 'package:news_app/domain/usecase/base_usecase.dart';

class FetchNewsListUseCase extends BaseUseCase<BaseError,
    FetchNewsListUseCaseParams, List<NewsArticleEntity>> {
  final NewsRepository _repository;

  FetchNewsListUseCase(this._repository);

  @override
  Future<Either<BaseError, List<NewsArticleEntity>>> execute(
      {required FetchNewsListUseCaseParams params}) {
    return _repository.fetchNewsList();
  }
}

class FetchNewsListUseCaseParams extends Params {
  @override
  Either<BaseError, bool> verify() {
    return const Right(true);
  }
}
