import 'package:flutter/cupertino.dart';
import 'package:news_app/app/navigation/routes.dart';
import 'package:news_app/feature/news_details/news_details.dart';
import 'package:news_app/feature/news_list/news_list.dart';
import 'package:news_app/feature/splash/splash_page.dart';
import 'package:news_app/generated/l10n.dart';

class NewsRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Splash:
        return CupertinoPageRoute(
            builder: (context) => const SplashPage(),
            settings: const RouteSettings(name: RoutePaths.Splash));

      case RoutePaths.NewsList:
        return CupertinoPageRoute(
            builder: (context) => const NewsListPage(),
            settings: const RouteSettings(name: RoutePaths.NewsList));

      case RoutePaths.NewsDetails:
        return CupertinoPageRoute(
            builder: (context) => const NewsDetailsPage(),
            settings: const RouteSettings(name: RoutePaths.NewsDetails));

      default:
        return CupertinoPageRoute(
          builder: (context) {
            return Center(child: Text(S.of(context).pageNotFound));
          },
        );
    }
  }
}
