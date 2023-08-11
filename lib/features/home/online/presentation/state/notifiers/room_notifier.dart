import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/core/di.dart';
import 'package:foodito/features/home/online/data/repositories/room_repository_implementer.dart';
import 'package:foodito/features/home/online/domain/entities/room.dart';
import 'package:foodito/features/home/online/domain/repositories/room_repository.dart';

class RoomNotifier extends StateNotifier<Room?> {
  final RoomRepository roomRepository = instance<RoomRepositoryImplementer>();
  RoomNotifier() : super(null);

  Future<void> getRoom(String id) async {
    final result = await roomRepository.getRoomById(id);
    result.fold(
      (failure) => state = null,
      (room) => state = room,
    );
  }
}
