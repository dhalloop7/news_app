import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/app/app_viewmodel.dart';

final appViewModelProvider = Provider.autoDispose<AppViewModel>(
  (ref) {
    return AppViewModel();
  },
);
