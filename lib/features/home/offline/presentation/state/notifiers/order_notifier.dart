import 'package:dartz/dartz.dart' show Either;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/core/di.dart';
import 'package:foodito/core/network/error/failure.dart';
import 'package:foodito/features/home/offline/data/repositories/list_repository_implementer.dart';
import 'package:foodito/features/home/offline/domain/entities/order.dart';
import 'package:foodito/features/home/offline/domain/repositories/list_repository.dart';

class OrderNotifier extends StateNotifier<Either<Failure, List<Order>>?> {
  final ListRepository repo = instance<ListRepositoryImplementer>();
  OrderNotifier() : super(null) {
    getOrders();
  }

  void addOrder(Order order) {}

  void removeOrder(Order order) {}

  Future<void> getOrders() async {
    state = await repo.getOrders();
  }
}
