import 'package:flutter/material.dart';
import 'package:news_app/app/navigation/routes.dart';
import 'package:news_app/base/base_widget.dart';
import 'package:news_app/di/app/feature_module.dart';
import 'package:news_app/feature/splash/splash_view_model.dart';
import 'package:news_app/generated/l10n.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseWidget<SplashViewModel>(
        providerBase: splashViewModelProvider,
        builder: (context, model, child) {
          return StreamBuilder<int>(
            initialData: 0,
            stream: model?.splashProgress,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == 1) {
                  Navigator.pushReplacementNamed(context, RoutePaths.NewsList);
                }
              }

              return Center(child: Text(S.of(context).welcomeMessage));
            },
          );
        },
      ),
    );
  }
}
