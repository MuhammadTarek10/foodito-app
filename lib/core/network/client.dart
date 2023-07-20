import 'package:dio/dio.dart';
import 'package:foodito/config/utils/constants.dart';
import 'package:foodito/core/network/requests/login_request.dart';
import 'package:foodito/core/network/requests/register_request.dart';
import 'package:foodito/core/network/responses/login_response.dart';
import 'package:foodito/core/network/responses/register_response.dart';
import 'package:retrofit/retrofit.dart';

part 'client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(AppConstants.login)
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST(AppConstants.register)
  Future<RegisterResponse> register(@Body() RegisterRequest request);

  @POST(AppConstants.logout)
  Future<void> logout();
}
