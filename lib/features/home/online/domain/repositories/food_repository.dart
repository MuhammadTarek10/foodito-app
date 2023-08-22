import 'package:dartz/dartz.dart';
import 'package:foodito/core/network/error/failure.dart';
import 'package:foodito/features/home/online/domain/entities/food.dart';

abstract class FoodRepository {
  Future<void> addFood(String roomId, String name, double price);
  Future<Either<Failure, List<Food>>> getFoodInRoom(String roomId);
  Future<Either<Failure, void>> deleteFood(String id);
}
