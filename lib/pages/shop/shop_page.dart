import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_craw/components/coins_controls.dart';
import 'package:paw_and_craw/components/fixed_image.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/objects/pets/my_pets.dart';
import 'package:paw_and_craw/objects/pets/pet_accessory.dart';
import 'package:paw_and_craw/objects/user.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  Rx<User> get user => Get.find<UserController>().data;
  Rx<MyPets> get pet => Get.find<MyPetsController>().data;
  Rx<List<PetAccessory>> selected = Rx<List<PetAccessory>>([]);
  Rx<int?> selectedItem = Rx<int?>(null);

  List<PetAccessory> access = [
    PetAccessory(accessory_id: 'glass_1.png', width: 100),
    PetAccessory(accessory_id: 'glass_2.png', width: 100),
    PetAccessory(accessory_id: 'hairclip_1.png', width: 100),
    PetAccessory(accessory_id: 'hairclip_2.png', width: 100),
    PetAccessory(accessory_id: 'hairclip_3.png', width: 100),
    PetAccessory(accessory_id: 'hairclip_4.png', width: 100),
    PetAccessory(accessory_id: 'hairclip_5.png', width: 100),
    PetAccessory(accessory_id: 'hairclip_6.png', width: 100),
    PetAccessory(accessory_id: 'hairclip_7.png', width: 100),
    PetAccessory(accessory_id: 'neck_1.png', width: 100),
    PetAccessory(accessory_id: 'neck_2.png', width: 100),
  ];

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
                                      if (selected.value
                                          .contains(access[index])) {
                                        if (selectedItem.value == index) {
                                          selectedItem.value = null;
                                        }
                                        selected.update((val) {
                                          val?.remove(access[index]);
                                        });
                                      } else {
                                        selectIndex(index);
                                        selected.update((val) {
                                          val?.add(access[index]);
                                        });
                                      }
                                    },
                                    child: Opacity(
                                      opacity:
                                          selected.value.contains(access[index])
                                              ? 0.5
                                              : 1,
                                      child: Image.asset(
                                        'assets/v2_images/${access[index].accessory_id}',
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
              top: 0,
              left: 0,
              child: Container(
                child: Column(
                  children: [
                    Obx(() =>
                        Text('Setting ${width.value} - ${selectedItem.value}')),
                    Obx(() => Slider(
                          value: width.value,
                          onChanged: (value) {
                            width.value = value;
                            if (selectedItem.value != null) {
                              selected.update((val) {
                                var find = val?.firstWhereOrNull((element) =>
                                    element.accessory_id ==
                                    access[selectedItem.value!].accessory_id);
                                if (find != null) {
                                  find.width = value;
                                }
                              });
                            }
                          },
                          min: 20,
                          max: 200,
                        )),
                  ],
                ),
              )),
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
    List<Widget> items = [
      Image.asset(
        pet.value.getPetAvatar(),
        width: 250,
      ),
    ];
    items.addAll(selected.value
        .map(
          (data) => FixedImage(
            key: Key(data.accessory_id ?? ''),
            top: 0,
            left: 0,
            dragable: true,
            child: Image.asset(
              'assets/v2_images/${data.accessory_id}',
              width: data.width,
            ),
          ),
        )
        .toList());

    return items;
  }

  Rx<double> width = Rx<double>(20);

  void selectIndex(int index) {
    selectedItem.value = index;
    width.value = access[index].width ?? 0;
  }
}
