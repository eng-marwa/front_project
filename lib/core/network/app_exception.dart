
import 'package:front_project/core/network/api_exception.dart';

class AppException {
  static ApiException handleException(int code, String message) {
    switch (code) {
      case 400:
        return ApiException(message: "Bad request: $message");
      case 401:
        return ApiException(message: "Unauthorized: $message");
      case 403:
        return ApiException(message: "Forbidden: $message");
      case 404:
        return ApiException(message: "Not Found: $message");
      case 500:
        return ApiException(message: "Internal Server Error: $message");
      case 502:
        return ApiException(message: "Bad Gateway: $message");
      case 503:
        return ApiException(message: "Service Unavailable: $message");
      case 504:
        return ApiException(message: "Gateway Timeout: $message");
      default:
        return ApiException(message: "Unexpected error occurred: $message");
    }
  }
}
