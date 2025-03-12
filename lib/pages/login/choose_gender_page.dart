import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/functions/local_storage.dart';
import 'package:paw_and_craw/objects/user.dart';

class ChooseGenderPage extends StatefulWidget {
  const ChooseGenderPage({super.key});

  @override
  State<ChooseGenderPage> createState() => _ChooseGenderPageState();
}

class _ChooseGenderPageState extends State<ChooseGenderPage> {
  Rx<User> get user => Get.find<UserController>().data;

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Stack(
        fit: StackFit.expand,
        children: [
          //Góc trái
          Positioned(
            top: -230,
            left: -230,
            child: Image.asset(
              'assets/images/image60.png',
              width: 400,
            ),
          ),
          //Chữ tiêu đề
          Positioned(
            top: 40,
            left: 180,
            child: Text(
              'Let\'s try to play it!',
              style: TextStyle(
                fontFamily: 'Shantell Sans',
                fontWeight: FontWeight.bold,
                color: Color(0xff503d3d),
                fontSize: 60,
              ),
            ),
          ),
          //Chữ nội dung
          Positioned(
            top: 150,
            left: 280,
            child: Text(
              'Choose your\ngender',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'lazy_dog',
                color: Color(0xff051d40),
                fontSize: 25,
              ),
            ),
          ),
          //Girl
          Positioned(
            bottom: 80,
            left: 140,
            child: GestureDetector(
              onTap: () {
                chooseGender(2);
              },
              child: Image.asset(
                'assets/images/image62.png',
                width: 115,
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            left: 165,
            child: GestureDetector(
              onTap: () {
                chooseGender(2);
              },
              child: Text(
                'GIRL',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Comic Sans MS',
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  color: Color(0xff051d40),
                  fontSize: 30,
                ),
              ),
            ),
          ),
          //Boy
          Positioned(
            bottom: 80,
            right: 210,
            child: GestureDetector(
              onTap: () {
                chooseGender(1);
              },
              child: Image.asset(
                'assets/images/image64.png',
                width: 150,
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            right: 235,
            child: GestureDetector(
              onTap: () {
                chooseGender(1);
              },
              child: Text(
                'BOY',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Comic Sans MS',
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  color: Color(0xff051d40),
                  fontSize: 30,
                ),
              ),
            ),
          ),
          //Góc phải
          Positioned(
            bottom: -240,
            right: -235,
            child: Image.asset(
              'assets/images/image60.png',
              width: 400,
            ),
          ),
        ],
      ),
    );
  }

  void chooseGender(int i) {
    user.update(
      (val) {
        val?.gender = i;
      },
    );
    LocalStorage.setLogin(user.value).then(
      (value) {
        Get.offAllNamed('/');
      },
    );
  }
}
