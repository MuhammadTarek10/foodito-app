import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/core/errors/failure.dart';
import 'package:foodito/features/home/online/domain/entities/room.dart';
import 'package:foodito/features/home/online/presentation/state/notifiers/rooms_notifier.dart';

final roomsProvider =
    StateNotifierProvider<RoomsNotifier, Either<Failure, List<Room>?>>(
  (ref) => RoomsNotifier(),
);
