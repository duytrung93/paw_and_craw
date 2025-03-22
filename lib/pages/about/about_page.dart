import 'dart:math';

import 'package:flutter/material.dart';
import 'package:paw_and_craw/components/fixed_image.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
            child: Image.asset(
              'assets/v2_images/choose_animal_bg.png',
              fit: BoxFit.fill,
            ),
          ),
          FixedImage(
            top: 142,
            left: 0,
            child: Image.asset(
              'assets/v2_images/about_left_bottom.png',
              width: 280,
            ),
          ),
          FixedImage(
            top: 0,
            left: 695,
            child: Transform.rotate(
              angle: pi * 0.3,
              child: Image.asset(
                'assets/v2_images/about_buom.png',
                width: 70,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90, right: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Acknowledgments',
                    style: TextStyle(
                      fontFamily: 'lazy_dog',
                      color: Color(0xff59b379),
                      fontSize: 57,
                      shadows: [
                        Shadow(
                            color: Colors.black.withAlpha(100),
                            offset: Offset(2, 4),
                            blurRadius: 0)
                      ],
                    ),
                  ),
                ),
                Text(
                  'Team Durians from Class 7I at Ta Quang Buu Secondary and High School proudly presents this app to raise awareness about wildlife protection. Our goal is to inform the world about endangered animals and mobilize support for conservation efforts. We deeply appreciate our parents, teachers, the AI4Life Center, HUST, and friends for their invaluable support. Special thanks to Bach Khoa Innovation Joint Stock Company for their sponsorship and encouragement. A heartfelt thank you to PanNature for their enthusiasm in sharing with our team about Vietnam’s endangered animals and conservation efforts. To support their vital work, visit their donation page, which is also featured in our app."',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    height: 1.43,
                    color: Colors.black,
                    fontFamily: 'Quicksand',
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
}
