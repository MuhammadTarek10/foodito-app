import 'package:json_annotation/json_annotation.dart';

part 'food_requests.g.dart';

@JsonSerializable()
class AddFoodRequest {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "room_id")
  String? roomId;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "restaurant")
  String? restaurant;

  AddFoodRequest({this.roomId, this.name, this.price, this.restaurant});

  factory AddFoodRequest.fromJson(Map<String, dynamic> json) =>
      _$AddFoodRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddFoodRequestToJson(this);
}

@JsonSerializable()
class GetFoodByIdRequest {
  @JsonKey(name: "id")
  String? id;

  GetFoodByIdRequest({this.id});

  factory GetFoodByIdRequest.fromJson(Map<String, dynamic> json) =>
      _$GetFoodByIdRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetFoodByIdRequestToJson(this);
}

@JsonSerializable()
class GetFoodInRoomRequest {
  @JsonKey(name: "room_id")
  String? roomId;

  GetFoodInRoomRequest({this.roomId});

  factory GetFoodInRoomRequest.fromJson(Map<String, dynamic> json) =>
      _$GetFoodInRoomRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetFoodInRoomRequestToJson(this);
}

@JsonSerializable()
class UpdateFoodRequest {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "restaurant")
  String? restaurant;

  UpdateFoodRequest({this.id, this.name, this.price, this.restaurant});

  factory UpdateFoodRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateFoodRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateFoodRequestToJson(this);
}

@JsonSerializable()
class DeleteFoodRequest {
  @JsonKey(name: "id")
  String? id;

  DeleteFoodRequest({this.id});

  factory DeleteFoodRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteFoodRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteFoodRequestToJson(this);
}
