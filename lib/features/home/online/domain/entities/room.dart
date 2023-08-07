class Room {
  final String? id;
  final String name;
  final String code;
  final bool isAdmin;

  Room({
    this.id,
    required this.name,
    required this.code,
    this.isAdmin = false,
  });

  Room copyWith({
    String? id,
    String? name,
    String? code,
    bool? isAdmin,
  }) {
    return Room(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      isAdmin: json['is_admin'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'is_admin': isAdmin,
    };
  }
}
