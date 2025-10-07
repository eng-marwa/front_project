import 'package:front_project/features/auth/domain/repository/auth_repo.dart';

class SetLoginStateUseCase{
  final AuthRepo _authRepo;
  SetLoginStateUseCase(this._authRepo);

  void call(bool isLoggedIn){
    _authRepo.saveLoginState(isLoggedIn);
  }
}