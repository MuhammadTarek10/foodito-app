import 'package:dartz/dartz.dart' show Either, Left, Right;
import 'package:easy_localization/easy_localization.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/core/network/error/failure.dart';
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
      return Left(Failure(500, AppStrings.internal.tr()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteOrder(Order order) async {
    try {
      await dataSource.deleteOrder(order);
      return const Right(true);
    } catch (e) {
      return Left(Failure(500, AppStrings.internal.tr()));
    }
  }

  @override
  Future<Either<Failure, bool>> editOrder(Order order) async {
    try {
      await dataSource.editOrder(order);
      return const Right(true);
    } catch (e) {
      return Left(Failure(500, AppStrings.internal.tr()));
    }
  }

  @override
  Future<Either<Failure, List<Order>>> getOrders() async {
    try {
      final orders = await dataSource.getOrders();
      return Right(orders);
    } catch (e) {
      return Left(Failure(500, AppStrings.internal.tr()));
    }
  }
}
