import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:paw_and_craw/components/form/action_button.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/pages/donate/donate_thanks_page.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({super.key});

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Stack(
        fit: StackFit.expand,
        children: [
          //topRight
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/image124.png',
              width: 150,
            ),
          ),
          //BottomRight
          Positioned(
            bottom: 50,
            right: 0,
            child: Gif(
              width: 200,
              duration: Duration(seconds: 5),
              autostart: Autostart.loop,
              image: AssetImage('assets/images/image120.gif'),
            ),
          ),

          //topLeft
          Positioned(
            top: 0,
            left: -35,
            child: Image.asset(
              'assets/images/image122.png',
              width: 195,
            ),
          ),

          //BottomLeft
          Positioned(
            bottom: -20,
            left: 10,
            child: Image.asset(
              'assets/images/image121.png',
              width: 195,
            ),
          ),
          Center(
            child: Column(
              children: [
                Text(
                  'How much you\nwant to donate'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Bungee',
                    color: Color(0xffFFBD59),
                    fontSize: 50,
                  ),
                ),
                Expanded(child: Container()),
                buildActionButton('\$5'),
                buildActionButton('\$10'),
                buildActionButton('\$20'),
                buildActionButton('More or less'),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildActionButton(String text) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        Global.to(DonateThanksPage());
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 5),
            child: ActionButton(
              width: 250,
              contentPadding: EdgeInsets.all(8),
              backgroundColor: Colors.white,
              borderColor: Color(0xffFFBD59),
              action: () {
                Navigator.pop(context);
                Global.to(DonateThanksPage());
              },
              child: Text(
                text,
                style: TextStyle(color: Color(0xff196799), fontSize: 20),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 20,
            child: Image.asset(
              'assets/images/image125.png',
              width: 70,
            ),
          )
        ],
      ),
    );
  }
}
