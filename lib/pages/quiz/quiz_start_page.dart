import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/pages/quiz/quiz_page.dart';

class QuizStartPage extends StatefulWidget {
  const QuizStartPage({super.key});

  @override
  State<QuizStartPage> createState() => _QuizStartPageState();
}

class _QuizStartPageState extends State<QuizStartPage> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      backgroundColor: Color(0xffFEFBEC),
      child: Stack(
        fit: StackFit.expand,
        children: [
          //Top right
          Positioned(
            right: -105,
            top: -20,
            child: Image.asset(
              'assets/images/image25.png',
              width: 350,
            ),
          ),
          //Bottom left
          Positioned(
            left: -80,
            bottom: -44,
            child: Image.asset(
              'assets/images/image22.png',
              width: 350,
            ),
          ),
          //Start button
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 60),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    Global.to(QuizPage());
                  },
                  child: Image.asset(
                    'assets/images/image99.png',
                    width: 350,
                  ),
                ),
              ],
            ),
          ),
          //Text
          Positioned(
            top: 20,
            left: 80,
            child: Text(
              'Start the quiz',
              style: TextStyle(
                  fontFamily: 'DynaPuff',
                  fontWeight: FontWeight.bold,
                  color: Color(0xff91C4F6),
                  fontSize: 90),
            ),
          ),
        ],
      ),
    );
  }
}
