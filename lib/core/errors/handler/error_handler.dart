import 'package:dio/dio.dart';
import 'package:foodito/core/errors/failure.dart';

class ErrorHandler {
  static Failure handle(DioException exception) {
    switch (exception.response?.statusCode) {
      case 400:
        return BadRequestFailure();
      case 401:
        return UnauthorizedFailure();
      case 403:
        return ForbiddenFailure();
      case 404:
        return NotFoundFailure();
      case 409:
        return ConflictFailure();
      case 422:
        return UnprocessableEntityFailure();
      case 500:
        return ServerInternalFailure();
      default:
        return UnknownFailure();
    }
  }
}
