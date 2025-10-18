import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_craw/api/api.dart';
import 'package:paw_and_craw/components/coins_controls.dart';
import 'package:paw_and_craw/components/fixed_image.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/functions/local_storage.dart';
import 'package:paw_and_craw/objects/data_animal.dart';
import 'package:paw_and_craw/objects/pets/my_pets.dart';
import 'package:paw_and_craw/objects/user.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Rx<User> get user => Get.find<UserController>().data;
  Rx<MyPets> get pet => Get.find<MyPetsController>().data;
  Rx<QuestionsBean> currentQuestion = QuestionsBean().obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/QuizBg.png',
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          Positioned(
            top: 20,
            left: 180,
            child: Text(
              'Question\n${'${(pet.value.age!) + 1}'.padLeft(2, '0')}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'MoreSugar',
                color: Color(0xffff7828),
                fontSize: 40,
              ),
            ),
          ),
          FixedImage(top: 15, left: 660, child: CoinsControls()),
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            bottom: 40,
            child: Container(
              // color: Colors.red,
              // decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Row(
                children: [
                  Container(
                    // color: Colors.red,
                    width: 220,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Obx(() => Text(
                                pet.value.name ?? '',
                                style: TextStyle(
                                    fontFamily: 'MoreSugar', fontSize: 30),
                              )),
                        ),
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Obx(() => pet.value.bindedAccessoriesQuiz),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Obx(() => Text(
                                pet.value.getCurrentLevel?.level_name ?? '',
                                style: TextStyle(
                                    fontFamily: 'Arturo', fontSize: 20),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 80),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Color(0xffffeeb6),
                                      border:
                                          Border(bottom: BorderSide(width: 1)),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      )),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Icon(
                                            Icons.close,
                                            size: 24,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: buildQuiz(),
                                  ),
                                )
                              ],
                            ),
                            // color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: List.generate(
                              10,
                              (index) => Expanded(
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: pet.value.age! % 10 > index
                                        ? Color(0xffff8888)
                                        : Color(0xffffc7c7),
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildQuiz() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(
              () => Text(
                currentQuestion.value.q,
                style: defaultStyle.copyWith(fontSize: 25),
              ),
            ),
            // Expanded(child: Container()),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: currentQuestion.value.as
                    .map((e) => buildAnswer(e))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  final _random = Random();

  void getCurrentQuestion() {
    var curentLevel = pet.value.getCurrentLevel;
    if (curentLevel != null) {
// generate a random index based on the list length
// and use it to retrieve the element
      var element =
          curentLevel.questions[_random.nextInt(curentLevel.questions.length)];
      if (element.q != currentQuestion.value.q) {
        currentQuestion.update((val) {
          val?.q = element.q;
          element.as.shuffle();
          val?.as = element.as;
        });
      } else {
        getCurrentQuestion();
      }
    }
  }

  bool delay = false;

  Widget buildAnswer(AsBean e) {
    int labelIndex = currentQuestion.value.as.indexOf(e);
    return AnswerQuestion(
      key: Key('${currentQuestion.value.q}-${e.a}'),
      enabled: !delay,
      answer: e,
      index: labelIndex,
      onTap: () async {
        setState(() {
          delay = true;
        });
        if (e.c) {
          var newAge = (pet.value.age ?? 0) + 1;
          var newStage = pet.value.stage ?? 'Newborn';
          if (newAge >= 10) {
            if (pet.value.stage?.toLowerCase() == 'Newborn'.toLowerCase()) {
              newAge = 0;
              newStage = 'Teenager';
            } else if (pet.value.stage?.toLowerCase() ==
                'Teenager'.toLowerCase()) {
              newAge = 0;
              newStage = 'Adult';
            }
          }
          if (user.value.token != null) {
            await Future.wait([
              API.pets.updateAgeStage(
                age: newAge,
                stage: newStage,
                animal_id: '${pet.value.animalId}',
              ),
              API.users.addCoin(coin: 5),
            ]);
          }

          pet.update(
            (val) {
              val?.age = newAge;
              val?.stage = newStage;
              // val?.coins = (val.coins ?? 0) + 5;
            },
          );
          user.update((val) {
            val?.coin = (val.coin ?? 0) + 5;
          });

          LocalStorage.setMyPet(pet.value);
          LocalStorage.setUser(user.value);
        }

        Future.delayed(
            Duration(seconds: e.c && user.value.token != null ? 0 : 1), () {
          setState(() {
            getCurrentQuestion();
            delay = false;
          });
        });
      },
    );
  }
}

final defaultStyle = TextStyle(fontFamily: 'Arturo');

class AnswerQuestion extends StatefulWidget {
  final bool enabled;
  final AsBean answer;
  final int index;
  final Function() onTap;
  const AnswerQuestion(
      {super.key,
      this.enabled = true,
      required this.answer,
      required this.index,
      required this.onTap});

  @override
  State<AnswerQuestion> createState() => _AnswerQuestionState();
}

class _AnswerQuestionState extends State<AnswerQuestion> {
  String label = '';
  Color color = Colors.black;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switch (widget.index) {
      case 0:
        label = 'A';
        break;
      case 1:
        label = 'B';
        break;
      case 2:
        label = 'C';
        break;
      case 3:
        label = 'D';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.enabled
          ? () {
              if (widget.answer.c) {
                setState(() {
                  color = Colors.green;
                });
              } else {
                setState(() {
                  color = Colors.red;
                });
              }
              widget.onTap();
            }
          : null,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                '$label) ${widget.answer.a}',
                style: defaultStyle.copyWith(color: color),
              ),
            ),
          ),
          color != Colors.black
              ? Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      color == Colors.green ? Icons.check : Icons.close,
                      color: color,
                    ),
                    color == Colors.green
                        ? Text(
                            '+5D',
                            style: defaultStyle.copyWith(
                                color: Colors.green, height: 1.5),
                          )
                        : Container(),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
