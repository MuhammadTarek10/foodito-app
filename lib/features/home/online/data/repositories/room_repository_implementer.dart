import 'dart:ffi';

import 'package:dartz/dartz.dart' show Either, Right, Left;
import 'package:dio/dio.dart';
import 'package:foodito/core/errors/failure.dart';
import 'package:foodito/core/errors/handler/error_handler.dart';
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
      } on DioException catch (e) {
        return Left(ErrorHandler.handle(e));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteRoom(String id) async {
    if (await networkInfo.isConnected) {
      try {
        await datasource.deleteRoom(id);
        // ignore: void_checks
        return const Right(Void);
      } on DioException catch (e) {
        return Left(ErrorHandler.handle(e));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, Room>> editRoom(Room room) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await datasource.editRoom(room.id!, room.name, room.code);
        return Right(response.toDomain());
      } on DioException catch (e) {
        return Left(ErrorHandler.handle(e));
      }
    } else {
      return Left(NoInternetFailure());
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
      } on DioException catch (e) {
        return Left(ErrorHandler.handle(e));
      }
    } else {
      return Left(NoInternetFailure());
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
      } on DioException catch (e) {
        return Left(ErrorHandler.handle(e));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, Room>> joinRoom(String code) async {
    if (await networkInfo.isConnected) {
      try {
        final user = prefs.getUser();
        final response = await datasource.joinRoom(code);
        return Right(response.toDomain(user!.id!));
      } on DioException catch (e) {
        return Left(ErrorHandler.handle(e));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }
}
