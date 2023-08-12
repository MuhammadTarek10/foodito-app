import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/config/utils/constants.dart';
import 'package:foodito/core/di.dart';
import 'package:foodito/features/home/online/data/repositories/socket_repository_implementer.dart';
import 'package:foodito/features/home/online/domain/entities/order.dart';

final remoteOrderProvider = StreamProvider.autoDispose<List<Order>>(
  (ref) {
    final StreamController controller = StreamController<List<Order>>();
    final socketRepository = instance<SocketRepositoryImplementer>();

    socketRepository.client.socket!.emit(AppConstants.getOrders);

    socketRepository.client.socket!.on(AppConstants.getOrders, (data) {
      log(data.toString());
      controller.add((data as List).map((e) => Order.fromJson(e)).toList());
    });

    socketRepository.client.socket!.on(AppConstants.addOrder, (data) {
      log(data.toString());
      controller.add((data as List).map((e) => Order.fromJson(e)).toList());
    });

    return controller.stream as Stream<List<Order>>;
  },
);
