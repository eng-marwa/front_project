import 'package:front_project/features/auth/data/model/login_request.dart';
import 'package:front_project/features/auth/data/model/login_response.dart';
import 'package:front_project/features/auth/domain/entity/login_request_entity.dart';
import 'package:front_project/features/auth/domain/entity/login_response_entity.dart';

extension LoginResponseMapper on LoginResponse {
  LoginResponseEntity toEntity() {
    return LoginResponseEntity(
      token: token,
      email: email,
      fullName: '$firstName $lastName',
      gender: gender,
      image: image,
      id: id,
      username: username,
      isLoggedIn: false,
    );
  }
}

extension LoginResponseEntityMapper on LoginResponseEntity {
  LoginResponse toModel() {
    return LoginResponse(
      token: token,
      username: username,
      id: id,
      firstName: fullName.split(' ').first,
      lastName: fullName.split(' ').last,
      gender: gender,
      email: email,
      image: image,
    );
  }
}

extension LoginRequestMapper on LoginRequest {
  LoginRequestEntity toEntity() {
    return LoginRequestEntity(username: userName, password: password);
  }
}

extension LoginRequestEntityMapper on LoginRequestEntity {
  LoginRequest toModel() {
    return LoginRequest(userName: username, password: password);
  }
}
