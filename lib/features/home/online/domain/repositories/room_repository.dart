import 'package:dartz/dartz.dart' show Either;
import 'package:foodito/core/errors/failure.dart';
import 'package:foodito/features/home/online/domain/entities/order.dart';
import 'package:foodito/features/home/online/domain/entities/room.dart';

abstract class RoomRepository {
  Future<Either<Failure, void>> addRoom(Room room);
  Future<Either<Failure, void>> deleteRoom(String id);
  Future<Either<Failure, Room>> editRoom(Room room);
  Future<Either<Failure, List<Room>>> getRooms();

  Future<Either<Failure, List<Order>>> enterRoom(String id);
  Future<Either<Failure, Room>> joinRoom(String code);
}
