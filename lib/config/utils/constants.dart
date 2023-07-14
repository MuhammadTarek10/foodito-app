class AppConstants {
  static const String baseUrl = "";
  static const String contentType = "Content-Type";
  static const String applicationJson = "application/json";
  static const String accept = "accept";
  static const String authorization = "x-auth-token";
  static const String token = "token";

  static const Duration receiveTimeout = Duration(seconds: 3);
  static const Duration connectTimeout = Duration(seconds: 3);
  static const Duration sendTimeout = Duration(seconds: 3);
}
