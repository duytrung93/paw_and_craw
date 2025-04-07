import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_craw/components/fixed_image.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/functions/local_storage.dart';
import 'package:paw_and_craw/objects/setting/setting.dart';
import 'package:paw_and_craw/pages/about/profile_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  SettingController controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        child: Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Transform.rotate(
              angle: pi / 2,
              child: Opacity(
                opacity: 0.7,
                child: Image.asset(
                  'assets/v2_images/new_account_bg.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        FixedImage(
          top: 32,
          left: 162,
          // dragable: true,
          child: Image.asset(
            'assets/v2_images/cauvong.png',
            width: 100,
          ),
        ),
        FixedImage(
          top: 14,
          left: 280,
          // dragable: true,
          child: Text(
            'SETTING',
            style: TextStyle(fontFamily: 'MoreSugar', fontSize: 50),
          ),
        ),
        FixedImage(
          top: 20,
          left: 719,
          // dragable: true,
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/images/image87.png',
                width: 50,
              )),
        ),
        FixedImage(
          top: 122,
          left: 377,
          dragable: true,
          child: GestureDetector(
            onTap: () {
              Global.to(ProfilePage());
            },
            child: Row(
              children: [
                Text(
                  'Edit profile',
                  style: TextStyle(
                    fontFamily: 'Arturo',
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
          ),
        ),
        FixedImage(
          top: 82,
          left: 30,
          child: buildSwitch(Icons.volume_up, controller.music),
        ),
        FixedImage(
          top: 197,
          left: 30,
          child: buildSwitch(Icons.vibration_rounded, controller.vibrate),
        ),
        FixedImage(
          top: 312,
          left: 30,
          child: buildSwitch(
              Icons.notifications_outlined, controller.notification),
        ),
      ],
    ));
  }

  buildSwitch(IconData icon, Rx<bool> data) {
    return Row(
      spacing: 20,
      children: [
        Icon(
          icon,
          size: 115,
        ),
        Obx(
          () => GestureDetector(
            onTap: () {
              data(!data.value);
              LocalStorage.setData(StorageType.Setting,
                  jsonEncode(controller.data.value.toJson()));
            },
            child: Image.asset(
              data.value
                  ? 'assets/v2_images/icons8-toggle-on-80.png'
                  : 'assets/v2_images/icons8-switch-80.png',
              width: 110,
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}
