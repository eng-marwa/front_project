import 'package:dio/dio.dart';
import 'package:front_project/core/network/api_constants.dart';
import 'package:front_project/util/secure_storage.dart';

class DioConfig {
  DioConfig._();

  static final DioConfig instance = DioConfig._();
  static final Duration _timeout = const Duration(seconds: 10);

  Dio get dio => Dio()
    ..options.baseUrl = ApiConstants.baseUrl
    ..options.connectTimeout = _timeout
    ..options.receiveTimeout = _timeout
    ..options.responseType = ResponseType.json
    ..options.headers = {'Content-Type': 'application/json'}
    ..interceptors.add(AppInterceptor())
    ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
}

class AppInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.path == ApiConstants.loginEndPoint) {
      //skip adding token for login endpoint
      handler.next(options);
      return;
    }

    String? token = await AppSecureData.instance.getToken();
    if (token != null) {
      options.headers = {'Authorization': 'Bearer $token'};
      handler.next(options);
    }
  }
}
