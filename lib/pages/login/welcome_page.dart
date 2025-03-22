import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:paw_and_craw/api/api.dart';
import 'package:paw_and_craw/components/fixed_image.dart';
import 'package:paw_and_craw/components/form/action_button.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/objects/user.dart';
import 'package:paw_and_craw/pages/login/login_page.dart';
import 'package:paw_and_craw/pages/login/make_account_page.dart';
import 'package:paw_and_craw/pages/login/play_without_account_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    return MainScaffold(
        child: Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Image.asset(
            'assets/v2_images/welcome_bg.png',
            fit: BoxFit.cover,
          ),
        ),
        //Con tê giác
        FixedImage(
          top: 133,
          left: 26,
          child: Image.asset(
            'assets/v2_images/welcome_tegiac.png',
            width: 180,
          ),
        ),
        //Con gấu trúc
        FixedImage(
          top: 322,
          left: 46,
          child: Image.asset(
            'assets/v2_images/welcome_panda.png',
            width: 140,
          ),
        ),

        //Con thỏ trên
        FixedImage(
          top: 0,
          left: 667,
          child: Image.asset(
            'assets/v2_images/welcome_tho_top.png',
            width: 230,
          ),
        ),

        //Con thỏ nhai carot
        FixedImage(
          top: 248,
          left: 648,
          child: Image.asset(
            'assets/v2_images/welcome_tho.png',
            width: 140,
          ),
        ),
        //COntent chính
        Column(
          // spacing: 25,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/v2_images/welcome_title.png',
              width: 480,
            ),
            SizedBox(height: 6),
            ActionButton(
              width: 350,
              contentPadding: EdgeInsets.all(14),
              borderColor: Color(0xffcb7f00),
              action: () {
                Global.to(MakeAccountPage(
                  type: UserType.newAccount,
                ));
              },
              child: Text(
                'Make new account',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'LobsterTwo',
                  color: Colors.black,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30),
            ActionButton(
              width: 350,
              contentPadding: EdgeInsets.all(14),
              borderColor: Color(0xffcb7f00),
              action: () {
                Global.to(LoginPage());
              },
              child: Text(
                'Log in',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontFamily: 'LobsterTwo',
                ),
              ),
            ),
            SizedBox(height: 30),

            ActionButton(
              width: 350,
              contentPadding: EdgeInsets.all(14),
              borderColor: Color(0xffcb7f00),
              action: () {
                Global.to(PlayWithoutAccountPage());
              },
              child: Text(
                'Play with out account',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontFamily: 'LobsterTwo',
                ),
              ),
            ),
          ],
        ),

        //vết chân
        Positioned(
          top: 240,
          right: 250,
          child: Image.asset(
            'assets/v2_images/welcome_vetchan.png',
            width: 80,
          ),
        ),
      ],
    ));
  }
}
