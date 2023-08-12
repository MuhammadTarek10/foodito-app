class AddOrder {
  final String userId;
  final String foodId;
  final String roomId;
  final int? quantity;

  const AddOrder({
    required this.userId,
    required this.foodId,
    required this.roomId,
    this.quantity,
  });

  AddOrder copyWith({
    String? userId,
    String? foodId,
    String? roomId,
    int? quantity,
  }) {
    return AddOrder(
      userId: userId ?? this.userId,
      foodId: foodId ?? this.foodId,
      roomId: roomId ?? this.roomId,
      quantity: quantity ?? this.quantity,
    );
  }

  factory AddOrder.fromJson(Map<String, dynamic> json) => AddOrder(
        userId: json['userId'] as String,
        foodId: json['foodId'] as String,
        roomId: json['roomId'] as String,
        quantity: json['quantity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'foodId': foodId,
        'roomId': roomId,
        'quantity': quantity,
      };
}
