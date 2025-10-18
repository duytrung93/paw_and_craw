import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif/gif.dart';
import 'package:paw_and_craw/api/api.dart';
import 'package:paw_and_craw/components/fixed_image.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/functions/local_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Rx<String> username = ''.obs;
  Rx<String> password = ''.obs;
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
          // FixedImage(
          //   top: -4,
          //   left: 186,
          //   child: Image.asset(
          //     'assets/v2_images/login_title.png',
          //     width: 400,
          //   ),
          // ),
          FixedImage(
            top: -33,
            left: 273,
            child: Text(
              'Log in',
              style: TextStyle(
                fontFamily: 'Gladiola',
                fontSize: 100,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Color(0xffffb81b),
                    blurRadius: 30,
                  )
                ],
              ),
            ),
          ),
          FixedImage(
            top: 4,
            left: 534,
            child: Image.asset(
              'assets/v2_images/new_account_cauvong.png',
              width: 160,
            ),
          ),
          FixedImage(
            top: 158,
            left: 58,
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    'Name',
                    style: TextStyle(fontFamily: 'LobsterTwo', fontSize: 28),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Global.showInput(context,
                            initialValue: username.value,
                            hintText: 'Input your username')
                        .then(
                      (value) {
                        username.value = value;
                      },
                    );
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/v2_images/new_account_input.png',
                        width: 400,
                        fit: BoxFit.fill,
                        // width: 100,
                      ),
                      Positioned(
                        top: 10,
                        left: 35,
                        child: Obx(
                          () => Text(
                            username.value,
                            style: TextStyle(
                              fontFamily: 'Shantell Sans',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          FixedImage(
            top: 268,
            left: 325,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    spacing: 5,
                    children: [
                      Text(
                        'Password',
                        style:
                            TextStyle(fontFamily: 'LobsterTwo', fontSize: 28),
                      ),
                      GestureDetector(
                        onTap: () {
                          Global.showInput(context,
                                  initialValue: password.value,
                                  hintText: 'Input your password',
                                  obscureText: true)
                              .then(
                            (value) {
                              password.value = value;
                            },
                          );
                        },
                        child: Stack(
                          children: [
                            Transform.rotate(
                              angle: pi * 3,
                              child: Image.asset(
                                'assets/v2_images/new_account_input.png',
                                width: 400,
                                fit: BoxFit.fill,
                                // width: 100,
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 35,
                              child: Obx(
                                () => Text(
                                  List.generate(
                                    password.value.length,
                                    (index) => '*',
                                  ).join(''),
                                  style: TextStyle(
                                    fontFamily: 'Shantell Sans',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 0,
                  child: Transform.rotate(
                    angle: pi * 0.1,
                    child: Image.asset(
                      'assets/v2_images/login_buom.png',
                      width: 60,
                      fit: BoxFit.fill,
                      // width: 100,
                    ),
                  ),
                )
              ],
            ),
          ),
          FixedImage(
            top: 124,
            left: 350,
            child: Stack(
              children: [
                Image.asset(
                  'assets/v2_images/login_gau.png',
                  width: 142,
                ),
                Positioned(
                  top: 42,
                  left: 15,
                  child: Image.asset(
                    'assets/v2_images/login_kinh.png',
                    width: 110,
                  ),
                )
              ],
            ),
          ),
          FixedImage(
            top: 406,
            left: 695,
            child: GestureDetector(
              onTap: () {
                API.users
                    .login(username: username.value, password: password.value)
                    .then((value) {
                  LocalStorage.setUser(value);
                  Get.offAllNamed('/');
                });
              },
              child: Stack(
                children: [
                  Gif(
                    image: AssetImage('assets/v2_images/new_account_btn.gif'),
                    width: 80,
                    autostart: Autostart.loop,
                    duration: Duration(seconds: 6),
                  ),
                  Positioned(
                    top: 28,
                    left: 15,
                    child: Text(
                      'Okay!',
                      style: TextStyle(fontFamily: 'LobsterTwo', fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
          FixedImage(
            top: 0,
            left: 760.0,
            // dragable: true,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 20,
              icon: Image.asset(
                'assets/images/image87.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
