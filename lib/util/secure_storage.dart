import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureData {
  AppSecureData._();

  static final AppSecureData instance = AppSecureData._();
  final FlutterSecureStorage storage = FlutterSecureStorage();

  Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  Future<void> setToken(String token) async {
    await storage.write(key: 'token', value: token);
  }
}
