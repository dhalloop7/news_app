import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/source/news_remote_source.dart';
import 'package:news_app/di/network/network_module.dart';

final newsRemoteDataProvider = Provider<NewsRemoteSource>(
  (ref) {
    return NewsRemoteDataSourceImpl(ref.read(apiServiceProvider));
  },
);
