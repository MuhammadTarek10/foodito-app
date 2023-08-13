class Food {
  final String? id;
  final String name;
  final double? price;
  final String? restaurant;
  final String categoryId;
  final String username;

  Food({
    this.id,
    required this.name,
    this.price,
    this.restaurant,
    required this.categoryId,
    required this.username,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"].toString(),
        name: json["name"],
        price: json["price"].toDouble(),
        restaurant: json["restaurant"],
        categoryId: json["category_id"].toString(),
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "restaurant": restaurant,
        "categoryId": categoryId,
        "username": username,
      };
}
