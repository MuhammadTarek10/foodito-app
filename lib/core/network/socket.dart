import 'package:foodito/config/utils/constants.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketClient {
  Socket? socket;
  static SocketClient? _shared;

  SocketClient._internal() {
    socket = io(
      AppConstants.base,
      OptionBuilder().setTransports(['websocket']).disableAutoConnect().build(),
    );
    socket!.connect();
  }

  static SocketClient get instance {
    _shared ??= SocketClient._internal();
    return _shared!;
  }
}
