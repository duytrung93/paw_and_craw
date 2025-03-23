import 'dart:math';

import 'package:curved_text/curved_text.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DonateThanksPage extends StatefulWidget {
  const DonateThanksPage({super.key});

  @override
  State<DonateThanksPage> createState() => _DonateThanksPageState();
}

class _DonateThanksPageState extends State<DonateThanksPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {


      if(mounted){
        launchUrlString('https://pan.give.asia/campaign/safeguarding-vietnam-s-biodiversity-with-us?#/story');
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Stack(
        fit: StackFit.expand,
        children: [
          //TopRight
          Positioned(
            top: -25,
            right: -70,
            child: Image.asset(
              'assets/images/image25.png',
              width: 270,
            ),
          ),
          Positioned(
            top: -10,
            left: 50,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(pi),
              child: Image.asset(
                'assets/images/image130.png',
                width: 80,
              ),
            ),
          ),

          //TopLeft - Chim
          Positioned(
            top: -50,
            left: 140,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(pi),
              child: Gif(
                width: 100,
                autostart: Autostart.loop,
                duration: Duration(seconds: 1),
                image: AssetImage('assets/images/image24.gif'),
              ),
            ),
          ),
          //TopLeft - Chim
          Positioned(
            bottom: -100,
            left: -100,
            child: Gif(
              width: 350,
              autostart: Autostart.loop,
              duration: Duration(seconds: 2),
              image: AssetImage('assets/images/image127.gif'),
            ),
          ),
          Positioned(
            bottom: -10,
            left: 200,
            child: Image.asset(
              'assets/images/image128.png',
              width: 350,
            ),
          ),
          Positioned(
            bottom: -10,
            right: 105,
            child: Image.asset(
              'assets/images/image129.png',
              width: 150,
            ),
          ),

          Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                CurvedText(
                  text: 'Thanks for donating',
                  // textAlign: TextAlign.center,
                  textStyle: TextStyle(
                      fontFamily: 'lazy_dog',
                      color: Color(0xffFE95F6),
                      fontSize: 70,
                      letterSpacing: -8,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 20,
                        )
                      ]),
                  curvature: 0.004,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
