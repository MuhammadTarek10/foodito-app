// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodResponse _$FoodResponseFromJson(Map<String, dynamic> json) => FoodResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      restaurant: json['restaurant'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$FoodResponseToJson(FoodResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'restaurant': instance.restaurant,
      'username': instance.username,
    };

GetFoodResponse _$GetFoodResponseFromJson(Map<String, dynamic> json) =>
    GetFoodResponse(
      food: json['food'] == null
          ? null
          : FoodResponse.fromJson(json['food'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetFoodResponseToJson(GetFoodResponse instance) =>
    <String, dynamic>{
      'food': instance.food,
    };

GetFoodsResponse _$GetFoodsResponseFromJson(Map<String, dynamic> json) =>
    GetFoodsResponse(
      foods: (json['foods'] as List<dynamic>?)
          ?.map((e) => FoodResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetFoodsResponseToJson(GetFoodsResponse instance) =>
    <String, dynamic>{
      'foods': instance.foods,
    };
