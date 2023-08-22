import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/features/home/offline/presentation/views/orders_view.dart';
import 'package:foodito/features/home/online/presentation/views/room/rooms_view.dart';
import 'package:foodito/features/home/presentation/views/profile/profile_view.dart';

enum BottomNavigationBarOption {
  profile,
  online,
  offline,
}

class BottomNavigationStateNotifier
    extends StateNotifier<BottomNavigationBarOption> {
  final PageController pageController;
  final views = [
    const ProfileView(),
    const RoomsView(),
    const OrdersView(),
  ];
  BottomNavigationStateNotifier({required this.pageController})
      : super(BottomNavigationBarOption.online);

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
