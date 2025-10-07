import 'package:front_project/core/network/api_result.dart';
import 'package:front_project/features/auth/domain/entity/login_request_entity.dart';
import 'package:front_project/features/auth/domain/entity/login_response_entity.dart';
import 'package:front_project/features/auth/domain/repository/auth_repo.dart';

class LoginUseCase{
  final AuthRepo _authRepo;

  LoginUseCase(this._authRepo);
  Future<ApiResult<LoginResponseEntity>> call(LoginRequestEntity request){
    return _authRepo.login(request);
  }
}