import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif/gif.dart';
import 'package:paw_and_craw/api/api.dart';
import 'package:paw_and_craw/components/fixed_image.dart';
import 'package:paw_and_craw/components/form/action_button.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/functions/local_storage.dart';
import 'package:paw_and_craw/objects/user.dart';
import 'package:paw_and_craw/objects/users/users_register.dart';
import 'package:paw_and_craw/pages/login/choose_animal_page.dart';

class MakeAccountPage extends StatefulWidget {
  final UserType type;
  const MakeAccountPage({super.key, required this.type});

  @override
  State<MakeAccountPage> createState() => _MakeAccountPageState();
}

class _MakeAccountPageState extends State<MakeAccountPage> {
  late UsersRegisterController controller;

  String error = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = UsersRegisterController(UsersRegister());
    // showInput(context);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // precacheImage(AssetImage('assets/images/image30.gif'), context);
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      // backgroundColor: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          //Nền
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
          //Bắn tim
          FixedImage(
            top: 405,
            left: 698,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                var check = controller.data.value.getValidate();
                if (check != null) {
                  Global.showMessage(check, messageColor: Colors.redAccent);
                } else {
                  API.users.register(info: controller.data.value).then((value) {
                    API.users
                        .login(
                      username: controller.data.value.username,
                      password: controller.data.value.password,
                    )
                        .then((value) {
                      LocalStorage.setUser(value);
                      Get.offAllNamed('/');
                    });
                  });
                }
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
            top: 70,
            left: 78,
            child: Column(
              children: [
                Image.asset(
                  'assets/v2_images/new_account_cauvong.png',
                  width: 160,
                ),
                Text(
                  'Make a',
                  style: TextStyle(
                    fontFamily: 'Gladiola',
                    fontSize: 80,
                    height: 1,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Color(0xffffb81b),
                        blurRadius: 30,
                      )
                    ],
                  ),
                ),
                Text(
                  'NEW ACCOUNT',
                  style: TextStyle(
                    height: 1,
                    fontFamily: 'impact',
                    fontSize: 30,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Color(0xffffb81b),
                        blurRadius: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          FixedImage(
            top: 320,
            left: 24,
            child: Column(
              spacing: 5,
              children: [
                Text(
                  'Name ( do not use your usual name )',
                  style: TextStyle(fontFamily: 'LobsterTwo', fontSize: 26),
                ),
                Obx(
                  () => buildInput(
                    context,
                    hintText: 'Input your name',
                    initialValue: controller.data.value.fullName,
                    onChanged: (v) {
                      controller.data.update((val) => val?.fullName = v);
                    },
                  ),
                ),
              ],
            ),
          ),

          FixedImage(
            top: 68,
            left: 359,
            child: Column(
              spacing: 5,
              children: [
                Text(
                  'Login name',
                  style: TextStyle(fontFamily: 'LobsterTwo', fontSize: 26),
                ),
                Obx(
                  () => buildInput(
                    context,
                    initialValue: controller.data.value.username,
                    hintText: 'Input your username',
                    onChanged: (v) {
                      controller.data.update((val) => val?.username = v);
                    },
                  ),
                ),
              ],
            ),
          ),

          FixedImage(
            top: 182,
            left: 382,
            child: Column(
              spacing: 5,
              children: [
                Text(
                  'Create your own password',
                  style: TextStyle(fontFamily: 'LobsterTwo', fontSize: 26),
                ),
                Obx(
                  () => buildInput(
                    context,
                    initialValue: controller.data.value.password,
                    hintText: 'Input your pasword',
                    obscureText: true,
                    onChanged: (v) {
                      controller.data.update((val) => val?.password = v);
                    },
                  ),
                ),
              ],
            ),
          ),

          FixedImage(
            top: 297,
            left: 423,
            child: Column(
              spacing: 5,
              children: [
                Text(
                  'Enter your password one more time',
                  style: TextStyle(fontFamily: 'LobsterTwo', fontSize: 26),
                ),
                Obx(
                  () => buildInput(
                    context,
                    initialValue: controller.data.value.rePassword,
                    hintText: 'Confirm your pasword',
                    obscureText: true,
                    onChanged: (v) {
                      controller.data.update((val) => val?.rePassword = v);
                    },
                  ),
                ),
              ],
            ),
          ),
          FixedImage(
            top: 0,
            left: 750,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                'assets/images/image87.png',
                width: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInput(
    BuildContext context, {
    String? hintText,
    String? initialValue,
    bool obscureText = false,
    required Function(String v) onChanged,
  }) {
    return GestureDetector(
      onTap: () {
        Global.showInput(context,
                initialValue: initialValue ?? '',
                hintText: hintText,
                obscureText: obscureText)
            .then(
          (value) {
            onChanged(value);
          },
        );
      },
      child: Stack(
        children: [
          Image.asset(
            'assets/v2_images/new_account_input.png',
            width: 312,
            fit: BoxFit.fill,
            // width: 100,
          ),
          Positioned(
            top: obscureText ? 14 : 8,
            left: 35,
            child: Text(
              obscureText
                  ? List.generate((initialValue ?? '').length, (index) => '*')
                      .join('')
                  : initialValue ?? '',
              style: TextStyle(
                fontFamily: 'Shantell Sans',
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // void showInput(BuildContext context) {
  //   Global.showInput(context,
  //           initialValue: txtName.text,
  //           maxLength: 10,
  //           hintText: 'Input your name')
  //       .then(
  //     (value) {
  //       txtName.text = value;
  //       _formKey.currentState!.validate();
  //       userController.data.update(
  //         (val) {
  //           val?.name = txtName.text;
  //         },
  //       );
  //     },
  //   );
  // }
}
