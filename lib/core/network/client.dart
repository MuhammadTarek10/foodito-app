import 'package:dio/dio.dart';
import 'package:foodito/config/utils/constants.dart';
import 'package:foodito/features/auth/data/apis/requests/login_request.dart';
import 'package:foodito/features/auth/data/apis/requests/register_request.dart';
import 'package:foodito/features/auth/data/apis/responses/login_response.dart';
import 'package:foodito/features/auth/data/apis/responses/register_response.dart';
import 'package:foodito/features/home/online/data/apis/requests/room_requests.dart';
import 'package:foodito/features/home/online/data/apis/responses/room_responses.dart';
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

  @GET(AppConstants.getRooms)
  Future<GetRoomsResponse> getRooms();

  @POST(AppConstants.addRoom)
  Future<AddRoomResponse> addRoom(@Body() AddRoomRequest request);

  @PUT(AppConstants.editRoom)
  Future<EditRoomResponse> editRoom(@Body() EditRoomRequest request);

  @DELETE(AppConstants.deleteRoom)
  Future<DeleteRoomResponse> deleteRoom(@Body() DeleteRoomRequest request);

  @GET(AppConstants.getRoomById)
  Future<EnterRoomResponse> enterRoom(@Path() String id);
}
