import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/core/di.dart';
import 'package:foodito/features/home/online/data/repositories/room_repository_implementer.dart';
import 'package:foodito/features/home/online/domain/entities/room.dart';
import 'package:foodito/features/home/online/domain/repositories/room_repository.dart';

class RoomsNotifier extends StateNotifier<List<Room>?> {
  final RoomRepository roomRepository = instance<RoomRepositoryImplementer>();

  RoomsNotifier() : super(null) {
    getRooms();
  }

  Future<void> getRooms() async {
    final result = await roomRepository.getRooms();
    result.fold(
      (failure) => state = null,
      (rooms) => state = rooms,
    );
  }

  Future<void> addRoom(String name, String code) async {
    await roomRepository.addRoom(Room(name: name, code: code)).then(
          (value) => getRooms(),
        );
  }

  Future<void> editRoom(String id, String name, String code) async {
    await roomRepository.editRoom(Room(id: id, name: name, code: code)).then(
          (value) => getRooms(),
        );
  }

  Future<void> deleteRoom(String id) async {
    await roomRepository.deleteRoom(id).then(
          (value) => getRooms(),
        );
  }
}
