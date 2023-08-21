class Category {
  final String id;
  final String name;
  final String username;
  final String? image;

  Category({
    required this.id,
    required this.name,
    required this.username,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'].toString(),
      name: json['name'],
      username: json['username'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'image': image,
    };
  }
}
