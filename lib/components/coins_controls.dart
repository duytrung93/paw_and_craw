import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_craw/objects/user.dart';

class CoinsControls extends StatelessWidget {
  Rx<User> get user => Get.find<UserController>().data;

  const CoinsControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Obx(
              () => Text(
                '${user.value.coin ?? 0}',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'MoreSugar', fontSize: 25),
              ),
            ),
          ),
          Image.asset(
            'assets/v2_images/user_coins.png',
            width: 35,
          ),
        ],
      ),
    );
  }
}
