// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRoomResponse _$AddRoomResponseFromJson(Map<String, dynamic> json) =>
    AddRoomResponse(
      json['id'] as String?,
      json['name'] as String?,
      json['code'] as String?,
      json['admin_id'] as int?,
    );

Map<String, dynamic> _$AddRoomResponseToJson(AddRoomResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'admin_id': instance.adminId,
    };

EditRoomResponse _$EditRoomResponseFromJson(Map<String, dynamic> json) =>
    EditRoomResponse(
      json['id'] as String?,
      json['name'] as String?,
      json['code'] as String?,
      json['admin_id'] as int?,
    );

Map<String, dynamic> _$EditRoomResponseToJson(EditRoomResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'admin_id': instance.adminId,
    };

DeleteRoomResponse _$DeleteRoomResponseFromJson(Map<String, dynamic> json) =>
    DeleteRoomResponse(
      json['id'] as String?,
    );

Map<String, dynamic> _$DeleteRoomResponseToJson(DeleteRoomResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

GetRoomResponse _$GetRoomResponseFromJson(Map<String, dynamic> json) =>
    GetRoomResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['code'] as String?,
      json['admin_id'] as int?,
    );

Map<String, dynamic> _$GetRoomResponseToJson(GetRoomResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'admin_id': instance.adminId,
    };

GetRoomsResponse _$GetRoomsResponseFromJson(Map<String, dynamic> json) =>
    GetRoomsResponse(
      (json['rooms'] as List<dynamic>?)
          ?.map((e) => GetRoomResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetRoomsResponseToJson(GetRoomsResponse instance) =>
    <String, dynamic>{
      'rooms': instance.rooms,
    };

GetRoomByCodeResponse _$GetRoomByCodeResponseFromJson(
        Map<String, dynamic> json) =>
    GetRoomByCodeResponse(
      json['id'] as String?,
      json['name'] as String?,
      json['code'] as String?,
      json['admin_id'] as int?,
    );

Map<String, dynamic> _$GetRoomByCodeResponseToJson(
        GetRoomByCodeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'admin_id': instance.adminId,
    };

GetRoomByIdResponse _$GetRoomByIdResponseFromJson(Map<String, dynamic> json) =>
    GetRoomByIdResponse(
      json['room'] == null
          ? null
          : GetRoomResponse.fromJson(json['room'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetRoomByIdResponseToJson(
        GetRoomByIdResponse instance) =>
    <String, dynamic>{
      'room': instance.room,
    };
