import 'package:foodito/core/network/client.dart';
import 'package:foodito/features/home/online/data/apis/requests/food_requests.dart';
import 'package:foodito/features/home/online/data/apis/responses/food_responses.dart';

abstract class FoodDataSource {
  Future<void> addFood(String roomId, String name, double price);
  Future<GetFoodsResponse> getFoodInRoom(String roomId);
}

class FoodDataSourceImplementer implements FoodDataSource {
  final AppServiceClient client;

  FoodDataSourceImplementer({required this.client});

  @override
  Future<void> addFood(String roomId, String name, double price) async {
    return await client.addFood(
      AddFoodRequest(
        roomId: roomId,
        name: name,
        price: price,
      ),
    );
  }

  @override
  Future<GetFoodsResponse> getFoodInRoom(String roomId) async {
    return await client.getFoodInRoom(roomId);
  }
}
