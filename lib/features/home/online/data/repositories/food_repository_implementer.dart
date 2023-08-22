import 'package:dartz/dartz.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/core/network/error/failure.dart';
import 'package:foodito/core/network/network_info.dart';
import 'package:foodito/core/prefs.dart';
import 'package:foodito/features/home/online/data/datasource/food_datasource.dart';
import 'package:foodito/features/home/online/domain/entities/food.dart';
import 'package:foodito/features/home/online/domain/repositories/food_repository.dart';

class FoodRepositoryImplementer implements FoodRepository {
  final NetworkInfo networkInfo;
  final FoodDataSource dataSource;
  final AppPreferences prefs;

  FoodRepositoryImplementer({
    required this.networkInfo,
    required this.dataSource,
    required this.prefs,
  });

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

  @override
  Future<Either<Failure, void>> deleteFood(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await dataSource.deleteFood(id);
        return Right(response);
      } catch (e) {
        return Left(Failure(500, AppStrings.unknownError));
      }
    } else {
      return Left(Failure(500, AppStrings.noInternet));
    }
  }
}
