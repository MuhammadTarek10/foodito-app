import 'package:dartz/dartz.dart' show Either, Left, Right;
import 'package:foodito/core/errors/failure.dart';
import 'package:foodito/features/home/offline/data/datasource/local_datasource.dart';
import 'package:foodito/features/home/offline/domain/entities/order.dart';
import 'package:foodito/features/home/offline/domain/repositories/list_repository.dart';

class ListRepositoryImplementer implements ListRepository {
  final ListDataSource dataSource;

  const ListRepositoryImplementer({required this.dataSource});

  @override
  Future<Either<Failure, bool>> addOrder(Order order) async {
    try {
      await dataSource.addOrder(order);
      return const Right(true);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteOrder(Order order) async {
    try {
      await dataSource.deleteOrder(order);
      return const Right(true);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> editOrder(Order order) async {
    try {
      await dataSource.editOrder(order);
      return const Right(true);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, List<Order>>> getOrders() async {
    try {
      final orders = await dataSource.getOrders();
      return Right(orders);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
