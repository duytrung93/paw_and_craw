import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_craw/functions/local_storage.dart';
import 'package:paw_and_craw/get_controller/loading_controller.dart';
import 'package:paw_and_craw/objects/data_animal.dart';
import 'package:paw_and_craw/objects/user.dart';

import '../objects/pets/my_pets.dart';

const dataAnimalJson = [
  {
    'id': 0,
    'name': 'Panda',
    'videos': [
      'v_cpPMjE0vU',
      'c30i79-FA3M',
      'KAlY9uybru4',
      'Sp-hkYndu08',
      '2w4IvGArN7M',
      '7Z9IEy8j1eM',
      'bY7PxYI5Ff0',
      'sptHF0wfG1o',
      '4MnQurIR810',
      'dqT-UlYlg1s',
      'D7xWXk5T3-g',
      'trUDtljeBHs',
      'mtTEh-_vzFc',
      'LKT7ckmIMmo',
      'yYp_Shk7XcI',
      'YdP2fFyjBWQ',
      'YXRha4U7gb0',
      'E8qbnEUa1oA',
      'LKT7ckmIMmo',
    ],
    'levels': [
      {
        "level": 1,
        "level_name": "Newborn",
        "questions": [
          {
            "q": "What color is a newborn panda's fur?",
            "as": [
              {"a": "Black and White", "c": false},
              {"a": "Gray", "c": true},
              {"a": "Brown", "c": false}
            ]
          },
          {
            "q": "Why are pandas endangered?",
            "as": [
              {"a": "Because they are too big", "c": false},
              {"a": "Because of habitat loss and low birth rates", "c": true},
              {"a": "Because they are too small", "c": false}
            ]
          },
          {
            "q": "What is the first letter of the word 'panda'?",
            "as": [
              {"a": "P", "c": true},
              {"a": "Q", "c": false},
              {"a": "R", "c": false}
            ]
          },
          {
            "q": "How much does a newborn panda weigh?",
            "as": [
              {"a": "1 kg", "c": false},
              {"a": "100 grams", "c": true},
              {"a": "10 kg", "c": false}
            ]
          },
          {
            "q": "What do pandas mainly eat when they are cubs?",
            "as": [
              {"a": "Fish", "c": false},
              {"a": "Bamboo", "c": true},
              {"a": "Fruits", "c": false}
            ]
          },
          {
            "q": "Why are pandas not extinct yet?",
            "as": [
              {"a": "Because they are very strong", "c": false},
              {"a": "Because of conservation efforts", "c": true},
              {"a": "Because they live in the ocean", "c": false}
            ]
          },
          {
            "q": "What is the last letter of the word 'cubhood'?",
            "as": [
              {"a": "D", "c": true},
              {"a": "O", "c": false},
              {"a": "H", "c": false}
            ]
          },
          {
            "q": "How long do panda cubs stay with their mothers?",
            "as": [
              {"a": "1 year", "c": false},
              {"a": "1.5 to 2 years", "c": true},
              {"a": "5 years", "c": false}
            ]
          },
          {
            "q": "Why are pandas vulnerable to extinction?",
            "as": [
              {"a": "Because they are too fast", "c": false},
              {
                "a": "Because of habitat loss and low reproduction rates",
                "c": true
              },
              {"a": "Because they are too slow", "c": false}
            ]
          },
          {
            "q": "What is the second letter of the word 'panda'?",
            "as": [
              {"a": "A", "c": true},
              {"a": "N", "c": false},
              {"a": "D", "c": false}
            ]
          }
        ]
      },
      {
        "level": 2,
        "level_name": "Teenager",
        "questions": [
          {
            "q": "At what age do panda cubs typically leave their mothers?",
            "as": [
              {"a": "1 year", "c": false},
              {"a": "2.5 years", "c": false},
              {"a": "1.5 to 2 years", "c": true}
            ]
          },
          {
            "q":
                "What is a major challenge for young pandas during the independence stage?",
            "as": [
              {"a": "Finding a mate", "c": false},
              {"a": "Learning to climb trees", "c": false},
              {"a": "Adapting to new habitats", "c": true}
            ]
          },
          {
            "q":
                "How do pandas primarily learn survival skills during independence?",
            "as": [
              {"a": "Through trial and error", "c": true},
              {"a": "By watching other pandas", "c": false},
              {"a": "From their mothers before leaving", "c": false}
            ]
          },
          {
            "q":
                "What is crucial for young pandas to establish during independence?",
            "as": [
              {"a": "A strong social network", "c": false},
              {"a": "A stable food source", "c": true},
              {"a": "A large territory", "c": false}
            ]
          },
          {
            "q": "Why is independence important for young pandas?",
            "as": [
              {"a": "To reduce competition for food", "c": true},
              {"a": "To increase their social status", "c": false},
              {"a": "To prepare for reproduction", "c": false}
            ]
          },
          {
            "q":
                "What do young pandas primarily eat during the independence stage?",
            "as": [
              {"a": "Insects and small animals", "c": false},
              {"a": "Bamboo and other plants", "c": true},
              {"a": "Fruits and berries", "c": false}
            ]
          },
          {
            "q":
                "How do pandas usually mark their territory during independence?",
            "as": [
              {"a": "By vocalizations", "c": false},
              {"a": "By scent marking", "c": true},
              {"a": "By digging holes", "c": false}
            ]
          },
          {
            "q":
                "What is a significant threat to young pandas during the independence stage?",
            "as": [
              {"a": "Habitat fragmentation", "c": true},
              {"a": "Poaching", "c": false},
              {"a": "Climate change", "c": false}
            ]
          },
          {
            "q":
                "At what age do pandas typically reach full independence in terms of feeding?",
            "as": [
              {"a": "1 year", "c": false},
              {"a": "2 years", "c": false},
              {"a": "1.5 years", "c": true}
            ]
          },
          {
            "q":
                "Why is bamboo important for young pandas during independence?",
            "as": [
              {"a": "It provides shelter", "c": false},
              {"a": "It is a source of water", "c": false},
              {"a": "It is their primary food source", "c": true}
            ]
          },
          {
            "q":
                "How do conservation efforts support young pandas during independence?",
            "as": [
              {"a": "By providing artificial food sources", "c": false},
              {"a": "By creating protected habitats", "c": true},
              {"a": "By relocating them to zoos", "c": false}
            ]
          },
          {
            "q":
                "What skill do young pandas need to develop quickly during independence?",
            "as": [
              {"a": "Swimming", "c": false},
              {"a": "Climbing", "c": true},
              {"a": "Running", "c": false}
            ]
          },
          {
            "q":
                "What is a common behavior observed in young pandas during independence?",
            "as": [
              {"a": "Playing with other pandas", "c": false},
              {"a": "Solitary roaming", "c": true},
              {"a": "Forming long-term pairs", "c": false}
            ]
          },
          {
            "q":
                "How do young pandas usually find food during the independence stage?",
            "as": [
              {"a": "By following older pandas", "c": false},
              {"a": "By using scent to locate bamboo", "c": true},
              {"a": "By trial and error", "c": false}
            ]
          },
          {
            "q":
                "What is essential for young pandas to learn during independence to avoid predators?",
            "as": [
              {"a": "How to fight back", "c": false},
              {"a": "How to climb trees quickly", "c": false},
              {"a": "How to recognize danger signs", "c": true}
            ]
          }
        ]
      },
      {
        "level": 3,
        "level_name": "Adult",
        "questions": [
          {
            "q":
                "At what age do female pandas typically reach reproductive maturity?",
            "as": [
              {"a": "3 years", "c": true},
              {"a": "4 years", "c": false},
              {"a": "5 years", "c": false}
            ]
          },
          {
            "q":
                "What is a significant challenge for pandas during the mating season?",
            "as": [
              {"a": "Finding suitable mates", "c": true},
              {"a": "Adapting to changing climates", "c": false},
              {"a": "Avoiding human disturbance", "c": false}
            ]
          },
          {
            "q":
                "How do conservation efforts help protect pandas from extinction?",
            "as": [
              {"a": "By establishing breeding programs", "c": true},
              {"a": "By creating artificial habitats", "c": false},
              {"a": "By relocating them to zoos", "c": false}
            ]
          },
          {
            "q":
                "What is a major factor contributing to the low reproductive rate of pandas?",
            "as": [
              {"a": "Short breeding window", "c": true},
              {"a": "High infant mortality", "c": false},
              {"a": "Both A and B", "c": false}
            ]
          },
          {
            "q":
                "Why are pandas considered an umbrella species in conservation efforts?",
            "as": [
              {"a": "Because they are easy to study", "c": true},
              {"a": "Because protecting them helps other species", "c": false},
              {"a": "Because they are highly social", "c": false}
            ]
          },
          {
            "q": "What is crucial for the survival of newborn pandas?",
            "as": [
              {"a": "Adequate nutrition from their mothers", "c": true},
              {"a": "Protection from predators", "c": false},
              {"a": "A stable climate", "c": false}
            ]
          },
          {
            "q":
                "How do pandas typically communicate during the mating season?",
            "as": [
              {"a": "Through vocalizations", "c": true},
              {"a": "By scent marking", "c": false},
              {"a": "Through body language", "c": false}
            ]
          },
          {
            "q": "What conservation strategy helps increase panda populations?",
            "as": [
              {"a": "Captive breeding programs", "c": false},
              {"a": "Habitat restoration", "c": false},
              {"a": "Both A and B", "c": false}
            ]
          },
          {
            "q": "Why are pandas vulnerable to extinction?",
            "as": [
              {"a": "Due to their small population size", "c": false},
              {"a": "Because of habitat loss and fragmentation", "c": false},
              {"a": "Both A and B", "c": false}
            ]
          },
          {
            "q":
                "What is a common threat to panda habitats that affects their reproduction?",
            "as": [
              {"a": "Urbanization", "c": false},
              {"a": "Agricultural expansion", "c": false},
              {"a": ":D", "c": false}
            ]
          }
        ]
      }
    ]
  }
];

var dataAnimals = dataAnimalJson.map((e) => DataAnimal.fromJson(e)).toList();

class Global {
  static Size get targetPlatform => Size(800, 500);

  static Color get mainBackgroundColor => Colors.black.withAlpha(15);
  static Color get mainColor => Color(0xfffef8d8);
  static User? loginResult;
  static MyPets? myPets;

  static late LoadingController loadingController;

  static List<DataAnimal> animals = [];

  static void init() {
    loadingController = Get.put(LoadingController(), permanent: true);
  }

  static Future logout() {
    return LocalStorage.setUser(null).then(
      (value) {
        return Get.offAllNamed('/');
      },
    );
  }

  static void to(Widget child) {
    Get.to(
      () => PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) {
          if (!didPop) {
            if (Global.loadingController.count <= 0) {
              Get.back();
            }
          }
        },
        child: child,
      ),
      preventDuplicates: false,
      fullscreenDialog: true,
      transition: Transition.fadeIn,
    );
  }

  static Future showMessage(String message,
      {String? title, Color? messageColor, List<Widget>? actions}) {
    return Get.dialog(AlertDialog(
      title: title != null ? Text(title) : null,
      content: Text(
        message,
        style: TextStyle(color: messageColor ?? Colors.black),
      ),
      actions: actions,
    ));
  }

  static void showError(String message) {
    showMessage(message, messageColor: Colors.redAccent);
  }

  static Future<String> showInput(
    BuildContext context, {
    String initialValue = '',
    String? hintText,
    bool obscureText = false,
  }) {
    return Future(
      () async {
        TextEditingController txtName =
            TextEditingController(text: initialValue);
        await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Wrap(
              children: [
                Row(
                  children: [
                    Expanded(child: Container()),
                    Container(
                      width: Global.targetPlatform.width *
                          (MediaQuery.of(context).size.height /
                              Global.targetPlatform.height),
                      color: Colors.white,
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                isDense: true,
                                border: InputBorder.none,
                                hintText: hintText,
                              ),
                              controller: txtName,
                              obscureText: obscureText,
                              // textAlign: TextAlign.center,
                              autofocus: true,
                              style: TextStyle(
                                fontFamily: 'Shantell Sans',
                                fontWeight: FontWeight.bold,
                              ),
                              onEditingComplete: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 15,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                )
              ],
            ),
          ),
        );

        return txtName.text;
      },
    );
  }
}

extension ListNN<T> on List<T?> {
  /// Returns a `RxInt` with [this] `int` as initial value.
  List<T> get asNonNullList =>
      where((element) => element != null).map((e) => e!).toList();
}
