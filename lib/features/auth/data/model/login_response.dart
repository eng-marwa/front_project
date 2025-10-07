import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final int id;
  final String firstName;
  final String lastName;
  final String gender;
  final String email;
  final String image;
  @JsonKey(name: "accessToken")
  final String token;
  final String username;

  LoginResponse({
    required this.token,
    required this.username,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.email,
    required this.image,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
