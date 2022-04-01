import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/di/usecase/news_module.dart';
import 'package:news_app/feature/news_list/new_list_view_model.dart';
import 'package:news_app/feature/splash/splash_view_model.dart';

final splashViewModelProvider =
    ChangeNotifierProvider.autoDispose<SplashViewModel>(
  (ref) {
    return SplashViewModel();
  },
);

final newsListViewModelProvider =
    ChangeNotifierProvider.autoDispose<NewsListViewModel>(
  (ref) {
    return NewsListViewModel(ref.read(fetchNewsListUseCaseProvider));
  },
);
