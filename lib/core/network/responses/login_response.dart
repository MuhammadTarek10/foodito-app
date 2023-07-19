import 'package:foodito/features/auth/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

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
class LoginResponse {
  @JsonKey(name: "user")
  UserResponse? user;

  @JsonKey(name: "token")
  String? token;

  LoginResponse(this.user, this.token);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

extension ToDomain on LoginResponse {
  User toDomain() {
    return User(
      name: user?.name ?? "",
      email: user?.email ?? "",
      token: token ?? "",
    );
  }
}
