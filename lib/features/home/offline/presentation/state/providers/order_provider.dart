import 'package:dartz/dartz.dart' show Either;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/core/errors/failure.dart';
import 'package:foodito/features/home/offline/domain/entities/order.dart';
import 'package:foodito/features/home/offline/presentation/state/notifiers/order_notifier.dart';

final orderProvider =
    StateNotifierProvider<OrderNotifier, Either<Failure, List<Order>>?>(
  (ref) => OrderNotifier(),
);
