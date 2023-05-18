import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:halal_design/models/sign_in_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static String isLogin = "App is Login";
  static String firstTimeAppOpen = " First Time Opening App";
  SharedPreferences? _preferences;
  SharedPref() {
    if (kDebugMode) {
      print("sharepref init");
    }
    init();
  }
  Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  void setUser(User user) {
    _preferences!.setString(isLogin, jsonEncode(user.toJson()));
  }

  void logout() {
    _preferences!.setString(isLogin, "");
  }

  String read() {
    const key = "token";
    String value = _preferences!.getString(key)!;
    if (kDebugMode) {
      print('read: $value');
    }
    return value.isEmpty ? "0" : value;
  }

  saveToken(String value) {
    _preferences!.setString("token", value);
  }

  User? getUser() {
    var user = _preferences!.getString(isLogin);
    if (kDebugMode) {
      print("user value $user");
    }
    if (user != null && user.isNotEmpty) {
      var json = jsonDecode(user);

      User userValue = json['account_type'] == 'buyer'
          ? User.fromJson(json)
          : User.fromJson(json);
      return userValue;
    } else {
      return null;
    }
  }

  void setFirstTimeOpen(bool value) {
    _preferences!.setBool(firstTimeAppOpen, value);
  }

  bool getFirstTimeOpen() {
    var value = _preferences!.getBool(firstTimeAppOpen);
    if (kDebugMode) {
      print("Am I a new User?  $value");
    }
    return value ?? true;
  }
}
