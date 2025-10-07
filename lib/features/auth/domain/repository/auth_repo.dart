import 'package:front_project/core/network/api_result.dart';
import 'package:front_project/features/auth/data/datasource/local/prefs_helper.dart';
import 'package:front_project/features/auth/data/datasource/remote/remote_login_ds.dart';
import 'package:front_project/features/auth/data/model/login_request.dart';
import 'package:front_project/features/auth/data/model/login_response.dart';
import 'package:front_project/features/auth/domain/entity/login_request_entity.dart';
import 'package:front_project/features/auth/domain/entity/login_response_entity.dart';
import 'package:front_project/util/mapper/login_mapper.dart';
import 'package:front_project/util/secure_storage.dart';

abstract class AuthRepo {
  Future<ApiResult<LoginResponseEntity>> login(LoginRequestEntity entity);
  void saveLoginState(bool isLoggedIn);
  bool isLoggedIn();
}

class AuthRepoImpl implements AuthRepo {
  final RemoteLoginDataSource remoteLoginDataSource;
  final AppSecureData appSecureData = AppSecureData.instance;
  final PrefsHelper prefsHelper = PrefsHelper.instance;

  AuthRepoImpl(this.remoteLoginDataSource);

  @override
  Future<ApiResult<LoginResponseEntity>> login(
    LoginRequestEntity entity,
  ) async {
    LoginRequest request = entity.toModel();
    ApiResult<LoginResponse> result = await remoteLoginDataSource.login(
      request,
    );
    return result.when(
      success: (data) {
        appSecureData.setToken(data.token);
        return Success(data.toEntity());
      },
      failure: (exception) {
        return Failure(exception);
      },
    );
  }

  @override
  void saveLoginState(bool isLoggedIn) {
    prefsHelper.setLoginStatus(isLoggedIn);
  }

  @override
  bool isLoggedIn() {
    return prefsHelper.isLoggedIn();
  }
}
