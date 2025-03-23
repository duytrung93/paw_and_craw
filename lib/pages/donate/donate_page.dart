import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:paw_and_craw/components/fixed_image.dart';
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
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/v2_images/choose_animal_bg.png',
              fit: BoxFit.fill,
            ),
          ),

          Center(
            child: Column(
              children: [
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Image.asset(
                    'assets/v2_images/donate_icon.png',
                    width: 200,
                  ),
                ),
                Expanded(child: Container()),
                buildActionButton('Donate for Critically Endangered Gibbon'),
                Expanded(child: Container()),
                buildActionButton(
                    'Dontate for safeguarding Vietnam’s Biodiversity'),
                Expanded(child: Container()),
                Expanded(child: Container()),
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

  Widget buildActionButton(String text) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        Global.to(DonateThanksPage());
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(30)),
        child: GestureDetector(
          // width: 250,
          // contentPadding: EdgeInsets.all(8),
          // backgroundColor: Colors.white,
          // borderColor: Color(0xffFFBD59),

          onTap: () {
            Navigator.pop(context);
            Global.to(DonateThanksPage());
          },
          child: Opacity(
            opacity: 0.3,
            child: Text(
              text,
              style: TextStyle(
                color: Color(0xff196799),
                fontSize: 20,
                fontFamily: 'LobsterTwo',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
