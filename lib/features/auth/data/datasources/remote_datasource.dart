import 'package:foodito/core/network/client.dart';
import 'package:foodito/core/network/requests/login_request.dart';
import 'package:foodito/core/network/requests/register_request.dart';
import 'package:foodito/core/network/responses/login_response.dart';
import 'package:foodito/core/network/responses/register_response.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(String email, String password);
  Future<RegisterResponse> register(String name, String email, String password);
}

class AuthRemoteDataSourceImplementer implements AuthRemoteDataSource {
  final AppServiceClient client;

  AuthRemoteDataSourceImplementer({required this.client});

  @override
  Future<LoginResponse> login(String email, String password) async {
    return await client.login(LoginRequest(email, password));
  }

  @override
  Future<RegisterResponse> register(
      String name, String email, String password) async {
    return await client.register(RegisterRequest(name, email, password));
  }
}
