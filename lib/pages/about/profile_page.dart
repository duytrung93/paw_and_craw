import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_craw/api/api.dart';
import 'package:paw_and_craw/components/fixed_image.dart';
import 'package:paw_and_craw/components/loading_dialog.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/objects/user.dart';
import 'package:paw_and_craw/pages/login/make_account_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Rx<User> get user => Get.find<UserController>().data;
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
          Positioned(
            left: 30,
            right: 30,
            top: 20,
            bottom: 20,
            child: Image.asset(
              'assets/v2_images/profile_khung.png',
              fit: BoxFit.fill,
            ),
          ),
          FixedImage(
            top: 9,
            left: 170,
            child: Text(
              'Your profile',
              style: TextStyle(
                fontFamily: 'Gladiola',
                fontSize: 100,
                color: Colors.white,
                shadows: [
                  Shadow(color: Color(0xffff7828), blurRadius: 30),
                  Shadow(color: Color(0xffff7828), blurRadius: 30),
                ],
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 60,
            right: 60,
            bottom: 40,
            child: Stack(
              children: [
                Column(
                  // spacing: 25,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => buildInput('Name', '${user.value.fullName}'),
                    ),
                    SizedBox(height: 25),
                    buildInput('Email/Phone', ''),
                    SizedBox(height: 25),
                    buildInput('Password', '...'),
                    SizedBox(height: 5),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 30),
                    //   child: Text(
                    //     'Android  and IOS operating system',
                    //     style: TextStyle(fontFamily: 'Gladiola', fontSize: 30),
                    //   ),
                    // ),
                    SizedBox(height: 50),
                    InkWell(
                      onTap: () {
                        handleDeleteAccount();
                      },
                      child: Text(
                        'Delete account',
                        style: TextStyle(
                          fontFamily: 'Arturo',
                          fontSize: 30,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Color(0xffff3131),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        handleMakeNewAccount();
                      },
                      child: Text(
                        'Make a new account',
                        style: TextStyle(
                          fontFamily: 'Arturo',
                          fontSize: 30,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Color(0xff1d76b7),
                        ),
                      ),
                    ),
                  ],
                ),
                FixedImage(
                  top: -3,
                  left: 501,
                  child: Icon(
                    Icons.edit,
                    size: 50,
                  ),
                ),
                FixedImage(
                  top: 133,
                  left: 501,
                  child: Icon(
                    Icons.edit,
                    size: 50,
                  ),
                ),
                FixedImage(
                  top: 254,
                  left: 491,
                  child: GestureDetector(
                    onTap: () {
                      Global.logout();
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Row(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Log out',
                          style: TextStyle(
                            fontFamily: 'Arturo',
                            fontSize: 30,
                            height: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image.asset('assets/v2_images/logout.png'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          FixedImage(
            top: 52,
            left: 649,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 60,
              icon: Image.asset(
                'assets/images/image87.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildInput(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10)
          .copyWith(bottom: 0),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(30),
      ),
      width: 490,
      child: Row(
        children: [
          Text(
            '$label:',
            style: TextStyle(fontFamily: 'Arturo', fontSize: 30, height: 1),
          ),
          Expanded(
            child: Text(
              ' $value',
              style: TextStyle(
                  fontFamily: 'Arturo',
                  fontSize: 30,
                  height: 1,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }

  void handleDeleteAccount() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Delete Account',
              style: TextStyle(fontFamily: 'Arturo', fontSize: 40),
            ),
            content: Text(
              'Are you sure you want to delete your account? This action cannot be undone.',
              style: TextStyle(fontFamily: 'Arturo', fontSize: 30),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(fontFamily: 'Arturo', fontSize: 30),
                ),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  await API.users.delete();
                  Global.logout(); // Log out the user after deletion
                },
                child: Text(
                  'Delete',
                  style: TextStyle(
                      fontFamily: 'Arturo', fontSize: 30, color: Colors.red),
                ),
              ),
            ],
          );
        });
  }

  Future<void> handleMakeNewAccount() async {
    await Global.logout();
    //Get.back();
    Global.to(MakeAccountPage(
      type: UserType.newAccount,
    ));
  }
}
