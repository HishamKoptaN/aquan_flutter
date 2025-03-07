class CustomException implements Exception {
  final String message;

  CustomException({required this.message});

  @override
  String toString() {
    return message;
  }
}

class UserCancelledException implements Exception {
  final String message;
  UserCancelledException([this.message = "User cancelled the operation."]);
  @override
  String toString() => message;
}

class ServerException implements Exception {}

class OfflineException implements Exception {}

class WeekPassException implements Exception {}

class ExistedAccountException implements Exception {}

class NoUserException implements Exception {}

class WrongPasswordException implements Exception {}

class TooManyRequestsException implements Exception {}
