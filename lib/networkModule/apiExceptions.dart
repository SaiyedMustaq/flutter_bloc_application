class APIExceptions implements Exception {
  final _message;
  final _prefix;
  APIExceptions([this._message, this._prefix]);
  String toString() {
    return '$_prefix $_message';
  }
}

class FetchDataException extends APIExceptions {
  FetchDataException(String message)
      : super(message, 'Error During Communicate');
}

class BadRequestException extends APIExceptions {
  BadRequestException(String message) : super(message, 'Invalid request');
}

class UnauthorizedException extends APIExceptions {
  UnauthorizedException(String message) : super(message, 'Unauthorized ');
}

class InvalidInputException extends APIExceptions {
  InvalidInputException(String message) : super(message, 'Invalid Input ');
}

class AuthorizedException extends APIExceptions {
  AuthorizedException(String message) : super(message, 'Authorized failed');
}
