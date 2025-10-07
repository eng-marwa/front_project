class LoginResponseEntity {
  final int id;
  final String fullName;
  final String gender;
  final String email;
  final String image;
  final String token;
  final String username;
  final bool isLoggedIn;

  LoginResponseEntity({
    required this.id,
    required this.fullName,
    required this.gender,
    required this.email,
    required this.image,
    required this.token,
    required this.username,
    required this.isLoggedIn,
  });
}
