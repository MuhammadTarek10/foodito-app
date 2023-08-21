import 'package:dartz/dartz.dart';
import 'package:foodito/core/network/error/failure.dart';
import 'package:foodito/features/home/online/data/datasource/food_datasource.dart';
import 'package:foodito/features/home/online/domain/entities/food.dart';
import 'package:foodito/features/home/online/domain/repositories/food_repository.dart';

class FoodRepositoryImplementer implements FoodRepository {
  final FoodDataSource dataSource;

  FoodRepositoryImplementer({required this.dataSource});

  @override
  Future<void> addFood(String roomId, String name, double price) {
    // TODO: implement addFood
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Food>>> getFoodInRoom(String roomId) {
    // TODO: implement getFoodInRoom
    throw UnimplementedError();
  }
}
