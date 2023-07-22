import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/features/home/presentation/views/main/state/notifiers/bottom_navigation_bar_notifier.dart';
import 'package:foodito/features/home/presentation/views/main/state/providers/bottom_navigation_bar_provider.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final option = ref.watch(bottomNavigationProvider);
    final views = ref.read(bottomNavigationProvider.notifier).views;
    final controller =
        ref.read(bottomNavigationProvider.notifier).pageController;
    return Scaffold(
      body: MainBody(views: views, controller: controller),
      bottomNavigationBar: CustomNavigationBar(option: option, ref: ref),
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({
    super.key,
    required this.views,
    required this.controller,
  });

  final List<Widget> views;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) => views[index % views.length],
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    required this.option,
    required this.ref,
  });

  final BottomNavigationBarOption option;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      color: context.colorScheme.background,
      buttonBackgroundColor: context.colorScheme.primary,
      index: option.index,
      animationCurve: Curves.easeInOut,
      items: const [
        Icon(Icons.person),
        Icon(Icons.home),
        Icon(Icons.inbox),
      ],
      onTap: (index) => ref
          .read(bottomNavigationProvider.notifier)
          .changeNavigation(BottomNavigationBarOption.values[index]),
    );
  }
}
