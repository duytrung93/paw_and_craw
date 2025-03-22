import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/objects/data_animal.dart';

part 'my_pets.g.dart';

@JsonSerializable()
class MyPets {
  String? animalId;
  String? userId;
  String? name;
  int? age;
  String? stage;
  dynamic accessories;
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
      this.id,
      this.creationTime,
      this.concurrencyStamp});

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

  String getPetAvatar() {
    var data = getCurrentLevel;

    if (data != null) {
      var type = 0;
      int x = age! % 10;
      print(x);
      if (x == 0 && age! > 0) {
        type = 3;
      } else if (x < 3) {
        type = 0;
      } else if (x < 6) {
        type = 1;
      } else if (x < 9) {
        type = 2;
      } else {
        type = 3;
      }

      return 'assets/images/pet_${animalId}_${data.level}_$type.png';
    } else {
      return 'assets/images/image71.png';
    }
  }
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
    });
  }
}
