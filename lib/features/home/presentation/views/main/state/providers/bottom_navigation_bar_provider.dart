import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/features/home/presentation/views/main/state/notifiers/bottom_navigation_bar_notifier.dart';

final bottomNavigationProvider = StateNotifierProvider<
    BottomNavigationStateNotifier, BottomNavigationBarOption>(
  (_) => BottomNavigationStateNotifier(
      pageController: PageController(initialPage: 1)),
);
