import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_craw/api/api.dart';
import 'package:paw_and_craw/components/coins_controls.dart';
import 'package:paw_and_craw/components/fixed_image.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/functions/local_storage.dart';
import 'package:paw_and_craw/objects/pets/my_pets.dart';
import 'package:paw_and_craw/objects/pets/pet_accessory.dart';
import 'package:paw_and_craw/objects/user.dart';
import 'package:paw_and_craw/pages/shop/shop_config_page.dart';

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
            top: 20,
            left: 582,
            child: Global.loginResult?.id == 'admin'
                ? GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Global.to(ShopConfigPage());
                    },
                    child: Image.asset('assets/v2_images/home_setting.png',
                        width: 30),
                  )
                : Container(),
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
                              ? buildItem(index)
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
          Positioned(
            bottom: 20,
            left: 20,
            child: Container(
              // color: Colors.red,
              child: Transform.scale(
                alignment: Alignment.bottomLeft,
                scale: 1,
                child: Obx(() => pet.value.bindedAccessories),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Obx buildItem(int index) {
    return Obx(
      () => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () async {
          var accessory_id = access[index].accessory_id ?? '';

          ///Nếu chưa mua
          var checkHasPurchased = pet.value.accessories
                  ?.any((p) => p.accessory_id == accessory_id) ==
              true;

          if (!checkHasPurchased) {
            int coins = user.value.coin ?? 0;
            if (coins >= 10) {
              if (Global.loginResult?.token != null) {
                ///Mua đồ
                await API.pets.addAccessory(accessory_id: accessory_id);

                ///Trừ tiền
                await API.users.diffCoin(coin: coins - 10);
              }
              pet.update((val) {
                val?.accessories ??= [];
                val?.accessories
                    ?.add(MyPetsAccessory(accessory_id: accessory_id));
              });
              user.update((val) {
                val?.coin = coins - 10;
              });
              LocalStorage.setUser(user.value);
            } else {
              Global.showMessage('Not enough coins!',
                  messageColor: Colors.redAccent);
            }
          } else {
            var checkHasBind = pet.value.accessoriesBind
                    ?.any((p) => p.accessory_id == accessory_id) ==
                true;
            if (Global.loginResult?.token != null) {
              if (checkHasBind) {
                await API.pets.accessoryUnbind(accessory_id: accessory_id);
              } else {
                await API.pets.accessoryBind(accessory_id: accessory_id);
              }
            }

            pet.update((val) {
              val?.accessoriesBind ??= [];
              if (checkHasBind) {
                val?.accessoriesBind
                    ?.removeWhere((p) => p.accessory_id == accessory_id);
              } else {
                val?.accessoriesBind
                    ?.add(MyPetsAccessory(accessory_id: accessory_id));
              }
            });
          }
          return;
          // if (selected.value.contains(access[index])) {
          //   if (selectedItem.value == index) {
          //     selectedItem.value = null;
          //   }
          //   selected.update((val) {
          //     val?.remove(access[index]);
          //   });
          // } else {
          //   selectIndex(index);
          //   selected.update((val) {
          //     val?.add(access[index]);
          //   });
          // }
        },
        child: Stack(
          children: [
            Center(
              child: Opacity(
                opacity: pet.value.accessoriesBind?.any((p) =>
                            p.accessory_id == access[index].accessory_id) ==
                        true
                    ? 0.5
                    : 1,
                child: Image.asset(
                  'assets/v2_images/${access[index].accessory_id}',
                ),
              ),
            ),
            pet.value.accessories?.any(
                        (p) => p.accessory_id == access[index].accessory_id) ==
                    false
                ? Positioned(
                    bottom: 2,
                    left: 2,
                    child: Container(
                      padding: EdgeInsets.only(right: 2, bottom: 2),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                            // spreadRadius: 2
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/v2_images/home_shop.png',
                        width: 15,
                        color: Colors.white,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Rx<double> width = Rx<double>(20);

  void selectIndex(int index) {
    selectedItem.value = index;
    width.value = access[index].width ?? 0;
  }
}
