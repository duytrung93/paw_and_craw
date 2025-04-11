import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:paw_and_craw/api/api.dart';
import 'package:paw_and_craw/components/fixed_image.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/objects/data_animal.dart';

part 'my_pets.g.dart';

@JsonSerializable(explicitToJson: true)
class MyPets {
  String? animalId;
  String? userId;
  String? name;
  int? age;
  String? stage;
  List<MyPetsAccessory>? accessories;
  List<MyPetsAccessory>? accessoriesBind;
  String? id;
  String? creationTime;
  String? concurrencyStamp;

  MyPets(
      {this.animalId,
      this.userId,
      this.name,
      this.age,
      this.stage,
      this.accessories,
      this.accessoriesBind,
      this.id,
      this.creationTime,
      this.concurrencyStamp}) {
    accessories ??= [];
    accessoriesBind ??= [];
  }

  factory MyPets.fromJson(Map<String, dynamic> json) => _$MyPetsFromJson(json);

  Map<String, dynamic> toJson() => _$MyPetsToJson(this);

  DataAnimal get dataAnimal {
    var data =
        Global.animals.firstWhereOrNull((element) => element.id == animalId);
    return data ?? DataAnimal();
  }

  LevelsBean? get getCurrentLevel =>
      dataAnimal.questions.firstWhereOrNull((element) {
        return element.level_name.toLowerCase() == stage?.toLowerCase();
      });

  Widget get bindedAccessories {
    var type = 3;
    var level = 3;
    // print(accessoriesBind?.length);
    List<Widget> items = [
      // Image.asset(
      //   'assets/images/pet_${animalId}_${level}_$type.png',
      //   width: 250,
      //   fit: BoxFit.fill,
      // ),
      Image.network(
        api('Images/$animalId/adult_3.png')
            .toString(), // 'assets/images/pet_${animalId}_${level}_$type.png',
        width: 250,
        fit: BoxFit.fill,
      ),
    ];
    List<String> check = [];
    var accessories = accessoriesBind?.map((accessBind) {
          var selectedCog = dataAnimal.accessories.firstWhereOrNull((e) =>
              e.accessory_id == accessBind.accessory_id &&
              e.animal_stage == level &&
              e.animal_stage_grow == type);
          print(selectedCog?.toJson());
          if (selectedCog == null) return Container();
          if (check.contains('${selectedCog.accessory_id}')) {
            return Container();
          } else {
            check.add('${selectedCog.accessory_id}');
          }
          return Positioned(
            key: Key('${selectedCog.url}_${selectedCog.accessory_id}'),
            top: selectedCog.y ?? 0,
            left: selectedCog.x ?? 0,
            child: Transform.rotate(
              angle: pi * selectedCog.rotate! / 100,
              child: Image.asset(
                selectedCog.accessoryUrl,
                width: selectedCog.width,
              ),
            ),
          );
        }).toList() ??
        [];

    items.addAll(accessories);

    return Stack(
      children: items,
    );
  }

  Widget get bindedAccessoriesQuiz {
    // var type = 0;
    // int x = age! % 10;
    // if (age! > 10) {
    //   type = 3;
    // } else if (x == 0 && age! > 0) {
    //   type = 3;
    // } else if (x < 3) {
    //   type = 0;
    // } else if (x < 6) {
    //   type = 1;
    // } else if (x < 9) {
    //   type = 2;
    // } else {
    //   type = 3;
    // }
    // print(accessoriesBind?.length);
    List<Widget> items = [
      // Image.asset(
      //   getPetAvatar(),
      //   width: 250,
      //   fit: BoxFit.fill,
      // ),
      getPetAvatar() != null
          ? Image.network(
              getPetAvatar()!,
              width: 250,
              fit: BoxFit.fill,
            )
          : Image.asset(
              'assets/images/image21.png',
              width: 250,
              fit: BoxFit.fill,
            ),
    ];
    List<String> check = [];
    // var accessories = accessoriesBind?.map((accessBind) {
    //       var selectedCog = dataAnimal.accessories.firstWhereOrNull((e) =>
    //           e.accessory_id == accessBind.accessory_id &&
    //           e.animal_stage == getCurrentLevel?.level &&
    //           e.animal_stage_grow == type);
    //       print(selectedCog?.toJson());
    //       if (selectedCog == null) return Container();
    //       if (check.contains('${selectedCog.accessory_id}')) {
    //         return Container();
    //       } else {
    //         check.add('${selectedCog.accessory_id}');
    //       }
    //       return Positioned(
    //         key: Key('${selectedCog.url}_${selectedCog.accessory_id}'),
    //         top: selectedCog.y ?? 0,
    //         left: selectedCog.x ?? 0,
    //         child: Transform.rotate(
    //           angle: pi * selectedCog.rotate! / 100,
    //           child: Image.asset(
    //             selectedCog.accessoryUrl,
    //             width: selectedCog.width,
    //           ),
    //         ),
    //       );
    //     }).toList() ??
    //     [];
    //
    // items.addAll(accessories);

    return Stack(
      children: items,
    );
  }

  String? getPetAvatar() {
    var data = getCurrentLevel;

    if (data != null) {
      List<String> paths = [];

      var type = '';
      int x = age! % 10;
      if (age! > 10) {
        type = '3';
      } else if (x == 0 && age! > 0) {
        type = '3';
      } else if (x < 3) {
        type = '';
      } else if (x < 6) {
        type = '1';
      } else if (x < 9) {
        type = '2';
      } else {
        type = '3';
      }
      paths.add(data.level_name);
      if (type.isNotEmpty) paths.add(type);
      return api('Images/$animalId/${paths.join('_')}.png').toString();

      // return 'assets/images/pet_${animalId}_${data.level_name}_$type.png';
    }
    return null;
  }
}

@JsonSerializable()
class MyPetsAccessory {
  String? accessory_id;

  MyPetsAccessory({this.accessory_id});

  factory MyPetsAccessory.fromJson(Map<String, dynamic> json) =>
      _$MyPetsAccessoryFromJson(json);

  Map<String, dynamic> toJson() => _$MyPetsAccessoryToJson(this);
}

class MyPetsController extends GetxController {
  Rx<MyPets> data = MyPets().obs;
  MyPetsController(MyPets value) {
    updateDisplay(value);
  }

  void updateDisplay(MyPets value) {
    data.update((val) {
      val?.animalId = value.animalId;
      val?.userId = value.userId;
      val?.name = value.name;
      val?.age = value.age;
      val?.stage = value.stage;
      val?.accessories = value.accessories;
      val?.id = value.id;
      val?.creationTime = value.creationTime;
      val?.concurrencyStamp = value.concurrencyStamp;
      val?.accessoriesBind = value.accessoriesBind;
    });
  }
}
