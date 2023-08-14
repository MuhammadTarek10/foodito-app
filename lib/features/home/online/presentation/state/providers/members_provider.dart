import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/config/utils/constants.dart';
import 'package:foodito/core/di.dart';
import 'package:foodito/features/auth/domain/entities/user.dart';
import 'package:foodito/features/home/online/data/repositories/socket_repository_implementer.dart';

final membersProvider = StreamProvider.family.autoDispose<List<User>, String>(
  (ref, roomId) {
    final StreamController controller = StreamController<List<User>>();
    final socketRepository = instance<SocketRepositoryImplementer>();

    socketRepository.client.socket!.emit(AppConstants.getMembers, roomId);

    socketRepository.client.socket!.on(AppConstants.doneMembers, (data) {
      controller.add((data as List).map((e) => User.fromJson(e)).toList());
    });

    return controller.stream as Stream<List<User>>;
  },
);
