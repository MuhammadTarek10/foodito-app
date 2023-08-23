import 'dart:ffi';

import 'package:dartz/dartz.dart' show Either, Right, Left;
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/core/network/error/failure.dart';
import 'package:foodito/core/network/network_info.dart';
import 'package:foodito/core/prefs.dart';
import 'package:foodito/features/home/online/data/apis/responses/room_responses.dart';
import 'package:foodito/features/home/online/data/datasource/room_datasource.dart';
import 'package:foodito/features/home/online/domain/entities/order.dart';
import 'package:foodito/features/home/online/domain/entities/room.dart';
import 'package:foodito/features/home/online/domain/repositories/room_repository.dart';

class RoomRepositoryImplementer implements RoomRepository {
  final AppPreferences prefs;
  final RoomDatasource datasource;
  final NetworkInfo networkInfo;

  RoomRepositoryImplementer({
    required this.prefs,
    required this.datasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, void>> addRoom(Room room) async {
    if (await networkInfo.isConnected) {
      try {
        await datasource.addRoom(room.name, room.code);
        // ignore: void_checks
        return const Right(Void);
      } catch (e) {
        return Left(Failure(500, AppStrings.internal));
      }
    } else {
      return Left(Failure(500, AppStrings.noInternet));
    }
  }

  @override
  Future<Either<Failure, void>> deleteRoom(String id) async {
    if (await networkInfo.isConnected) {
      try {
        await datasource.deleteRoom(id);
        // ignore: void_checks
        return const Right(Void);
      } catch (e) {
        return Left(Failure(500, AppStrings.internal));
      }
    } else {
      return Left(Failure(500, AppStrings.noInternet));
    }
  }

  @override
  Future<Either<Failure, Room>> editRoom(Room room) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await datasource.editRoom(room.id!, room.name, room.code);
        return Right(response.toDomain());
      } catch (e) {
        return Left(Failure(500, AppStrings.internal));
      }
    } else {
      return Left(Failure(500, AppStrings.noInternet));
    }
  }

  @override
  Future<Either<Failure, List<Room>>> getRooms() async {
    if (await networkInfo.isConnected) {
      try {
        final user = prefs.getUser();
        final response = await datasource.getRooms();
        return Right(
          response.rooms != null
              ? response.rooms!.map((e) => e.toDomain(user!.id!)).toList()
              : [],
        );
      } catch (e) {
        return Left(Failure(500, AppStrings.internal));
      }
    } else {
      return Left(Failure(500, AppStrings.noInternet));
    }
  }

  @override
  Future<Either<Failure, List<Order>>> enterRoom(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await datasource.enterRoom(id);
        final orders = response.orders != null
            ? response.orders!.map((e) => e.toDomain()).toList()
            : [];
        return Right(orders as List<Order>);
      } catch (e) {
        return Left(Failure(500, AppStrings.internal));
      }
    } else {
      return Left(Failure(500, AppStrings.noInternet));
    }
  }

  @override
  Future<Either<Failure, Room>> joinRoom(String code) async {
    if (await networkInfo.isConnected) {
      try {
        final user = prefs.getUser();
        final response = await datasource.joinRoom(code);
        return Right(response.toDomain(user!.id!));
      } catch (e) {
        return Left(Failure(500, AppStrings.internal));
      }
    } else {
      return Left(Failure(500, AppStrings.noInternet));
    }
  }
}
