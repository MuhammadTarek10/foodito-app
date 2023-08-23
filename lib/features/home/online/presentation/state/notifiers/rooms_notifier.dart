import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/core/di.dart';
import 'package:foodito/core/errors/failure.dart';
import 'package:foodito/features/home/online/data/repositories/room_repository_implementer.dart';
import 'package:foodito/features/home/online/domain/entities/room.dart';
import 'package:foodito/features/home/online/domain/repositories/room_repository.dart';

class RoomsNotifier extends StateNotifier<Either<Failure, List<Room>?>> {
  final RoomRepository roomRepository = instance<RoomRepositoryImplementer>();

  RoomsNotifier() : super(const Right(null));

  Future<Either<Failure, List<Room>?>> getRooms() async {
    state = await roomRepository.getRooms();
    return state;
  }

  Future<bool> addRoom(String name, String code) async {
    final result = await roomRepository
        .addRoom(Room(name: name, code: code))
        .then((value) => getRooms());
    return result.fold((l) => false, (r) => true);
  }

  Future<void> editRoom(Room room) async {
    await roomRepository.editRoom(room);
  }

  Future<Room?> joinRoom(String code) async {
    return (await roomRepository.joinRoom(code)).fold(
      (l) => null,
      (room) => room,
    );
  }

  Future<void> deleteRoom(Room room) async {
    await roomRepository.deleteRoom(room.id.toString());
  }
}
