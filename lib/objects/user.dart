import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/objects/data_animal.dart';

part 'user.g.dart';

enum UserType { newAccount, loginAccount, playWithoutAccount }

@JsonSerializable()
class User {
  ///Tên người chơi
  String? name;

  ///Giới tính người chơi
  num? gender;

  ///Loại tài khoản
  UserType? userType;

  ///Id Pet
  num? pet_id;

  ///Tên pet
  String? petName;

  ///Số câu trả lời đúng
  int point;

  User({
    this.name,
    this.gender,
    this.pet_id,
    this.petName,
    this.userType,
    this.point = 0,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  DataAnimal get dataAnimal {
    var data = dataAnimals.firstWhereOrNull(
        (element) => element.id == Global.loginResult?.pet_id);
    return data ?? DataAnimal();
  }

  LevelsBean? get getCurrentLevel =>
      dataAnimal.levels.firstWhereOrNull((element) {
        if (point < 11) return element.level == 1;
        if (point < 21) return element.level == 2;
        return element.level == 3;
      });
  String getPetAvatar() {
    var data = getCurrentLevel;

    if (data != null) {
      var type = 0;
      int x = point % 10;
      print(x);
      if (x == 0 && point > 0) {
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

      return 'assets/images/pet_${pet_id}_${data.level}_$type.jpg';
    } else {
      return 'assets/images/image71.png';
    }
  }
}

class UserController extends GetxController {
  Rx<User> data = User().obs;

  UserController(User idata) {
    updateDisplay(idata);
  }

  void updateDisplay(User newData) {
    data.update(
      (val) {
        val?.name = newData.name;
        val?.gender = newData.gender;
        val?.pet_id = newData.pet_id;
        val?.petName = newData.petName;
        val?.userType = newData.userType;
        val?.point = newData.point;
      },
    );
  }

  String? validateName() {
    if (data.value.name?.isEmpty == true) {
      return 'Please input your name!';
    }
    return null;
  }
}
