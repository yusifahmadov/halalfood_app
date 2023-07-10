import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/user/domain/entities/user_extended.dart';

class CustomSharedPreferences {
  static saveUser(String key, ExtendedUser value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, json.encode(value).toString());
  }

  static readUser(String key) async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString(key) != null) {
      return json.decode(prefs.getString(key)!);
    }
  }
}
