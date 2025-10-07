import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_project/core/network/api_result.dart';
import 'package:front_project/features/auth/domain/entity/login_request_entity.dart';
import 'package:front_project/features/auth/domain/entity/login_response_entity.dart';
import 'package:front_project/features/auth/domain/use_case/login_use_case.dart';
import 'package:front_project/features/auth/domain/use_case/set_login_state_use_case.dart';
import 'package:front_project/features/auth/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  final SetLoginStateUseCase _loginStateUseCase;

  LoginCubit(this._loginUseCase, this._loginStateUseCase) : super(LoginState.initial());

  Future<void> login(String username, String password) async {
    emit(LoginState.loading());
    ApiResult<LoginResponseEntity> result = await _loginUseCase.call(
      LoginRequestEntity(username: username, password: password),
    );
    result.when(
      success: (data) {
        setLoggedIn(true);
        emit(LoginState.success());
      },
      failure: (exception) =>
          LoginState.error(exception.message ?? 'Invalid login information'),
    );
  }

  void setLoggedIn(bool isLoggedIn) {
    _loginStateUseCase.call(isLoggedIn);
  }
}
