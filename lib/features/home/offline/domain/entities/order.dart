import 'package:hive_flutter/hive_flutter.dart';

part 'order.g.dart';

@HiveType(typeId: 1)
class Order {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String person;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final double price;

  @HiveField(4)
  final double payed;

  @HiveField(5)
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'person': person,
      'name': name,
      'price': price,
      'payed': payed,
      'remaining': remaining,
    };
  }
}
