import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/config/utils/values.dart';
import 'package:foodito/features/auth/domain/entities/user.dart';
import 'package:foodito/features/home/online/domain/entities/food.dart';
import 'package:foodito/features/home/online/domain/entities/order.dart';
import 'package:foodito/features/home/online/domain/entities/room.dart';
import 'package:foodito/features/home/online/presentation/state/providers/food_socket_provider.dart';
import 'package:foodito/features/home/online/presentation/state/providers/members_provider.dart';
import 'package:foodito/features/home/online/presentation/state/providers/order_socket_provider.dart';
import 'package:foodito/features/home/online/presentation/state/providers/user_provider.dart';
import 'package:foodito/features/home/online/presentation/views/room/widgets/food_dialog.dart';
import 'package:foodito/features/home/online/presentation/views/room/widgets/food_widget.dart';
import 'package:foodito/features/home/online/presentation/views/room/widgets/order_widget.dart';
import 'package:foodito/features/home/online/presentation/views/room/widgets/user_widget.dart';

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
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildOrders(ordersStream, userId.toString()),
            _buildFood(foodStream, userId.toString()),
            _buildMembers(membersStream),
          ],
        ),
      ),
    );
  }

  Widget _buildOrders(AsyncValue<List<Order>> ordersStream, String userId) {
    return ordersStream.when(
      data: (data) {
        return data.isEmpty
            ? Container()
            : ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final order = data[index];
                  return OrderWidget(
                    index: index,
                    order: order,
                    isAdmin: widget.room.isAdmin || order.userId == userId,
                    onEdit: (order) {},
                    onDelete: (order) => deleteOrderProvider(
                      order.id.toString(),
                      widget.room.id.toString(),
                    ),
                  );
                },
              );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => const Text('Error'),
    );
  }

  Widget _buildFood(AsyncValue<List<Food>> foodStream, String userId) {
    return foodStream.when(
      data: (data) {
        return Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                ),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final food = data[index];
                  return FoodWidget(
                    food: food,
                    roomId: widget.room.id.toString(),
                    userId: userId,
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: AppSizes.s20,
                vertical: AppSizes.s14,
              ),
              child: ElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AddFoodDialog(
                    userId: userId,
                    roomId: widget.room.id.toString(),
                    onAdd: (food) => addFoodProvider(food),
                  ),
                ),
                child: Text(AppStrings.add.tr()),
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => const Text('Error'),
    );
  }

  Widget _buildMembers(AsyncValue<List<User>> membersStream) {
    return membersStream.when(
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
    );
  }
}
