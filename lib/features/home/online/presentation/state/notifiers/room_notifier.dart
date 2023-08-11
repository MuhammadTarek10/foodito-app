import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/core/di.dart';
import 'package:foodito/features/home/online/data/repositories/room_repository_implementer.dart';
import 'package:foodito/features/home/online/domain/entities/order.dart';
import 'package:foodito/features/home/online/domain/repositories/room_repository.dart';

class RoomNotifier extends StateNotifier<List<Order>?> {
  final RoomRepository roomRepository = instance<RoomRepositoryImplementer>();
  RoomNotifier() : super(null);

  Future<void> enterRoom(String id) async {
    final result = await roomRepository.enterRoom(id);
    result.fold(
      (failure) => state = null,
      (order) => state = order,
    );
  }
}
