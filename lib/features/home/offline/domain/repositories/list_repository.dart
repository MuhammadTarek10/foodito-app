import 'package:dartz/dartz.dart' show Either;
import 'package:foodito/core/errors/failure.dart';
import 'package:foodito/features/home/offline/domain/entities/order.dart';

abstract class ListRepository {
  Future<Either<Failure, List<Order>>> getOrders();
  Future<Either<Failure, bool>> addOrder(Order order);
  Future<Either<Failure, bool>> deleteOrder(Order order);
  Future<Either<Failure, bool>> editOrder(Order order);
}
