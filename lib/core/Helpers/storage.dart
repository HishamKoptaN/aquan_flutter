import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;

    return _prefsInstance;
  }

  static String? getString(String key, {String? defaultValue}) {
    Storage.init();
    String? value = _prefsInstance?.getString(key);
    if (value == null) {
      return defaultValue;
    }

    return value;
  }

  static int? getInt(String key, {int? defaultValue}) {
    Storage.init();
    return _prefsInstance?.getInt(key) ?? defaultValue;
  }

  static double? getDouble(String key, {double? defaultValue}) {
    Storage.init();
    return _prefsInstance?.getDouble(key) ?? defaultValue;
  }

  static bool? getBool(String key, {bool? defaultValue}) {
    Storage.init();
    return _prefsInstance?.getBool(key) ?? defaultValue;
  }

  static List<String>? getStrings(String key, {List<String>? defaultValue}) {
    Storage.init();
    return _prefsInstance?.getStringList(key) ?? defaultValue;
  }

  static Future<bool> setString(String key, String value) async {
    Storage.init();
    var prefs = await _instance;

    return prefs.setString(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    Storage.init();
    var prefs = await _instance;

    return prefs.setInt(key, value);
  }

  static Future<bool> setDouble(String key, double value) async {
    Storage.init();
    var prefs = await _instance;

    return prefs.setDouble(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    Storage.init();
    var prefs = await _instance;

    return prefs.setBool(key, value);
  }

  static Future<bool> setStrings(String key, List<String> value) async {
    Storage.init();
    var prefs = await _instance;

    return prefs.setStringList(key, value);
  }

  static clear() {
    Storage.init();
    _prefsInstance?.clear();
  }
}
