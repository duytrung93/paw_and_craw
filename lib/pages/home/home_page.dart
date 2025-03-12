import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/functions/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      backgroundColor: Color(0xfffefbeb),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 68,
            color: Color(0xfff4e69e),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                spacing: 10,
                children: [
                  Image.asset(
                    'assets/images/image65.png',
                    width: 45,
                  ),
                  Text(
                    '${Global.loginResult?.name}',
                    style: TextStyle(
                        fontFamily: 'Shantell Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Expanded(child: Container()),
                  Text(
                    'Make account',
                    style: TextStyle(
                      fontFamily: 'DejaVu Serif',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    'assets/images/image69.png',
                    width: 45,
                  ),
                  GestureDetector(
                    onTap: () {
                      Global.logout();
                    },
                    child: Image.asset(
                      'assets/images/image67.png',
                      width: 45,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                //Box Your Pet
                Positioned(
                  top: 16,
                  left: 20,
                  child: Container(
                    width: 160,
                    height: 155,
                    decoration: BoxDecoration(
                      color: Color(0xffe8d298),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  top: 20 + 155,
                  left: 33,
                  child: buildText('Meet your pet', size: 18),
                ),
                //Box Your Pet Image
                Positioned(
                  top: 5,
                  left: 35,
                  child: Image.asset(
                    'assets/images/image71.png',
                    width: 130,
                  ),
                ),
                //Box Change skin
                Positioned(
                  bottom: 10,
                  left: 20,
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Color(0xfff2ca6d),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: buildText('Change skin',
                          decoration: TextDecoration.none, size: 20),
                    ),
                  ),
                ),
                //Hi User
                Positioned(
                  top: 15,
                  left: 190,
                  child: Text(
                    'Hi ${Global.loginResult?.name}😊!',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //Box make quiz
                Positioned(
                  top: 130,
                  left: 205,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xfff2ca6d),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                //Box make quiz image
                Positioned(
                  top: 91,
                  left: 215,
                  child: Image.asset(
                    'assets/images/image78.png',
                    width: 80,
                  ),
                ),
                Positioned(
                  top: 235,
                  left: 215,
                  child: buildText('Make\nquiz', size: 30),
                ),

                //Box quiz
                Positioned(
                  top: 110,
                  left: 325,
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Color(0xfff2ca6d),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/image72.png',
                        width: 110,
                        height: 110,
                        // fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 255,
                  left: 355,
                  child: buildText('Quiz', size: 40),
                ),

                //Box follow
                Positioned(
                  top: 30,
                  right: 160,
                  child: Container(
                    width: 115,
                    height: 115,
                    decoration: BoxDecoration(
                      color: Color(0xfff2ca6d),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/image74.png',
                        width: 80,
                        height: 80,
                        // fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  right: 160,
                  child: buildText('Follow the\nanimals', size: 22),
                ),
                //Củ khoai tây
                Positioned(
                  bottom: -5,
                  right: 175,
                  child: Gif(
                    image: AssetImage('assets/images/image81.gif'),
                    width: 100,
                    duration: Duration(seconds: 1),
                    autostart: Autostart.loop,
                  ),
                ),


                //Lấp lánh
                Positioned(
                  top: 20,
                  right: 20,
                  child: Center(
                    child: Image.asset(
                      'assets/images/image79.png',
                      width: 110,
                      // fit: BoxFit.contain,
                    ),
                  ),
                ),

                //Box Email
                Positioned(
                  bottom: 38,
                  right: 30,
                  child: Container(
                    width: 111,
                    height: 101,
                    decoration: BoxDecoration(
                      color: Color(0xfff2ca6d),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/image76.png',
                        width: 80,
                        height: 80,
                        // fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 10,
                  right: 35,
                  child: buildText('Email us!', size: 20),
                ),
              ],
            ),
          ),
          Container(
            height: 58,
            color: Color(0xfff4e69e),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                spacing: 40,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Report',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )),
                  Text('Rating us',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )),
                  Text('Need support?',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildText(
    String text, {
    double size = 16,
    FontWeight? weight,
    TextDecoration? decoration,
  }) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Shantell Sans',
        fontSize: size,
        height: 1.1,
        fontWeight: weight ?? FontWeight.bold,
        decoration: decoration ?? TextDecoration.underline,
        decorationThickness: 0.5
      ),
    );
  }
}
