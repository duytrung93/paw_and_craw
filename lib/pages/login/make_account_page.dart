import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif/gif.dart';
import 'package:paw_and_craw/components/form/action_button.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/objects/user.dart';
import 'package:paw_and_craw/pages/login/choose_animal_page.dart';

class MakeAccountPage extends StatefulWidget {
  const MakeAccountPage({super.key});

  @override
  State<MakeAccountPage> createState() => _MakeAccountPageState();
}

class _MakeAccountPageState extends State<MakeAccountPage> {
  TextEditingController txtName = TextEditingController(text: '');

  late UserController userController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userController = UserController(User());
    Get.put(userController);
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
          //Bắn tim
          Positioned(
            top: 10,
            left: 20,
            child: Gif(
              image: AssetImage('assets/images/image30.gif'),
              width: 100,
              autostart: Autostart.loop,
              duration: Duration(seconds: 6),
            ),
          ),
          //Cầu vồng
          Positioned(
            top: 130,
            left: 80,
            child: Image.asset(
              'assets/images/image34.png',
              width: 80,
            ),
          ),
          //Deco chim
          Positioned(
            bottom: -30,
            left: -40,
            child: Image.asset('assets/images/Picture1.png', width: 230),
          ),
          //Chim
          Positioned(
            bottom: 0,
            left: 5,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(pi),
              child: Image.asset(
                'assets/images/image24.gif',
                width: 100,
              ),
            ),
          ),
          //Bong bóng
          Positioned(
            bottom: 135,
            left: 40,
            child: Image.asset('assets/images/image29.png', width: 70),
          ),

          //Sao
          Positioned(
            bottom: 10,
            left: 180,
            child: Image.asset(
              'assets/images/image35.gif',
              width: 80,
            ),
          ),

          //Mây hồng
          Positioned(
            top: -40,
            right: -48,
            child: Image.asset('assets/images/image25.png', height: 220),
          ),

          //Trang trí mây
          Positioned(
            top: 30,
            right: 20,
            child: Image.asset('assets/images/image27.png', width: 130),
          ),

          //Hoa
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('assets/images/image19.png', width: 300),
          ),
          //Con sóc
          Positioned(
            bottom: 0,
            right: 280,
            child: Image.asset('assets/images/image21.png', width: 60),
          ),
          //Kính con sóc
          Positioned(
            bottom: 38,
            right: 300,
            child: Image.asset('assets/images/image33.png', width: 35),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'PLAY WITHOUT ACCOUNT!',
                  style: TextStyle(
                      fontFamily: 'Bungee',
                      color: Color(0xffffbd59),
                      fontSize: 38,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 40),
                Text(
                  'Choose your name'.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'lazy_dog',
                    color: Color(0xfff4ca44),
                    fontSize: 45,
                    // fontStyle: FontStyle.italic
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 10),
                      child: Image.asset(
                        'assets/images/image31.png',
                        width: 300,
                      ),
                    ),
                    Positioned(
                      right: 25,
                      top: 10,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    Positioned(
                      width: 250,
                      top: 75,
                      left: 50,
                      child: GestureDetector(
                        onTap: () {
                          showInput(context);
                        },
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: txtName,
                                maxLength: 10,
                                textAlign: TextAlign.center,
                                enabled: false,
                                style: TextStyle(
                                  fontFamily: 'Shantell Sans',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                // autovalidateMode: AutovalidateMode.always,
                                validator: (value) {
                                  if (txtName.text.isEmpty) {
                                    return "Please input your name";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Input your name',
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    errorStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .error, // or any other color
                                    ),
                                    counterStyle:
                                        TextStyle(color: Colors.grey)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 5,
                        left: 0,
                        child: Transform.rotate(
                            angle: pi * 1.91,
                            child: Image.asset(
                              'assets/images/image36.gif',
                              width: 80,
                            )))
                  ],
                ),
                ActionButton(
                  action: () {
                    if (_formKey.currentState!.validate()) {
                      Global.to(ChooseAnimalPage());
                    }
                  },
                  child: Text(
                    "Okay!",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Francois One',
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void showInput(BuildContext context) {
    Global.showInput(context,
            initialValue: txtName.text,
            maxLength: 10,
            hintText: 'Input your name')
        .then(
      (value) {
        txtName.text = value;
        _formKey.currentState!.validate();
        userController.data.update(
          (val) {
            val?.name = txtName.text;
          },
        );
      },
    );
  }
}
