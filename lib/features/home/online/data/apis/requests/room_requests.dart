import 'package:json_annotation/json_annotation.dart';

part 'room_requests.g.dart';

@JsonSerializable()
class AddRoomRequest {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "code")
  String? code;

  AddRoomRequest(this.name, this.code);

  factory AddRoomRequest.fromJson(Map<String, dynamic> json) =>
      _$AddRoomRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddRoomRequestToJson(this);
}

@JsonSerializable()
class EditRoomRequest {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "code")
  String? code;

  EditRoomRequest(this.id, this.name, this.code);

  factory EditRoomRequest.fromJson(Map<String, dynamic> json) =>
      _$EditRoomRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EditRoomRequestToJson(this);
}

@JsonSerializable()
class DeleteRoomRequest {
  @JsonKey(name: "id")
  String? id;

  DeleteRoomRequest(this.id);

  factory DeleteRoomRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteRoomRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteRoomRequestToJson(this);
}

@JsonSerializable()
class GetRoomsRequest {
  GetRoomsRequest();

  factory GetRoomsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetRoomsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetRoomsRequestToJson(this);
}

@JsonSerializable()
class GetRoomRequest {
  @JsonKey(name: "id")
  String? id;

  GetRoomRequest(this.id);

  factory GetRoomRequest.fromJson(Map<String, dynamic> json) =>
      _$GetRoomRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetRoomRequestToJson(this);
}

@JsonSerializable()
class GetRoomByCodeRequest {
  @JsonKey(name: "code")
  String? code;

  GetRoomByCodeRequest(this.code);

  factory GetRoomByCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$GetRoomByCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetRoomByCodeRequestToJson(this);
}

