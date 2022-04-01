import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/repository/news_repository_impl.dart';
import 'package:news_app/di/source/data_source_module.dart';
import 'package:news_app/domain/repository/news_repository.dart';

final newsRepositoryProvider = Provider<NewsRepository>(
  (ref) {
    return NewsRepositoryImpl(ref.read(newsRemoteDataProvider));
  },
);
