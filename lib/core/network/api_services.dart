import 'package:dio/dio.dart';
import 'package:front_project/core/network/api_constants.dart';
import 'package:front_project/core/network/api_exception.dart';
import 'package:front_project/core/network/api_result.dart';
import 'package:front_project/core/network/app_exception.dart';
import 'package:front_project/core/network/dio_config.dart';
import 'package:front_project/features/auth/data/model/login_request.dart';
import 'package:front_project/features/auth/data/model/login_response.dart';

class ApiServices {
  final Dio _dio;

  ApiServices(this._dio);
  Future<ApiResult<LoginResponse>> login(LoginRequest request) async {
    try {
      Response response = await _dio.post(
        ApiConstants.loginEndPoint,
        data: request.toJson(),
      );
      if (response.statusCode == 200) {
        //login successful
        return Success<LoginResponse>(LoginResponse.fromJson(response.data));
      } else {
        return Failure(
          ApiException(
            statusCode: response.statusCode,
            message: response.statusMessage,
          ),
        );
      }
    } on DioException catch (e) {
      return Failure(
        AppException.handleException(
          e.response?.statusCode ?? 0,
          e.response?.statusMessage ?? 'Unknown error',
        ),
      );
    }
  }

  void multipleRequest(){
    Future.wait([
      _dio.get('https://jsonplaceholder.typicode.com/posts/1'),
      _dio.get('https://jsonplaceholder.typicode.com/posts/2'),
      _dio.get('https://jsonplaceholder.typicode.com/posts/3'),
    ]).then((responses) {
      for (var response in responses) {
        if (response.statusCode == 200) {
          print('Response data: ${response.data}');
        } else {
          print('Request failed with status: ${response.statusCode}');
        }
      }
    }).catchError((error) {
      print('Error occurred: $error');
    });
  }
}



