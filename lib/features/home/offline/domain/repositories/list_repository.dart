import 'package:dartz/dartz.dart' show Either;
import 'package:foodito/core/network/error/failure.dart';
import 'package:foodito/features/home/offline/domain/entities/order.dart';

abstract class ListRepository {
  Future<Either<Failure, List<Order>>> getOrders();
  Future<Either<Failure, void>> addOrder(Order order);
  Future<Either<Failure, void>> deleteOrder(Order order);
  Future<Either<Failure, void>> editOrder(Order order);
}
