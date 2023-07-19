import 'package:foodito/features/auth/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "name")
  String? name;

  UserResponse(this.email, this.name);

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class RegisterResponse {
  @JsonKey(name: "user")
  UserResponse? user;

  @JsonKey(name: "token")
  String? token;

  RegisterResponse(this.user, this.token);

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

extension ToDomain on RegisterResponse {
  User toDomain() {
    return User(
      email: user?.email ?? "",
      name: user?.name ?? "",
      token: token ?? "",
    );
  }
}
