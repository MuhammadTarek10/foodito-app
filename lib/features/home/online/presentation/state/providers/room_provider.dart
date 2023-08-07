import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/features/home/online/domain/entities/room.dart';
import 'package:foodito/features/home/online/presentation/state/notifiers/room_notifier.dart';

final roomProvider = StateNotifierProvider<RoomsNotifier, List<Room>?>(
  (ref) => RoomsNotifier(),
);
