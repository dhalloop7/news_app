import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/di/repository/repository_module.dart';
import 'package:news_app/domain/usecase/fetch_news_list.dart';

var fetchNewsListUseCaseProvider = Provider.autoDispose<FetchNewsListUseCase>(
  (ref) {
    return FetchNewsListUseCase(ref.read(newsRepositoryProvider));
  },
);
