class Order {
  final String? id;
  final String? userId;
  final String food;
  final double? price;
  final String username;
  final String? restaurant;

  const Order({
    this.id,
    required this.userId,
    required this.food,
    this.price,
    required this.username,
    this.restaurant,
  });

  Order copyWith({
    String? id,
    String? userId,
    String? food,
    double? price,
    String? username,
    String? restaurant,
  }) {
    return Order(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      food: food ?? this.food,
      price: price ?? this.price,
      username: username ?? this.username,
      restaurant: restaurant ?? this.restaurant,
    );
  }

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json['id'].toString(),
        userId: json['userId'].toString(),
        food: json['food'] as String,
        price: double.parse(json['price']),
        username: json['username'] as String,
        restaurant: json['restaurant'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'food': food,
        'price': price,
        'username': username,
        'restaurant': restaurant,
      };
}
