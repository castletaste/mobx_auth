import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static SharedPreferences? _prefs;
  static Future<SharedPreferences> get _instance async =>
      _prefs ??= await SharedPreferences.getInstance();

  /// Initializes the shared preferences for the app [SharedPreferences] object.
  static Future<void> init() async {
    _prefs = await _instance;
  }

  ///restore user's token
  static String? restoreToken() => _prefs!.getString('token');

  ///save user's token
  static Future<bool> saveToken(String? token) => token != null
      ? _prefs!.setString('token', token)
      : _prefs!.remove('token');

  ///fake register
  static Future<bool> fakeRegister(String name, String hash) =>
      _prefs!.setString('hash_$name', hash);

  ///check pass hash
  static String? checkPassHash(String name) => _prefs!.getString('hash_$name');

  ///restore user's [Theme]
  static String? restoreTheme() => _prefs!.getString('theme');

  ///save selected [Theme]
  static Future<bool> saveTheme(String themeName) =>
      _prefs!.setString('theme', themeName);
}
