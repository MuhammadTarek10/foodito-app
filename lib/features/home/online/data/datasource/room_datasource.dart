import 'package:foodito/core/network/client.dart';
import 'package:foodito/features/home/online/data/apis/requests/room_requests.dart';
import 'package:foodito/features/home/online/data/apis/responses/room_responses.dart';

abstract class RoomDatasource {
  Future<GetRoomsResponse> getRooms();
  Future<AddRoomResponse> addRoom(String name, String code);
  Future<EditRoomResponse> editRoom(String id, String name, String code);
  Future<DeleteRoomResponse> deleteRoom(String id);
}

class RoomDatasourceImplementer implements RoomDatasource {
  final AppServiceClient client;

  RoomDatasourceImplementer({required this.client});

  @override
  Future<AddRoomResponse> addRoom(String name, String code) async {
    return await client.addRoom(AddRoomRequest(name, code));
  }

  @override
  Future<DeleteRoomResponse> deleteRoom(String id) async {
    return await client.deleteRoom(DeleteRoomRequest(id));
  }

  @override
  Future<EditRoomResponse> editRoom(String id, String name, String code) async {
    return await client.editRoom(EditRoomRequest(id, name, code));
  }

  @override
  Future<GetRoomsResponse> getRooms() async {
    return await client.getRooms();
  }
}
