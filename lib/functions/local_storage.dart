import 'dart:convert';

import 'package:paw_and_craw/objects/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum StorageType { User }

class LocalStorage {
  static Future<SharedPreferences> get _prefs =>
      SharedPreferences.getInstance();

  static Future<User?> getLogin() async {
    String? json = await getData(StorageType.User);
    if (json == 'null' || json == null) return null;
    return User.fromJson(jsonDecode(json));
  }

  static Future<bool?> setLogin(User? value) {
    return setData(StorageType.User, jsonEncode(value?.toJson()));
  }

  static Future<String?> getData(StorageType key) {
    print('$key');
    return _prefs.then((p) {
      return p.getString('$key');
    }).catchError((onError) {
      return null;
    });
  }

  static Future<bool?> setData(StorageType key, String value) {
    print('$key');
    return _prefs.then((p) {
      return p.setString('$key', value);
    });
  }
}
