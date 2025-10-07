import 'package:front_project/features/auth/data/model/login_response.dart';
import 'package:front_project/util/extensions/prefs_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  PrefsHelper._();

  static final PrefsHelper instance = PrefsHelper._();

  SharedPreferences? prefs;

  void init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static const String _userData = 'userData';
  static const String _isLoggedIn = 'isLoggedIn';

  void saveUserData(LoginResponse response) {
    try {
      prefs?.saveObject(_userData, response.toJson());
    } catch (e) {
      print('Error saving user data: $e');
    }
  }

  LoginResponse? getUserData() {
    try {
      return prefs?.getObject(_userData);
    } catch (e) {
      print('Error getting user data: $e');
      return null;
    }
  }

  void setLoginStatus(bool status) {
    prefs?.setBool(_isLoggedIn, status);
  }

  bool isLoggedIn() {
    return prefs?.getBool(_isLoggedIn) ?? false;
  }
}
