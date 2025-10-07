import 'package:front_project/core/network/api_result.dart';
import 'package:front_project/core/network/api_services.dart';
import 'package:front_project/features/auth/data/model/login_request.dart';
import 'package:front_project/features/auth/data/model/login_response.dart';

abstract class RemoteLoginDataSource {
  Future<ApiResult<LoginResponse>> login(LoginRequest request);
}

class RemoteLoginDataSourceImpl implements RemoteLoginDataSource {
  final ApiServices _apiServices;

  RemoteLoginDataSourceImpl(this._apiServices);

  @override
  Future<ApiResult<LoginResponse>> login(LoginRequest request) {
    return _apiServices.login(request);
  }
}
