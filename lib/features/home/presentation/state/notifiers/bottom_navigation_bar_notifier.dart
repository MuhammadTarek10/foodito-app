import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/features/home/presentation/views/home_view.dart';
import 'package:foodito/features/home/presentation/views/inbox_view.dart';
import 'package:foodito/features/home/presentation/views/profile_view.dart';

enum BottomNavigationBarOption {
  profile,
  home,
  inbox,
}

class BottomNavigationStateNotifier
    extends StateNotifier<BottomNavigationBarOption> {
  final PageController pageController;
  final views = [
    const ProfileView(),
    const HomeView(),
    const InboxView(),
  ];
  BottomNavigationStateNotifier({required this.pageController})
      : super(BottomNavigationBarOption.home);

  void changeNavigation(BottomNavigationBarOption option) {
    state = option;
    pageController.animateToPage(
      option.index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void immediateChange(BottomNavigationBarOption option) {
    state = option;
    pageController.jumpToPage(option.index);
  }
}
