import 'dart:convert';

import 'package:paw_and_craw/objects/pets/my_pets.dart';
import 'package:paw_and_craw/objects/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum StorageType { User, MyPet, Setting, ActiveAnimal }

class LocalStorage {
  static Future<SharedPreferences> get _prefs =>
      SharedPreferences.getInstance();

  static Future<MyPets?> getMyPet() async {
    String? json = await getData(StorageType.MyPet);
    try {
      if (json == 'null' || json == null) return null;
      return MyPets.fromJson(jsonDecode(json));
    } catch (e) {
      return null;
    }
  }

  static Future<bool?> setMyPet(MyPets? value) {
    return setData(StorageType.MyPet, jsonEncode(value?.toJson()));
  }

  static Future<User?> getUser() async {
    String? json = await getData(StorageType.User);
    try {
      if (json == 'null' || json == null) return null;
      return User.fromJson(jsonDecode(json));
    } catch (e) {
      return null;
    }
  }

  static Future<bool?> setUser(User? value) {
    return setData(StorageType.User, jsonEncode(value?.toJson()));
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

  static Future<bool?> setData(StorageType key, String? value) {
    print('$key');
    return _prefs.then((p) {
      if (value == null) {
        return p.remove('$key');
      }else {
        return p.setString('$key', value);
      }
    });
  }
}
