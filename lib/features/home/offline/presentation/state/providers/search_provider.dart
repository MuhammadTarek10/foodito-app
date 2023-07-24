import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/features/home/offline/domain/entities/order.dart';
import 'package:foodito/features/home/offline/presentation/state/providers/order_provider.dart';

final searchProvider = Provider.family<List<Order>?, String>(
  (ref, query) {
    final orders = ref.watch(orderProvider)?.fold(
          (l) => null,
          (r) => r,
        );
    if (orders != null) {
      if (query.isNotEmpty) {
        return orders
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    } else {
      return orders;
    }
    return orders;
  },
);
