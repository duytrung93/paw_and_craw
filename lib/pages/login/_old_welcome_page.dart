import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:paw_and_craw/components/form/action_button.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/objects/user.dart';
import 'package:paw_and_craw/pages/login/make_account_page.dart';

class OldWelcomePage extends StatefulWidget {
  const OldWelcomePage({super.key});

  @override
  State<OldWelcomePage> createState() => _OldWelcomePageState();
}

class _OldWelcomePageState extends State<OldWelcomePage>
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
        //Vết chân
        Positioned(
          top: 15,
          left: 100,
          child: Image.asset(
            'assets/images/Picture5.png',
            width: 180,
          ),
        ),
        //Ngôi sao
        Positioned(
          top: 200,
          left: 170,
          child: Gif(
            image: AssetImage('assets/images/image15.gif'),
            width: 100,
            autostart: Autostart.loop,
            duration: Duration(seconds: 2),
          ),
        ),
        //Gấu trúc
        Positioned(
          top: 55,
          left: 10,
          child: Image.asset(
            'assets/images/Picture3.png',
            width: 180,
          ),
        ),
        //Vũng nước
        Positioned(
          bottom: -20,
          left: -50,
          child: Image.asset(
            'assets/images/Picture13.png',
            width: 250,
          ),
        ),
        //Cá voi
        Positioned(
          bottom: 50,
          left: 40,
          child: Image.asset(
            'assets/images/Picture11.png',
            width: 150,
          ),
        ),
        //Vết cát
        Positioned(
          bottom: -20,
          right: -50,
          child: Image.asset(
            'assets/images/Picture12.png',
            width: 320,
          ),
        ),
        //Con tê giác
        Positioned(
          bottom: 20,
          right: 20,
          child: Image.asset(
            'assets/images/Picture14.png',
            width: 160,
          ),
        ),
        //Đèn lồng
        Positioned(
          top: 0,
          left: 238,
          child: Gif(
            image: AssetImage('assets/images/image14.gif'),
            width: 60,
            autostart: Autostart.loop,
            duration: Duration(seconds: 1),
          ),
        ),
        //Trăng treo
        Positioned(
          top: -35,
          right: 105,
          child: Image.asset('assets/images/Picture6.png', width: 170),
        ),
        //Mũi tên
        Positioned(
          top: 215,
          right: 240,
          child: Transform.rotate(
            angle: pi / 4,
            child: Gif(
              image: AssetImage('assets/images/image16.gif'),
              width: 50,
              autostart: Autostart.loop,
              duration: Duration(seconds: 2),
            ),
          ),
        ),
        //Bông hoa
        Positioned(
          top: 160,
          right: 110,
          child: Gif(
            image: AssetImage('assets/images/image13.gif'),
            width: 120,
            autostart: Autostart.loop,
            duration: Duration(seconds: 6),
          ),
        ),
        //COn hổ
        Positioned(
          top: 50,
          right: 20,
          child: Image.asset('assets/images/Picture7.png', width: 110),
        ),
        //COntent chính
        Center(
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome to',
                style: TextStyle(fontFamily: 'Comic Sans MS', fontSize: 15),
              ),
              SizedBox(height: 10),
              Text(
                'PAWS & CLAWS\nPROTECTOR',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Shantell Sans',
                  height: 1.2,
                  fontSize: 50,
                  color: Color(0xff503d3d),
                ),
              ),
              SizedBox(height: 10),
              ActionButton(
                action: () {
                  Global.to(MakeAccountPage(
                    type: UserType.newAccount,
                  ));
                },
                child: Text(
                  'Make new a account'.toUpperCase(),
                  style: TextStyle(
                      fontFamily: 'Paytone One',
                      color: Colors.black,
                      decoration: TextDecoration.underline
                      // fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              ActionButton(
                action: () {
                  Global.to(MakeAccountPage(
                    type: UserType.loginAccount,
                  ));
                },
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Francois One',
                  ),
                ),
              ),
              ActionButton(
                action: () {
                  Global.to(MakeAccountPage(
                    type: UserType.playWithoutAccount,
                  ));
                },
                child: Text(
                  'Play with out account',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Francois One',
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
