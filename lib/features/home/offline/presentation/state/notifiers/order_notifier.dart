import 'package:dartz/dartz.dart' show Either;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/core/di.dart';
import 'package:foodito/core/errors/failure.dart';
import 'package:foodito/features/home/offline/data/repositories/list_repository_implementer.dart';
import 'package:foodito/features/home/offline/domain/entities/order.dart';
import 'package:foodito/features/home/offline/domain/repositories/list_repository.dart';

class OrderNotifier extends StateNotifier<Either<Failure, List<Order>>?> {
  final ListRepository repo = instance<ListRepositoryImplementer>();
  OrderNotifier() : super(null) {
    getOrders();
  }

  Future<void> addOrder(Order order) async {
    await repo.addOrder(order);
    state = await repo.getOrders();
  }

  Future<void> deleteOrder(Order order) async {
    await repo.deleteOrder(order);
    state = await repo.getOrders();
  }

  Future<void> editOrder(Order order) async {
    await repo.editOrder(order);
    state = await repo.getOrders();
  }

  Future<void> getOrders() async {
    state = await repo.getOrders();
  }
}
