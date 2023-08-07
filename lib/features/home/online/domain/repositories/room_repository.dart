import 'package:dartz/dartz.dart';
import 'package:foodito/core/network/error/failure.dart';
import 'package:foodito/features/home/online/domain/entities/room.dart';

abstract class RoomRepository {
  Future<Either<Failure, Room>> addRoom(Room room);
  Future<Either<Failure, void>> deleteRoom(String id);
  Future<Either<Failure, Room>> editRoom(Room room);
  Future<Either<Failure, List<Room>>> getRooms();
}
