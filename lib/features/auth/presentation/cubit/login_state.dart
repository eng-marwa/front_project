import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  factory LoginState.initial() = Initial;

  factory LoginState.loading() = Loading;

  factory LoginState.success() = LoginSuccess;

  factory LoginState.error(String message) = LoginError;
}
