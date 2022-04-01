import 'package:dio/dio.dart';
import 'package:news_app/data/data_constant.dart';
import 'package:news_app/data/entity/news_list_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET(
      "everything?q=apple&from=2022-03-31&to=2022-03-31&sortBy=popularity&apiKey=${DataConstant.API_KEY}")
  Future<HttpResponse<NewsListEntity>> fetchNewsList();
}
