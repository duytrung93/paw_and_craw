import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_craw/components/fixed_image.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/objects/pets/my_pets.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  Rx<MyPets> get pet => Get.find<MyPetsController>().data;

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
            top: 18,
            left: 221,
            child: Text(
              'Infomation',
              style: TextStyle(
                fontFamily: 'KumarOneOutline',
                color: Color(0xff874000),
                fontSize: 53,
                shadows: [
                  Shadow(
                      color: Color(0xff874000),
                      offset: Offset(0, 0),
                      blurRadius: 1)
                ],
              ),
            ),
          ),
          FixedImage(
            top: -21,
            left: 16,
            child: Stack(
              children: [
                Image.asset(
                  'assets/v2_images/information_broad.png',
                  width: 770,
                ),
                FixedImage(
                  top: 161,
                  left: 264,
                  child: Obx(
                    () => BorderedText(
                      strokeWidth: 5,
                      strokeColor: Color(0xffffe865),
                      child: Text(
                        pet.value.dataAnimal.name,
                        style: TextStyle(
                          fontFamily: 'Noot',
                          fontSize: 80,
                          color: Color(0xffdd00ae),
                        ),
                      ),
                    ),
                  ),
                ),
                FixedImage(
                  top: 266,
                  left: 50,
                  child: Container(
                    width: 650,
                    height: 200,
                    // color: Colors.red,
                    child: SingleChildScrollView(
                      child: Obx(() => Text(
                            pet.value.dataAnimal.info,
                            style: TextStyle(
                              // fontFamily: 'Noot',
                              fontSize: 23,
                              height: 1.3,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
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

class BorderedText extends StatelessWidget {
  const BorderedText({
    super.key,
    required this.child,
    this.strokeCap = StrokeCap.round,
    this.strokeJoin = StrokeJoin.round,
    this.strokeWidth = 6.0,
    this.strokeColor = const Color.fromRGBO(53, 0, 71, 1),
    this.textAlignment = Alignment.center,
  });

  /// the stroke cap style
  final StrokeCap strokeCap;

  /// the stroke joint style
  final StrokeJoin strokeJoin;

  /// the stroke width
  final double strokeWidth;

  /// the stroke color
  final Color strokeColor;

  /// the [Text] widget to apply stroke on
  final Text child;

  /// the alignment of the text
  final Alignment textAlignment;

  @override
  Widget build(BuildContext context) {
    TextStyle style;
    if (child.style != null) {
      style = child.style!.copyWith(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = strokeCap
          ..strokeJoin = strokeJoin
          ..strokeWidth = strokeWidth
          ..color = strokeColor,
        color: null,
      );
    } else {
      style = TextStyle(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = strokeCap
          ..strokeJoin = strokeJoin
          ..strokeWidth = strokeWidth
          ..color = strokeColor,
      );
    }
    return Stack(
      alignment: textAlignment,
      textDirection: child.textDirection,
      children: <Widget>[
        Text(
          child.data!,
          style: style,
          maxLines: child.maxLines,
          overflow: child.overflow,
          semanticsLabel: child.semanticsLabel,
          softWrap: child.softWrap,
          strutStyle: child.strutStyle,
          textAlign: child.textAlign,
          textDirection: child.textDirection,
        ),
        child,
      ],
    );
  }
}
