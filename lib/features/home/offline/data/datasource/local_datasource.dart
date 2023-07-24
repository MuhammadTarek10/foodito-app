import 'package:foodito/features/home/offline/domain/entities/order.dart';

abstract class ListDataSource {
  Future<List<Order>> getOrders();
  Future<void> addOrder(Order order);
  Future<void> deleteOrder(Order order);
  Future<void> editOrder(Order order);
}

class ListDataSourceImplementer implements ListDataSource {
  @override
  Future<void> addOrder(Order order) {
    // TODO: implement addOrder
    throw UnimplementedError();
  }

  @override
  Future<void> deleteOrder(Order order) {
    // TODO: implement deleteOrder
    throw UnimplementedError();
  }

  @override
  Future<void> editOrder(Order order) {
    // TODO: implement editOrder
    throw UnimplementedError();
  }

  @override
  Future<List<Order>> getOrders() {
    return Future.delayed(
      const Duration(seconds: 2),
      () => [
        const Order(
          id: "id",
          person: "Ahmed",
          name: "Fatta",
          price: 40,
          payed: 30,
          remaining: -10,
        ),
        const Order(
          id: "idd",
          person: "Mohamed",
          name: "Fatta",
          price: 40,
          payed: 40,
          remaining: 0,
        ),
        const Order(
          id: "idd",
          person: "Khalid",
          name: "Shrimp",
          price: 80,
          payed: 100,
          remaining: 20,
        ),
      ],
    );
  }
}
