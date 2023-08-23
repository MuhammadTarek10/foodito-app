class Failure {
  final int code;
  final String message;

  Failure(this.code, this.message);
}

class ServerInternalFailure extends Failure {
  ServerInternalFailure() : super(500, 'Server internal error');
}

class NotFoundFailure extends Failure {
  NotFoundFailure() : super(404, 'Not found');
}

class BadRequestFailure extends Failure {
  BadRequestFailure() : super(400, 'Bad request');
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure() : super(401, 'Unauthorized');
}

class ForbiddenFailure extends Failure {
  ForbiddenFailure() : super(403, 'Forbidden');
}

class ConflictFailure extends Failure {
  ConflictFailure() : super(409, 'Conflict');
}

class UnprocessableEntityFailure extends Failure {
  UnprocessableEntityFailure() : super(422, 'Unprocessable entity');
}

class UnknownFailure extends Failure {
  UnknownFailure() : super(0, 'Unknown');
}

class NoInternetFailure extends Failure {
  NoInternetFailure() : super(500, 'No internet');
}
