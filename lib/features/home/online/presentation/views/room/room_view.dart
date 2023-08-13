import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/features/home/online/domain/entities/add_order.dart';
import 'package:foodito/features/home/online/domain/entities/order.dart';
import 'package:foodito/features/home/online/domain/entities/room.dart';
import 'package:foodito/features/home/online/presentation/state/providers/order_provider.dart';
import 'package:foodito/features/home/online/presentation/state/providers/user_provider.dart';
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

class _RoomViewState extends ConsumerState<RoomView> {
  List<Order> orders = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    leaveRoomProvider(widget.room.id!);
  }

  @override
  Widget build(BuildContext context) {
    final ordersStream = ref.watch(remoteOrderProvider(widget.room.id!));
    final userId = ref.watch(userIdProvider);
    ordersStream.when(
      data: (data) => orders = data,
      loading: () {},
      error: (error, stackTrace) {},
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.room.name),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addOrderProvider(
          AddOrder(
            userId: userId.toString(),
            foodId: 1.toString(),
            roomId: widget.room.id!,
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: ordersStream.when(
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
    );
  }
}
