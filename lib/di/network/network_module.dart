import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/data_constant.dart';
import 'package:news_app/data/network/api_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod/riverpod.dart';

final baseOptions =
    Provider<BaseOptions>((ref) => BaseOptions(baseUrl: DataConstant.BASE_URL));

final prettyDioLoggerProvider = Provider<PrettyDioLogger>(
  (ref) => PrettyDioLogger(
    request: true,
    requestBody: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: true,
    logPrint: (log) {
      return debugPrint(log as String);
    },
  ),
);

final dioProvider = Provider<Dio>(
  (ref) {
    Dio dio = Dio(ref.read(baseOptions));
    dio.interceptors.add(
      ref.read(prettyDioLoggerProvider),
    );
    return dio;
  },
);

final apiServiceProvider = Provider<ApiService>(
  (ref) => ApiService(ref.read(dioProvider), baseUrl: DataConstant.BASE_URL),
);
