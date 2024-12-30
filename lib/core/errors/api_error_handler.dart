import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle({
    required dynamic error,
  }) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(
            error: "Connection to server failed",
          );
        case DioExceptionType.cancel:
          return ApiErrorModel(
            error: "Request to the server was cancelled",
          );
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
            error: "Connection timeout with the server",
          );
        case DioExceptionType.unknown:
          return ApiErrorModel(
            error: "Connection to the server failed due to internet connection",
          );
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            error: "Receive timeout in connection with the server",
          );

        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
            error: "Send timeout in connection with the server",
          );
        case DioExceptionType.badResponse:
          return _handleError(
            error.response?.data,
          );
        default:
          return ApiErrorModel(
            error: "Something went wrong",
          );
      }
    } else {
      return ApiErrorModel(
        error: "Unknown error occurred",
      );
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  print(data);
  return ApiErrorModel(
    error: data['error'] ?? "Unknown error occurred",
  );
}
