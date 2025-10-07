import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_project/features/auth/domain/use_case/get_login_state_use_case.dart';

class SplashCubit extends Cubit<bool> {
  SplashCubit(this._getLoginStateUseCase) : super(false);
  final GetLoginStateUseCase _getLoginStateUseCase;

  Future<bool> navigateToHome() async {
    return await _getLoginStateUseCase.call();
  }
}
