import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

extension PrefsExtensions on SharedPreferences{
  Future<void> saveObject(String key, Map<String,dynamic> data) async {
    await setString(key, json.encode(data));
  }

  T? getObject<T>(String key){
    String? jsonString = getString(key);
    if(jsonString != null){
      Map<String,dynamic> map = json.decode(jsonString);
      return map as T;
    }
    return null;
  }

}