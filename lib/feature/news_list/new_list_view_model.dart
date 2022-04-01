import 'package:news_app/base/base_view_model.dart';
import 'package:news_app/data/entity/news_articles_entity.dart';
import 'package:news_app/domain/usecase/fetch_news_list.dart';
import 'package:rxdart/rxdart.dart';

class NewsListViewModel extends BaseViewModel {
  final FetchNewsListUseCase _newsListUseCase;
  final PublishSubject<FetchNewsListUseCaseParams> _newsListRequest =
      PublishSubject();
  final PublishSubject<List<NewsArticleEntity>> _newsListResponse =
      PublishSubject();

  Stream<List<NewsArticleEntity>> get newsStream => _newsListResponse.stream;

  NewsListViewModel(this._newsListUseCase) {
    _newsListRequest.listen((value) {
      _newsListUseCase.execute(params: value).asStream().listen((event) {
        event.fold((l) => null, (r) => _newsListResponse.add(r));
      });
    });
  }

  void fetchNews() {
    _newsListRequest.add(FetchNewsListUseCaseParams());
  }

  @override
  void dispose() {
    _newsListRequest.close();
    _newsListResponse.close();
    super.dispose();
  }
}
