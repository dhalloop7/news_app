import 'package:flutter/material.dart';
import 'package:news_app/base/base_widget.dart';
import 'package:news_app/data/entity/news_articles_entity.dart';
import 'package:news_app/di/app/feature_module.dart';
import 'package:news_app/feature/news_list/new_list_view_model.dart';
import 'package:news_app/generated/l10n.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appName),
        centerTitle: true,
      ),
      body: BaseWidget<NewsListViewModel>(
          providerBase: newsListViewModelProvider,
          onModelReady: (model) {
            model.fetchNews();
          },
          builder: (context, model, child) {
            return StreamBuilder<List<NewsArticleEntity>>(
              stream: model?.newsStream,
              initialData: const [],
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasData) {
                  if (snapshot.data?.isNotEmpty ?? false) {
                    return ListView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                            constraints: const BoxConstraints(
                                maxWidth: 100, maxHeight: 100),
                            child: Image.network(
                                snapshot.data?[index].urlToImage ?? ""),
                          ),
                          title: Text(
                            snapshot.data?[index].title ?? "-",
                            maxLines: 2,
                          ),
                        );
                      },
                    );
                  } else {
                    Text(S.of(context).noDataFound);
                  }
                }

                return Center(child: Text(S.of(context).commonError));
              },
            );
          }),
    );
  }
}
