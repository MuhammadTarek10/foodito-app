import 'package:foodito/features/home/online/domain/entities/add_food.dart';
import 'package:foodito/features/home/online/domain/entities/add_order.dart';

abstract class SocketRepository {
  void addOrder(AddOrder order);
  void addFood(AddFood food);
}
