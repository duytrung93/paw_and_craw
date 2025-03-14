import 'dart:convert';

import 'package:paw_and_craw/objects/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum StorageType { User }

class LocalStorage {
  static Future<SharedPreferences> get _prefs =>
      SharedPreferences.getInstance();

  static Future<User?> getCurrentUser() async {
    String? userName = await getData(StorageType.User);
    if (userName == 'null' || userName == null || userName.isEmpty) return null;
    return getUser(userName ?? '');
  }

  static Future<bool?> setCurrentUser(String? value) {
    return setData(StorageType.User, (value ?? '').trim());
  }

  static Future<User?> getUser(String? userName) {
    return _prefs.then((p) async {
      if (userName == null) return null;
      String? json = p.getString((userName ?? '').trim());
      print('================getUser=============');
      print(json);
      if (json == 'null' || json == null) return null;
      return User.fromJson(jsonDecode(json));
    }).catchError((onError) {
      return null;
    });
  }

  static Future<bool?> setUser(User? value) {
    return _prefs.then((p) {
      return p.setString('${value?.name}'.trim(), jsonEncode(value?.toJson()));
    });
  }

  static Future<bool?> removeUser(String? userName) {
    return _prefs.then((p) {
      return p.remove((userName ?? '').trim());
    });
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
