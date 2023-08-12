import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/core/di.dart';
import 'package:foodito/features/home/online/data/repositories/socket_repository_implementer.dart';
import 'package:foodito/features/home/online/domain/entities/add_order.dart';
import 'package:foodito/features/home/online/domain/entities/order.dart';
import 'package:foodito/features/home/online/domain/entities/room.dart';
import 'package:foodito/features/home/online/presentation/state/providers/order_provider.dart';

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
  final socketRepository = instance<SocketRepositoryImplementer>();
  List<Order> orders = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ordersStream = ref.watch(remoteOrderProvider(widget.room.id!));
    ordersStream.when(
      data: (data) => orders = data,
      loading: () => log("Loading"),
      error: (error, stackTrace) => log("Error"),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.room.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text(orders.length.toString()),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => socketRepository.addOrder(
                const AddOrder(
                  userId: "1",
                  foodId: "1",
                  roomId: "1",
                ),
              ),
              child: const Text("Add Order"),
            ),
          ),
        ],
      ),
    );
  }
}
