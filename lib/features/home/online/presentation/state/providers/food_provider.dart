import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/config/utils/constants.dart';
import 'package:foodito/core/di.dart';
import 'package:foodito/features/home/online/data/repositories/socket_repository_implementer.dart';
import 'package:foodito/features/home/online/domain/entities/add_food.dart';
import 'package:foodito/features/home/online/domain/entities/food.dart';

final remoteFoodProvider =
    StreamProvider.family.autoDispose<List<Food>, String>(
  (ref, roomId) {
    final StreamController controller = StreamController<List<Food>>();
    final socketRepository = instance<SocketRepositoryImplementer>();

    socketRepository.client.socket!.emit(AppConstants.getFood, roomId);

    socketRepository.client.socket!.on(AppConstants.doneFood, (data) {
      controller.add((data as List).map((e) => Food.fromJson(e)).toList());
    });

    return controller.stream as Stream<List<Food>>;
  },
);

void addFoodProvider(AddFood food) {
  final socketRepository = instance<SocketRepositoryImplementer>();
  socketRepository.addFood(food);
}
