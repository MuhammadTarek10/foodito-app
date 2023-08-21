import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/config/utils/constants.dart';
import 'package:foodito/core/di.dart';
import 'package:foodito/features/home/online/data/repositories/socket_repository_implementer.dart';
import 'package:foodito/features/home/online/domain/entities/add_order.dart';
import 'package:foodito/features/home/online/domain/entities/order.dart';

final remoteOrderProvider =
    StreamProvider.family.autoDispose<List<Order>, String>(
  (ref, roomId) {
    final StreamController controller = StreamController<List<Order>>();
    final socketRepository = instance<SocketRepositoryImplementer>();

    socketRepository.client.socket!.emit(AppConstants.joinRoom, roomId);
    socketRepository.client.socket!.emit(AppConstants.getOrders, roomId);

    socketRepository.client.socket!.on(AppConstants.doneOrders, (data) {
      controller.add((data as List).map((e) => Order.fromJson(e)).toList());
    });

    return controller.stream as Stream<List<Order>>;
  },
);

void addOrderProvider(AddOrder order, int quantity) {
  final socketRepository = instance<SocketRepositoryImplementer>();
  for (int i = 0; i < quantity; i++) {
    socketRepository.client.socket!.emit(AppConstants.addOrder, order.toJson());
  }
}

void leaveRoomProvider(String roomId) {
  final socketRepository = instance<SocketRepositoryImplementer>();
  socketRepository.client.socket!.emit(AppConstants.leaveRoom, roomId);
}
