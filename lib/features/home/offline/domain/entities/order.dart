import 'package:flutter/foundation.dart' show immutable;

@immutable
class Order {
  final String id;
  final String person;
  final String name;
  final double price;
  final double payed;
  final double remaining;

  const Order({
    required this.id,
    required this.person,
    required this.name,
    required this.price,
    required this.payed,
    required this.remaining,
  });

  Order copyWith({
    String? id,
    String? person,
    String? name,
    double? price,
    double? payed,
    double? remaining,
  }) {
    return Order(
      id: id ?? this.id,
      person: person ?? this.person,
      name: name ?? this.name,
      price: price ?? this.price,
      payed: payed ?? this.payed,
      remaining: remaining ?? this.remaining,
    );
  }
}
