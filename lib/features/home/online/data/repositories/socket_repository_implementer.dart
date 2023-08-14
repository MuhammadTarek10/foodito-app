import 'package:foodito/config/utils/constants.dart';
import 'package:foodito/core/network/socket.dart';
import 'package:foodito/features/home/online/domain/entities/add_food.dart';
import 'package:foodito/features/home/online/domain/entities/add_order.dart';
import 'package:foodito/features/home/online/domain/repositories/socket_repository.dart';

class SocketRepositoryImplementer implements SocketRepository {
  final SocketClient client;

  SocketRepositoryImplementer({required this.client});

  @override
  void addOrder(AddOrder order) {
    client.socket!.emit(AppConstants.addOrder, order.toJson());
  }

  @override
  void addFood(AddFood food) {
    client.socket!.emit(AppConstants.addFood, food.toJson());
  }
}
