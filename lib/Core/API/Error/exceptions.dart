import 'package:weather_application/Feature/Data/Models/errorMessageModel.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessage;

  const ServerException(
    this.errorMessage,
  );
}

class LocalDatabaseException implements Exception {
  final String message;

  const LocalDatabaseException(
    this.message,
  );
}

class LocationDisabledException implements Exception {}
