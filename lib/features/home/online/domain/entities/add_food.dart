class AddFood {
  final String? id;
  final String userId;
  final String name;
  final double? price;
  final String? restaurant;
  final String categoryId;
  final String roomId;

  AddFood({
    this.id,
    required this.userId,
    required this.name,
    this.price,
    this.restaurant,
    required this.categoryId,
    required this.roomId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'price': price,
      'restaurant': restaurant,
      'categoryId': categoryId,
      'roomId': roomId,
    };
  }

  factory AddFood.fromJson(Map<String, dynamic> json) {
    return AddFood(
      id: json['id'].toString(),
      userId: json['userId'].toString(),
      name: json['name'],
      price: json['price'],
      restaurant: json['restaurant'],
      categoryId: json['categoryId'].toString(),
      roomId: json['roomId'].toString(),
    );
  }
}
