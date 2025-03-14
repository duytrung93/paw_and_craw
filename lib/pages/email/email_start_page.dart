import 'dart:math';

import 'package:flutter/material.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EmailStartPage extends StatefulWidget {
  const EmailStartPage({super.key});

  @override
  State<EmailStartPage> createState() => _EmailStartPageState();
}

class _EmailStartPageState extends State<EmailStartPage> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      backgroundColor: Color(0xffFEFBEC),
      child: Stack(
        fit: StackFit.expand,
        children: [
          //Vũng nước
          Positioned(
            bottom: -15,
            left: -50,
            child: Image.asset(
              'assets/images/Picture13.png',
              width: 255,
            ),
          ),
          //Mũi tên
          Positioned(
            bottom: 100,
            right: 50,
            child: GestureDetector(
              onTap: () async {
                var url = 'mailto:';
                await launchUrlString(url);
              },
              child: Image.asset(
                'assets/images/image113.png',
                width: 100,
              ),
            ),
          ),
          
          //Vết bớt
          Positioned(
            top: 0,
            right: -40,
            child: Image.asset(
              'assets/images/image1.png',
              width: 200,
            ),
          ),

          //Thoát
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/images/image87.png',
                width: 30,
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 30),
                Text(
                  'OPEN',
                  style: TextStyle(
                    color: Color(0xffF4CA44),
                    fontFamily: 'lazy_dog',
                    fontSize: 70,
                  ),
                ),
                Text(
                  'OUTLOOK?',
                  style: TextStyle(
                    color: Color(0xff59B379),
                    fontFamily: 'lazy_dog',
                    fontSize: 70,
                  ),
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        var url = 'mailto:';
                        await launchUrlString(url);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 30)
                                .copyWith(top: 20),
                        width: 400,
                        height: 200,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Image.asset(
                                'assets/images/image109.png',
                                width: 320,
                              ),
                            ),
                            Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Go to outlook',
                                    style: TextStyle(
                                        fontFamily: 'Dynapuff',
                                        decoration: TextDecoration.underline,
                                        fontSize: 30),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -20,
                      left: 15,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationZ(pi / 4),
                        child: Image.asset(
                          'assets/images/image112.png',
                          width: 60,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 0,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationZ(pi / 8),
                        child: Image.asset(
                          'assets/images/image111.png',
                          width: 90,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
