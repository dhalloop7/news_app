import 'dart:async';

import 'package:news_app/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

class SplashViewModel extends BaseViewModel {
  final PublishSubject<int> _splashProgress = PublishSubject();

  Stream<int> get splashProgress => _splashProgress.stream;

  SplashViewModel() {
    startSplashProgress();
  }

  void startSplashProgress() {
    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        if (timer.tick == 3) {
          _splashProgress.add(1);
          timer.cancel();
        }
      },
    );
  }

  @override
  void dispose() {
    _splashProgress.close();
    super.dispose();
  }
}
