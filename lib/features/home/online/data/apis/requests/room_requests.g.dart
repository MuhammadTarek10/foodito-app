// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRoomRequest _$AddRoomRequestFromJson(Map<String, dynamic> json) =>
    AddRoomRequest(
      json['name'] as String?,
      json['code'] as String?,
    );

Map<String, dynamic> _$AddRoomRequestToJson(AddRoomRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

EditRoomRequest _$EditRoomRequestFromJson(Map<String, dynamic> json) =>
    EditRoomRequest(
      json['id'] as String?,
      json['name'] as String?,
      json['code'] as String?,
    );

Map<String, dynamic> _$EditRoomRequestToJson(EditRoomRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };

DeleteRoomRequest _$DeleteRoomRequestFromJson(Map<String, dynamic> json) =>
    DeleteRoomRequest(
      json['id'] as String?,
    );

Map<String, dynamic> _$DeleteRoomRequestToJson(DeleteRoomRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

GetRoomsRequest _$GetRoomsRequestFromJson(Map<String, dynamic> json) =>
    GetRoomsRequest();

Map<String, dynamic> _$GetRoomsRequestToJson(GetRoomsRequest instance) =>
    <String, dynamic>{};

GetRoomRequest _$GetRoomRequestFromJson(Map<String, dynamic> json) =>
    GetRoomRequest(
      json['id'] as String?,
    );

Map<String, dynamic> _$GetRoomRequestToJson(GetRoomRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

GetRoomByCodeRequest _$GetRoomByCodeRequestFromJson(
        Map<String, dynamic> json) =>
    GetRoomByCodeRequest(
      json['code'] as String?,
    );

Map<String, dynamic> _$GetRoomByCodeRequestToJson(
        GetRoomByCodeRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
    };
