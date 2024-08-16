import 'package:shared_preferences/shared_preferences.dart';

class CachShpreafapp {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool>? putbool(
      {required String key, required bool value}) async {
    return await sharedPreferences!.setBool(key, value);
  }

  static Future<bool>? putString(
      {required String key, required String value}) async {
    return await sharedPreferences!.setString(key, value);
  }

  static Future<bool>? remove({required String key}) async {
    return await sharedPreferences!.remove(key);
  }

  static dynamic getdata({required String key}) {
    return sharedPreferences!.get(key);
  }

  static Future<bool>? sevedata(
      {required String key, required dynamic value}) async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);
    return await sharedPreferences!.setDouble(key, value);
  }
}
