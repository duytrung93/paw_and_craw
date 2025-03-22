import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_craw/components/coins_controls.dart';
import 'package:paw_and_craw/components/fixed_image.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/objects/pets/my_pets.dart';
import 'package:paw_and_craw/objects/user.dart';
import 'package:paw_and_craw/pages/about/about_page.dart';
import 'package:paw_and_craw/pages/about/information_page.dart';
import 'package:paw_and_craw/pages/about/profile_page.dart';
import 'package:paw_and_craw/pages/donate/donate_page.dart';
import 'package:paw_and_craw/pages/email/email_start_page.dart';
import 'package:paw_and_craw/pages/follow_animals/follow_video_list_page.dart';
import 'package:paw_and_craw/pages/quiz/quiz_start_page.dart';
import 'package:paw_and_craw/pages/shop/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserController userController;
  late MyPetsController petController;
  Rx<User> get user => userController.data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    userController = UserController(Global.loginResult ?? User());
    petController = MyPetsController(Global.myPets ?? MyPets());
    Get.put(userController);
    Get.put(petController);
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset('assets/v2_images/home_bg.png'),
          ),
          FixedImage(
            top: 20,
            left: 30,
            child: Column(
              spacing: 15,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Color(0xffa4ae2d),
                    width: 250,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            'assets/v2_images/home_avatar.jpg',
                            width: 50,
                          ),
                        ),
                        Expanded(
                          child: Obx(
                            () => Opacity(
                              opacity: 0.67,
                              child: Text(
                                petController.data.value.name ?? '',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'LobsterTwo',
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Global.to(ShopPage());
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: [
                      Row(
                        spacing: 20,
                        children: [
                          Image.asset('assets/v2_images/home_shop.png',
                              width: 55),
                          CoinsControls()
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Shop',
                          style:
                              TextStyle(fontFamily: 'LobsterTwo', fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Global.to(InformationPage());
                  },
                  child: Column(
                    spacing: 5,
                    children: [
                      Image.asset('assets/v2_images/homg_profile.png',
                          width: 55),
                      Text(
                        'Information',
                        style:
                            TextStyle(fontFamily: 'LobsterTwo', fontSize: 18),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Global.to(DonatePage());
                  },
                  child: Column(
                    spacing: 5,
                    children: [
                      Image.asset('assets/v2_images/home_donate.png',
                          width: 70),
                      Text(
                        'Donate',
                        style:
                            TextStyle(fontFamily: 'LobsterTwo', fontSize: 18),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Global.to(EmailStartPage());
                  },
                  child: Column(
                    spacing: 5,
                    children: [
                      Image.asset('assets/v2_images/home_mail.png', width: 70),
                      Text(
                        'Email us',
                        style:
                            TextStyle(fontFamily: 'LobsterTwo', fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          FixedImage(
            top: 10,
            left: 651,
            child: Column(
              // spacing: 70,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Global.to(ProfilePage());
                  },
                  child: Image.asset('assets/v2_images/home_setting.png',
                      width: 60),
                ),
                SizedBox(height: 65),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Global.to(AboutPage());
                    },
                    child: Column(
                      spacing: 5,
                      children: [
                        Image.asset('assets/v2_images/home_about.png',
                            width: 40),
                        Text(
                          'About',
                          style:
                              TextStyle(fontFamily: 'LobsterTwo', fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 45),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Global.to(FollowVideoListPage());
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: 5,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image.asset('assets/v2_images/home_video.png',
                            width: 70),
                      ),
                      Text(
                        'Look after your pet',
                        style:
                            TextStyle(fontFamily: 'LobsterTwo', fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          FixedImage(
            top: 405,
            left: 516,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Global.to(QuizStartPage());
              },
              child: Stack(
                children: [
                  Image.asset(
                    'assets/v2_images/home_button.png',
                    width: 270,
                  ),
                  Positioned(
                    top: 10,
                    left: 80,
                    child: Text(
                      'Game',
                      style: TextStyle(fontFamily: 'MoreSugar', fontSize: 35),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 69,
            left: 220,
            child: Obx(
              () => Image.asset(
                petController.data.value.getPetAvatar(),
                width: 250,
                fit: BoxFit.contain,
              ),
            ),
          ),
          FixedImage(
            top: 24,
            left: 375,
            child: Stack(
              children: [
                Image.asset(
                  'assets/v2_images/home_chat.png',
                  width: 250,
                  fit: BoxFit.contain,
                ),
                FixedImage(
                  top: 20,
                  left: 57,
                  child: Text(
                    'Hey!\nWelcome to\nour app!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'MoreSugar',
                      fontSize: 28,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FixedImage(
            top: 27,
            left: 560,
            child: Transform.rotate(
              angle: pi * 0.1,
              child: Image.asset(
                'assets/v2_images/home_tim.png',
                width: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildText(
    String text, {
    double size = 16,
    FontWeight? weight,
    TextDecoration? decoration,
  }) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: 'Shantell Sans',
          fontSize: size,
          height: 1.1,
          fontWeight: weight ?? FontWeight.bold,
          decoration: decoration ?? TextDecoration.underline,
          decorationThickness: 0.5),
    );
  }
}
