import 'package:foodito/features/home/online/domain/entities/add_order.dart';
import 'package:foodito/features/home/online/domain/entities/order.dart';

abstract class SocketRepository {
  void addOrder(AddOrder order);
  Future<List<Order>> getOrders();
}
