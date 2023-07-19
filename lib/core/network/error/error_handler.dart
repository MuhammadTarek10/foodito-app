import 'package:dio/dio.dart';
import 'package:foodito/core/network/error/failure.dart';

class ErrorHandler {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure =
          Failure(error.response!.statusCode!, error.response!.statusMessage!);
    } else {
      failure = Failure(500, "Internal Server Error");
    }
  }
}
