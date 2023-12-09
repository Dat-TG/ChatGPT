import 'package:dio/dio.dart';

class DioErrorUtil {
  // general methods:-----------------------------------------------------------
  static String handleError(DioException error) {
    String errorDescription = "";
    // ignore: unnecessary_type_check
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioExceptionType.connectionError:
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.unknown:
          errorDescription = "Connection timeout with API server";
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioExceptionType.badResponse:
          errorDescription =
              "Received invalid status code: ${error.response?.statusCode}";
          break;
        case DioExceptionType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
        case DioExceptionType.badCertificate:
          errorDescription = "Incorrect certificate";
          break;
      }
    } else {
      errorDescription = "Unexpected error occurred";
    }
    return errorDescription;
  }
}
