import 'package:front_project/features/auth/domain/repository/auth_repo.dart';

class GetLoginStateUseCase {
  final AuthRepo _authRepo;

  GetLoginStateUseCase(this._authRepo);

  Future<bool> call() async {
    return await _authRepo.isLoggedIn();
  }
}