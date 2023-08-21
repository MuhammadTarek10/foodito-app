// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFoodRequest _$AddFoodRequestFromJson(Map<String, dynamic> json) =>
    AddFoodRequest(
      roomId: json['room_id'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      restaurant: json['restaurant'] as String?,
    );

Map<String, dynamic> _$AddFoodRequestToJson(AddFoodRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'room_id': instance.roomId,
      'price': instance.price,
      'restaurant': instance.restaurant,
    };

GetFoodByIdRequest _$GetFoodByIdRequestFromJson(Map<String, dynamic> json) =>
    GetFoodByIdRequest(
      id: json['id'] as String?,
    );

Map<String, dynamic> _$GetFoodByIdRequestToJson(GetFoodByIdRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

GetFoodInRoomRequest _$GetFoodInRoomRequestFromJson(
        Map<String, dynamic> json) =>
    GetFoodInRoomRequest(
      roomId: json['room_id'] as String?,
    );

Map<String, dynamic> _$GetFoodInRoomRequestToJson(
        GetFoodInRoomRequest instance) =>
    <String, dynamic>{
      'room_id': instance.roomId,
    };

UpdateFoodRequest _$UpdateFoodRequestFromJson(Map<String, dynamic> json) =>
    UpdateFoodRequest(
      id: json['id'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      restaurant: json['restaurant'] as String?,
    );

Map<String, dynamic> _$UpdateFoodRequestToJson(UpdateFoodRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'restaurant': instance.restaurant,
    };

DeleteFoodRequest _$DeleteFoodRequestFromJson(Map<String, dynamic> json) =>
    DeleteFoodRequest(
      id: json['id'] as String?,
    );

Map<String, dynamic> _$DeleteFoodRequestToJson(DeleteFoodRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
