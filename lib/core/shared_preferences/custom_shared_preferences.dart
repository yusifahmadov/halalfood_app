import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPreferences {
  static saveUser(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, json.encode(value).toString());
  }

  static readUser(String key) async {
    final prefs = await SharedPreferences.getInstance();
    //json.decode to convert json string back to Json Object
    if (prefs.getString(key) != null) {
      return json.decode(prefs.getString(key)!);
    }
  }
}
