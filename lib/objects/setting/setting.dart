import 'dart:convert';

import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:paw_and_craw/functions/audio_utils.dart';
import 'package:paw_and_craw/functions/local_storage.dart';

part 'setting.g.dart';

@JsonSerializable()
class Setting {
  bool? music;
  bool? vibrate;
  bool? notification;

  Setting({this.music, this.vibrate, this.notification});

  factory Setting.fromJson(Map<String, dynamic> json) =>
      _$SettingFromJson(json);

  Map<String, dynamic> toJson() => _$SettingToJson(this);
}

class SettingController extends GetxController {
  Rx<Setting> data = Setting().obs;
  Rx<bool> music = false.obs;
  Rx<bool> vibrate = false.obs;
  Rx<bool> notification = false.obs;
  SettingController(Setting info) {
    music.listen((p0) {
      data.update((val) => val?.music = p0);
      if (p0 == true) {
        AudioUtils.playBgMusic();
      } else {
        AudioUtils.pauseBgMusic();
      }
    });
    vibrate.listen((p0) => data.update((val) => val?.vibrate = p0));
    notification.listen((p0) => data.update((val) => val?.notification = p0));
    updateDisplay(info);
  }

  void updateDisplay(Setting info) {
    data.update((val) {
      val?.music = info.music;
      val?.vibrate = info.vibrate;
      val?.notification = info.notification;
    });
    music.value = info.music ?? false;
    vibrate.value = info.vibrate ?? false;
    notification.value = info.notification ?? false;
  }

  Future loadData() async {
    try {
      var data = await LocalStorage.getData(StorageType.Setting);
      if (data != null) {
        updateDisplay(Setting.fromJson(jsonDecode(data)));
      }
    } catch (e) {}
  }
}
