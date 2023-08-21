import 'package:json_annotation/json_annotation.dart';

part 'food_responses.g.dart';

@JsonSerializable()
class FoodResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "restaurant")
  String? restaurant;
  @JsonKey(name: "username")
  String? username;

  FoodResponse({
    this.id,
    this.name,
    this.price,
    this.restaurant,
    this.username,
  });

  factory FoodResponse.fromJson(Map<String, dynamic> json) =>
      _$FoodResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FoodResponseToJson(this);
}

@JsonSerializable()
class GetFoodResponse {
  @JsonKey(name: "food")
  FoodResponse? food;

  GetFoodResponse({
    this.food,
  });

  factory GetFoodResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFoodResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetFoodResponseToJson(this);
}


@JsonSerializable()
class GetFoodsResponse {
  @JsonKey(name: "foods")
  List<FoodResponse>? foods;

  GetFoodsResponse({
    this.foods,
  });

  factory GetFoodsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFoodsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetFoodsResponseToJson(this);
}