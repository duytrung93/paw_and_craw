import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_craw/api/api.dart';
import 'package:paw_and_craw/components/coins_controls.dart';
import 'package:paw_and_craw/components/fixed_image.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/objects/pets/my_pets.dart';
import 'package:paw_and_craw/objects/pets/pet_accessory.dart';
import 'package:paw_and_craw/objects/user.dart';

class ShopConfigPage extends StatefulWidget {
  const ShopConfigPage({super.key});

  @override
  State<ShopConfigPage> createState() => _ShopConfigPageState();
}

class _ShopConfigPageState extends State<ShopConfigPage> {
  Rx<User> get user => Get.find<UserController>().data;
  Rx<MyPets> get pet => Get.find<MyPetsController>().data;
  Rx<List<PetAccessory>> selected = Rx<List<PetAccessory>>([]);
  Rx<int?> selectedItem = Rx<int?>(null);
  Rx<PetAccessory> selectedCog = Rx<PetAccessory>(PetAccessory(width: 100));

  Rx<String> selectedAnimal = Rx<String>(Global.animals[0].id);
  Rx<int> selectedAnimalStage = Rx<int>(1);
  Rx<int> selectedAnimalStagePhase = Rx<int>(0);

  List<String> access = [
    'glass_1.png',
    'glass_2.png',
    'hairclip_1.png',
    'hairclip_2.png',
    'hairclip_3.png',
    'hairclip_4.png',
    'hairclip_5.png',
    'hairclip_6.png',
    'hairclip_7.png',
    'neck_1.png',
    'neck_2.png',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPet();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Image.asset('assets/v2_images/shop_bg.png'),
          ),
          FixedImage(
            top: 14,
            left: 623,
            child: CoinsControls(),
          ),
          FixedImage(
            top: 65,
            left: 488,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 304,
                height: 404,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withAlpha(100),
                ),
                child: SingleChildScrollView(
                  child: Wrap(
                    children: List.generate(
                      48,
                      (index) => SizedBox(
                        width: 50,
                        height: 50,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white),
                          ),
                          child: index < access.length
                              ? Obx(
                                  () => GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      selectIndex(index);
                                    },
                                    child: Opacity(
                                      opacity:
                                          selectedItem.value == index ? 0.5 : 1,
                                      child: Image.asset(
                                        'assets/v2_images/${access[index]}',
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          FixedImage(
            top: 65,
            left: 270,
            // dragable: true,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withAlpha(100),
              ),
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Setting',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Obx(() => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownButton(
                          isDense: true,
                          isExpanded: true,
                          value: selectedAnimal.value,
                          style: TextStyle(color: Colors.white),
                          dropdownColor: Colors.grey,
                          padding: EdgeInsets.zero,
                          items: Global.animals
                              .map((e) => DropdownMenuItem(
                                    value: e.id,
                                    child: Text(
                                      e.name,
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            selectedAnimal.value = '$value';
                            loadPet();
                          },
                        ),
                      )),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(() => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: DropdownButton(
                                isDense: true,
                                isExpanded: true,
                                value: selectedAnimalStage.value,
                                style: TextStyle(color: Colors.white),
                                dropdownColor: Colors.grey,
                                padding: EdgeInsets.zero,
                                items: [
                                  DropdownMenuItem(
                                      value: 1, child: Text('Newborn')),
                                  DropdownMenuItem(
                                      value: 2, child: Text('Teenager')),
                                  DropdownMenuItem(
                                      value: 3, child: Text('Adult')),
                                ],
                                onChanged: (value) {
                                  selectedAnimalStage.value = value!;
                                  loadPet();
                                },
                              ),
                            )),
                      ),
                      Expanded(
                        child: Obx(() => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: DropdownButton(
                                isDense: true,
                                isExpanded: true,
                                value: selectedAnimalStagePhase.value,
                                style: TextStyle(color: Colors.white),
                                dropdownColor: Colors.grey,
                                padding: EdgeInsets.zero,
                                items: [
                                  DropdownMenuItem(
                                      value: 0, child: Text('0-2')),
                                  DropdownMenuItem(
                                      value: 1, child: Text('3-5')),
                                  DropdownMenuItem(
                                      value: 2, child: Text('6-8')),
                                  DropdownMenuItem(value: 3, child: Text('9')),
                                ],
                                onChanged: (value) {
                                  selectedAnimalStagePhase.value = value!;
                                  loadPet();
                                },
                              ),
                            )),
                      )
                    ],
                  ),
                  Obx(() => Slider(
                        value: width.value,
                        onChanged: (value) {
                          width.value = value;
                          selectedCog.update((val) {
                            val?.width = value;
                          });
                        },
                        min: 20,
                        max: 200,
                      )),
                  Obx(() => Slider(
                        value: selectedCog.value.rotate ?? 0,
                        onChanged: (value) {
                          selectedCog.update((val) {
                            val?.rotate = value;
                          });
                        },
                        min: 0,
                        max: 200,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            saveAccessory();
                          },
                          child: Icon(
                            Icons.save,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
          FixedImage(
            top: 10,
            left: 750,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                'assets/images/image87.png',
                width: 40,
              ),
            ),
          ),
          FixedImage(
            top: 241,
            left: 10,
            child: Obx(
              () => Stack(
                children: buildPet(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildPet() {
    List<Widget> items = [];

    items.add(Image.asset(
      selectedCog.value.url,
      width: 250,
    ));
    if (selectedItem.value != null) {
      items.add(FixedImage(
        key: Key(selectedCog.value.accessory_id ?? 'xx'),
        top: selectedCog.value.y ?? 0,
        left: selectedCog.value.x ?? 0,
        dragable: true,
        onDrag: (x, y) {
          selectedCog.update((val) {
            val?.x = x;
            val?.y = y;
          });
        },
        child: Obx(
          () => Transform.rotate(
            angle: pi * selectedCog.value.rotate! / 100,
            child: Image.asset(
              selectedCog.value.accessoryUrl,
              width: selectedCog.value.width,
            ),
          ),
        ),
      ));
    }
    // items.addAll(selected.value
    //     .map(
    //       (dnuta) => FixedImage(
    //         key: Key(data.name ?? ''),
    //         top: 0,
    //         left: 0,
    //         dragable: true,
    //         child: Image.asset(
    //           'assets/v2_images/${data.name}',
    //           width: data.width,
    //         ),
    //       ),
    //     )
    //     .toList());

    return items;
  }

  Rx<double> width = Rx<double>(100);

  void selectIndex(int index) {
    selectedItem.value = index;
    loadPet();
    // var find = selected.value.firstWhereOrNull(test)
  }

  void loadPet() {
    selectedCog.update((val) {
      val?.animal_id = selectedAnimal.value;
      val?.animal_stage = selectedAnimalStage.value;
      val?.animal_stage_grow = selectedAnimalStagePhase.value;
      if (selectedItem.value != null) {
        val?.accessory_id = access[selectedItem.value!];
      }

      var find = Global.animals
          .firstWhereOrNull((e) => e.id == val?.animal_id)
          ?.accessories
          .firstWhereOrNull((e) =>
              e.accessory_id == val?.accessory_id &&
              e.animal_id == val?.animal_id &&
              e.animal_stage == val?.animal_stage &&
              e.animal_stage_grow == val?.animal_stage_grow);
      val?.width = find?.width ?? width.value;
      val?.x = find?.x ?? 0;
      val?.y = find?.y ?? 0;
      val?.rotate = find?.rotate ?? 0;
      width.value = val?.width ?? 100;
    });
  }

  void saveAccessory() {
    if (selectedCog.value.accessory_id == null) {
      Global.showMessage('Please pick a accessory', messageColor: Colors.red);
      return;
    }
    // print(selectedCog.value.toJson());
    API.animals.accessory(value: selectedCog.value).then(
      (value) {
        pet.update((val) {
          Global.animals
              .firstWhereOrNull((e) => e.id == selectedCog.value.animal_id)
              ?.accessories = value;
        });
      },
    );
  }
}
