import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/utils/assets.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/config/utils/values.dart';
import 'package:foodito/features/auth/domain/entities/user.dart';
import 'package:foodito/features/home/online/domain/entities/room.dart';
import 'package:foodito/features/home/online/presentation/state/providers/food_provider.dart';
import 'package:foodito/features/home/online/presentation/state/providers/members_provider.dart';
import 'package:foodito/features/home/online/presentation/state/providers/order_provider.dart';
import 'package:foodito/features/home/online/presentation/state/providers/user_provider.dart';
import 'package:foodito/features/home/online/presentation/views/room/widgets/food_widget.dart';
import 'package:foodito/features/home/online/presentation/views/room/widgets/order_widget.dart';

class RoomView extends ConsumerStatefulWidget {
  const RoomView({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoomViewState();
}

class _RoomViewState extends ConsumerState<RoomView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    leaveRoomProvider(widget.room.id!);
  }

  @override
  Widget build(BuildContext context) {
    final ordersStream = ref.watch(remoteOrderProvider(widget.room.id!));
    final foodStream = ref.watch(remoteFoodProvider(widget.room.id!));
    final membersStream = ref.watch(membersProvider(widget.room.id!));
    final userId = ref.watch(userIdProvider);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.room.name),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: AppStrings.orders.tr()),
              Tab(text: AppStrings.food.tr()),
              Tab(text: AppStrings.members.tr()),
            ],
            labelColor: context.colorScheme.onSecondary,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_tabController.index == 0) log("orders");
            if (_tabController.index == 1) log("food");
            if (_tabController.index == 2) log("members");
          },
          child: const Icon(Icons.add),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ordersStream.when(
              data: (data) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final order = data[index];
                    return OrderWidget(
                      index: index,
                      order: order,
                      isAdmin: widget.room.isAdmin || order.userId == userId,
                      onEdit: (order) {},
                      onDelete: (order) {},
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => const Text('Error'),
            ),
            foodStream.when(
              data: (data) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                  ),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final food = data[index];
                    return FoodWidget(food: food);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => const Text('Error'),
            ),
            membersStream.when(
              data: (data) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final user = data[index];
                    return UserWidget(user: user);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => const Text('Error'),
            ),
          ],
        ),
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: context.colorScheme.background,
          borderRadius: BorderRadius.circular(AppSizes.s8),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.onBackground.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ]),
      child: ListTile(
        leading: const Icon(Icons.people),
        title: Text(user.name),
        trailing: SvgPicture.asset(AppAssets.delete),
      ),
    );
  }
}
