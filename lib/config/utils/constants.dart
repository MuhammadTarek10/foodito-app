class AppConstants {
  static const String baseUrl = "http://localhost:3000/api/v1";
  // * Auth
  static const String login = "$baseUrl/users/login";
  static const String register = "$baseUrl/users/register";
  static const String logout = "$baseUrl/users/logout";

  // * Rooms
  static const String getRooms = "$baseUrl/room/my";
  static const String addRoom = "$baseUrl/room/room";
  static const String editRoom = "$baseUrl/room/update";
  static const String deleteRoom = "$baseUrl/rooms";

  // * Headers
  static const String contentType = "Content-Type";
  static const String applicationJson = "application/json";
  static const String accept = "accept";
  static const String authorization = "Authorization";
  static const String token = "token";

  static const Duration receiveTimeout = Duration(seconds: 3);
  static const Duration connectTimeout = Duration(seconds: 3);
  static const Duration sendTimeout = Duration(seconds: 3);

  // * Local Data Source
  static const String orders = "orders";

  // * Prefs Keys
  static const String isSeenOnBoarding = "isSeenOnBoarding";
  static const String isLoggedIn = "isLoggedIn";
  static const String user = "user";
}
