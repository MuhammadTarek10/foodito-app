import 'package:foodito/config/extensions.dart';
import 'package:foodito/features/home/offline/domain/entities/order.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ListDataSource {
  Future<List<Order>> getOrders();
  Future<void> addOrder(Order order);
  Future<void> deleteOrder(Order order);
  Future<void> editOrder(Order order);
}

class ListDataSourceImplementer implements ListDataSource {
  final Box box;

  ListDataSourceImplementer({required this.box});

  @override
  Future<void> addOrder(Order order) async {
    await box.add(order);
  }

  @override
  Future<void> deleteOrder(Order order) async {
    box.delete(box.getKeyById(order.id));
  }

  @override
  Future<void> editOrder(Order order) async {
    await box.put(
      box.getKeyById(order.id),
      order.copyWith(person: "Edited"),
    );
  }

  @override
  Future<List<Order>> getOrders() async {
    return box.values.toList().cast<Order>();
  }
}
