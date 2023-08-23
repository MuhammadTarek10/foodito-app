import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/core/state/notifiers/loading_notifier.dart';

final loadingProvider = StateNotifierProvider<LoadingStateNotifier, bool>(
  (_) => LoadingStateNotifier(),
);
