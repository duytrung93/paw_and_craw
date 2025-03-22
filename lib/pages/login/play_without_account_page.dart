import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_craw/components/fixed_image.dart';
import 'package:paw_and_craw/components/form/action_button.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/functions/local_storage.dart';
import 'package:paw_and_craw/objects/user.dart';
import 'package:paw_and_craw/pages/login/choose_animal_page.dart';

class PlayWithoutAccountPage extends StatefulWidget {
  const PlayWithoutAccountPage({super.key});

  @override
  State<PlayWithoutAccountPage> createState() => _PlayWithoutAccountPageState();
}

class _PlayWithoutAccountPageState extends State<PlayWithoutAccountPage> {
  TextEditingController txtName = TextEditingController(text: '');

  late UserController userController;
  String error = '';

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
        child: Stack(
      fit: StackFit.expand,
      children: [
        //Nền
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Transform.rotate(
              angle: pi / 2,
              child: Opacity(
                opacity: 0.7,
                child: Image.asset(
                  'assets/v2_images/new_account_bg.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),

        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15),
              Text(
                'Play without\naccount!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Gladiola',
                  height: 0.8,
                  fontSize: 73,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Color(0xffffb81b),
                      blurRadius: 30,
                    )
                  ],
                ),
              ),
              Text(
                'Enter your name...',
                style: TextStyle(
                    fontFamily: 'MoreSugar',
                    color: Color(0xffff7828),
                    fontSize: 45,
                    height: 1
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
                      width: 430,
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
                        width: 40,
                        height: 38,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  Positioned(
                    // width: 250,
                    top: 92,
                    left: 50,
                    right: 50,
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
                                fontSize: 30,
                              ),
                              // autovalidateMode: AutovalidateMode.always,
                              validator: (value) {
                                if (txtName.text.isEmpty) {
                                  return "Please input your name";
                                }
                                if (error.isNotEmpty) return error;
                                return null;
                              },
                              decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'Input your name',
                                  hintStyle: TextStyle(fontSize: 30),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  errorStyle: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .error, // or any other color
                                  ),
                                  counterStyle: TextStyle(color: Colors.grey)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //     top: 5,
                  //     left: 0,
                  //     child: Transform.rotate(
                  //         angle: pi * 1.91,
                  //         child: Image.asset(
                  //           'assets/images/image36.gif',
                  //           width: 80,
                  //         )))
                ],
              ),
              ActionButton(
                contentPadding: EdgeInsets.all(15),
                borderColor: Colors.black,
                width: 400,
                action: () {
                  error = "";
                  if (_formKey.currentState!.validate()) {
                    Global.to(ChooseAnimalPage());
                  }
                },
                child: Text(
                  "Okay!",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'LobsterTwo',
                      fontSize: 30
                      // fontWeight: bold
                      ),
                ),
              ),
            ],
          ),
        ),
        FixedImage(
          top: 220,
          left: -138,
          child: Transform.rotate(
            angle: pi * 1.5,
            child: Image.asset(
              'assets/v2_images/no_account_deco.png',
              width: 380,
            ),
          ),
        ),
        FixedImage(
          top: 220,
          left: 561,
          child: Transform.rotate(
            angle: pi * 0.5,
            child: Image.asset(
              'assets/v2_images/no_account_deco.png',
              width: 380,
            ),
          ),
        ),
        FixedImage(
          top: 465,
          left: 291,
          child: Image.asset(
            'assets/v2_images/no_account_bottom.png',
            width: 220,
          ),
        ),
      ],
    ));
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
            val?.fullName = txtName.text;
          },
        );
      },
    );
  }
}
