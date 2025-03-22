import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif/gif.dart';
import 'package:paw_and_craw/components/fixed_image.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/objects/pet_add.dart';
import 'package:paw_and_craw/objects/user.dart';
import 'package:paw_and_craw/pages/login/choose_animal_name_page.dart';

class ChooseAnimalPage extends StatefulWidget {
  const ChooseAnimalPage({super.key});

  @override
  State<ChooseAnimalPage> createState() => _ChooseAnimalPageState();
}

class _ChooseAnimalPageState extends State<ChooseAnimalPage> {
  late PetAddController petAddController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    petAddController = PetAddController(PetAdd());
    Get.put(petAddController);
  }

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
              fit: BoxFit.fill,
              child: Transform.rotate(
                angle: pi * 2,
                child: Image.asset(
                  'assets/v2_images/choose_animal_bg.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          FixedImage(
            top: 24,
            left: 216,
            child: Image.asset(
              'assets/v2_images/choose_animal_sao.png',
              width: 450,
            ),
          ),

          FixedImage(
            top: 28,
            left: 225,
            child: Text(
              'Choose your\nanimals',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Nickainley',
                  color: Color(0xffff7828),
                  fontSize: 80,
                  height: 1,
                  // fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                        color: Color(0xffff3873),
                        offset: Offset(0.5, 2.5),
                        blurRadius: 4)
                  ]),
            ),
          ),
          FixedImage(
            top: 120,
            left: 204,
            child: Image.asset(
              'assets/v2_images/choose_animal_tim.png',
              width: 80,
            ),
          ),
          FixedImage(
            top: 117,
            left: 499,
            child: Image.asset(
              'assets/v2_images/choose_animal_tim.png',
              width: 80,
            ),
          ),

          FixedImage(
            top: 130,
            left: 4,
            child: GestureDetector(
              onTap: () {
                pickAnimal('panda');
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/v2_images/choose_animal_pika_panda.png',
                    width: 215,
                  ),
                  Text(
                    'Panda',
                    style: TextStyle(fontFamily: 'MoreSugar', fontSize: 28),
                  )
                ],
              ),
            ),
          ),

          FixedImage(
            top: 245,
            left: 223,
            child: GestureDetector(
              onTap: () {
                pickAnimal('rabbitpika');
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/v2_images/choose_animal_pika_rabbit.png',
                    width: 130,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Pika rabbit',
                    style: TextStyle(fontFamily: 'MoreSugar', fontSize: 28),
                  )
                ],
              ),
            ),
          ),

          FixedImage(
            top: 181,
            left: 403,
            child: GestureDetector(
              onTap: () {
                pickAnimal('rhino');
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/v2_images/choose_animal_rino.png',
                    width: 200,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Rhino',
                    style: TextStyle(fontFamily: 'MoreSugar', fontSize: 28),
                  )
                ],
              ),
            ),
          ),

          FixedImage(
            top: 239,
            left: 569,
            child: GestureDetector(
              onTap: () {
                pickAnimal('saola');
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/v2_images/choose_animal_saola.png',
                    width: 200,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Saola',
                    style: TextStyle(fontFamily: 'MoreSugar', fontSize: 28),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void pickAnimal(String i) {
    petAddController.data.update((val) {
      val?.animalId = i;
    });
    Global.to(ChooseAnimalNamePage());
  }
}
