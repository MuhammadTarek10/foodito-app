import 'dart:developer';

import 'package:foodito/core/network/client.dart';
import 'package:foodito/features/auth/data/apis/requests/login_request.dart';
import 'package:foodito/features/auth/data/apis/requests/register_request.dart';
import 'package:foodito/features/auth/data/apis/responses/login_response.dart';
import 'package:foodito/features/auth/data/apis/responses/register_response.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(String email, String password);
  Future<RegisterResponse> register(String name, String email, String password);
  Future<bool> logout();
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

  @override
  Future<bool> logout() async {
    try {
      await client.logout();
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
