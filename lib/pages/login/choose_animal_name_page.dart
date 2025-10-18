import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_craw/api/api.dart';
import 'package:paw_and_craw/components/form/action_button.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/functions/local_storage.dart';
import 'package:paw_and_craw/objects/pet_add.dart';
import 'package:paw_and_craw/objects/pets/my_pets.dart';
import 'package:paw_and_craw/objects/user.dart';
import 'package:paw_and_craw/pages/login/choose_gender_page.dart';

class ChooseAnimalNamePage extends StatefulWidget {
  const ChooseAnimalNamePage({super.key});

  @override
  State<ChooseAnimalNamePage> createState() => _ChooseAnimalNamePageState();
}

class _ChooseAnimalNamePageState extends State<ChooseAnimalNamePage> {
  TextEditingController txtPetName = TextEditingController();
  Rx<User> get user => Get.isRegistered<UserController>()
      ? Get.find<UserController>().data
      : Get.put(UserController(Global.loginResult!)).data;
  // Rx<String> petName = ''.obs;
  Rx<PetAdd> get petAdd => Get.find<PetAddController>().data;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Stack(
        fit: StackFit.expand,
        children: [
          //Góc trái
          Positioned(
            top: 0,
            left: 0,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(pi),
              child: Image.asset(
                'assets/images/image52.png',
                width: 315,
              ),
            ),
          ),
          //Góc phải
          Positioned(
            top: -65,
            right: 0,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(pi),
              child: Image.asset(
                'assets/images/image54.png',
                width: 315,
              ),
            ),
          ),
          //Cành hoa
          Positioned(
            top: -20,
            right: -46,
            child: Image.asset(
              'assets/images/image56.png',
              width: 230,
            ),
          ),

          //Chữ
          Positioned(
            top: 72,
            left: 160,
            child: Text(
              'Choose your pet name'.toUpperCase(),
              style: TextStyle(
                  fontFamily: 'lazy_dog',
                  color: Color(0xfff4ca44),
                  fontSize: 43),
            ),
          ),

          //Góc trái dưới
          Positioned(
            bottom: -20,
            left: -20,
            child: Image.asset(
              'assets/images/image54.png',
              width: 260,
            ),
          ),

          //Ánh sáng
          Positioned(
            bottom: 85,
            left: 30,
            child: Image.asset(
              'assets/images/image58.png',
              width: 100,
            ),
          ),

          //Góc phải dưới
          Positioned(
            bottom: -0,
            right: -20,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationX(pi),
              child: Image.asset(
                'assets/images/image52.png',
                width: 315,
              ),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 60),
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
                            child: TextFormField(
                              controller: txtPetName,
                              maxLength: 10,
                              textAlign: TextAlign.center,
                              // autofocus: true,
                              style: TextStyle(
                                fontFamily: 'Shantell Sans',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              enabled: false,
                              validator: (value) {
                                if (txtPetName.text.isEmpty) {
                                  return "Please input your pet name";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Input your pet name',
                                isDense: true,
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
                                counterStyle: TextStyle(color: Colors.grey),
                              ),
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
                        // Global.to(ChooseGenderPage());
                        // user.update(
                        //   (val) {
                        //     // val?.gender = i;
                        //     if (val?.userType != UserType.playWithoutAccount) {
                        //       val?.userType = UserType.loginAccount;
                        //     }
                        //   },
                        // );
                        ///playWithoutAccount
                        if (user.value.token != null) {
                          API.pets.add(info: petAdd.value).then((value) {
                            LocalStorage.setData(StorageType.ActiveAnimal, '${petAdd.value.animalId}');
                            Get.offAllNamed('/');
                          });
                        } else {
                          Future.wait([
                            LocalStorage.setUser(user.value),
                            LocalStorage.setMyPet(
                              MyPets(
                                animalId: petAdd.value.animalId,
                                age: 0,
                                name: petAdd.value.name,
                                stage: 'Newborn',
                              ),
                            ),
                          ]).then((value) {
                            Get.offAllNamed('/');
                          });
                        }
                      }
                    },
                    child: Text(
                      "Okay!",
                      style: TextStyle(
                          color: Color(0xff0000ff), fontFamily: 'Francois One'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showInput(BuildContext context) {
    Global.showInput(context,
            hintText: 'Input your pet name',
            initialValue: petAdd.value.name ?? '')
        .then(
      (value) {
        txtPetName.text = value;
        _formKey.currentState!.validate();
        petAdd.value.name = txtPetName.text;
      },
    );
  }
}
