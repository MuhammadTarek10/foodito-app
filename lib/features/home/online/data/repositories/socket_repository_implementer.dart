import 'dart:developer';

import 'package:foodito/config/utils/constants.dart';
import 'package:foodito/core/network/socket.dart';
import 'package:foodito/features/home/online/domain/entities/add_order.dart';
import 'package:foodito/features/home/online/domain/entities/order.dart';
import 'package:foodito/features/home/online/domain/repositories/socket_repository.dart';

class SocketRepositoryImplementer implements SocketRepository {
  final SocketClient client;

  SocketRepositoryImplementer({required this.client});

  @override
  void addOrder(AddOrder order) {
    log(order.toJson().toString());
    client.socket!.emit(AppConstants.addOrder, order.toJson());
  }

  @override
  Future<List<Order>> getOrders() async {
    List<Order> orders = [];
    client.socket!.emit(AppConstants.getOrders);
    client.socket!.on(AppConstants.getOrders, (data) {
      orders = (data as List).map((e) => Order.fromJson(e)).toList();
    });
    return orders;
  }
}
