import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/app/app_viewmodel.dart';
import 'package:news_app/app/navigation/router.dart';
import 'package:news_app/app/navigation/routes.dart';
import 'package:news_app/base/base_widget.dart';
import 'package:news_app/di/app/app_module.dart';
import 'package:news_app/generated/l10n.dart';

GlobalKey<NavigatorState> appLevelKey = GlobalKey(debugLabel: 'app-key');

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseWidget<AppViewModel>(
      providerBase: appViewModelProvider,
      builder: (context, model, child) {
        return MaterialApp(
          navigatorKey: appLevelKey,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: S.delegate.supportedLocales,
          onGenerateTitle: (context) => S.of(context).appName,
          debugShowCheckedModeBanner: false,
          initialRoute: RoutePaths.Splash,
          onGenerateRoute: NewsRouter.onGenerateRoute,
        );
      },
    );
  }
}
