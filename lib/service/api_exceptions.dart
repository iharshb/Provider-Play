import 'package:providerplay/utils/strings.dart';

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message])
      : super(message, Strings.errorCommunication);
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, Strings.invalidRequest);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, Strings.unauthorised);
}

class InvalidInputException extends AppException {
  InvalidInputException([String message])
      : super(message, Strings.unauthorised);
}
