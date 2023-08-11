import 'package:foodito/features/home/online/domain/entities/order.dart';
import 'package:foodito/features/home/online/domain/entities/room.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_responses.g.dart';

@JsonSerializable()
class AddRoomResponse {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "code")
  String? code;

  @JsonKey(name: "admin_id")
  int? adminId;

  AddRoomResponse(this.id, this.name, this.code, this.adminId);

  factory AddRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$AddRoomResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddRoomResponseToJson(this);
}

extension AddRoomExtension on AddRoomResponse {
  Room toDomain(String userId) {
    return Room(
        id: id,
        name: name!,
        code: code!,
        isAdmin: adminId.toString() == userId);
  }
}

@JsonSerializable()
class EditRoomResponse {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "code")
  String? code;

  @JsonKey(name: "admin_id")
  int? adminId;

  EditRoomResponse(this.id, this.name, this.code, this.adminId);

  factory EditRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$EditRoomResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EditRoomResponseToJson(this);
}

extension EditRoomExtension on EditRoomResponse {
  Room toDomain() {
    return Room(id: id, name: name!, code: code!);
  }
}

@JsonSerializable()
class DeleteRoomResponse {
  @JsonKey(name: "id")
  String? id;

  DeleteRoomResponse(this.id);

  factory DeleteRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteRoomResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteRoomResponseToJson(this);
}

@JsonSerializable()
class GetRoomResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "code")
  String? code;

  @JsonKey(name: "admin_id")
  int? adminId;

  GetRoomResponse(this.id, this.name, this.code, this.adminId);

  factory GetRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRoomResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetRoomResponseToJson(this);
}

extension GetRoomExtension on GetRoomResponse {
  Room toDomain(String userId) {
    return Room(
        id: id.toString(),
        name: name!,
        code: code!,
        isAdmin: adminId.toString() == userId);
  }
}

@JsonSerializable()
class GetRoomsResponse {
  @JsonKey(name: "rooms")
  List<GetRoomResponse>? rooms;

  GetRoomsResponse(this.rooms);

  factory GetRoomsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRoomsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetRoomsResponseToJson(this);
}

@JsonSerializable()
class GetRoomByCodeResponse {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "code")
  String? code;

  @JsonKey(name: "admin_id")
  int? adminId;

  GetRoomByCodeResponse(this.id, this.name, this.code, this.adminId);

  factory GetRoomByCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRoomByCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetRoomByCodeResponseToJson(this);
}

@JsonSerializable()
class OrderResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "user_id")
  int? userId;

  @JsonKey(name: "food")
  String? food;

  @JsonKey(name: "username")
  String? username;

  @JsonKey(name: "restaurant")
  String? restaurant;

  @JsonKey(name: "price")
  String? price;

  OrderResponse(this.id, this.userId, this.food, this.username, this.restaurant,
      this.price);

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}

@JsonSerializable()
class EnterRoomResponse {
  @JsonKey(name: "orders")
  List<OrderResponse>? orders;

  EnterRoomResponse(this.orders);

  factory EnterRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$EnterRoomResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EnterRoomResponseToJson(this);
}

extension OrderResponseExtension on OrderResponse {
  Order toDomain() {
    return Order(
      id: id.toString(),
      userId: userId.toString(),
      food: food!,
      username: username!,
      restaurant: restaurant,
      price: double.parse(price ?? '0.0'),
    );
  }
}
