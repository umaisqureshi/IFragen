class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message]) : super(message, "");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class InternalServerError extends CustomException {
  InternalServerError([String? message])
      : super(message, "Internal Server Error");
}

class ConflictError extends CustomException {
  ConflictError([String? message]) : super(message, "");
}
