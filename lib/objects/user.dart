import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? name;
  String? petName;
  num? gender;
  num? pet_id;

  User({this.name, this.gender, this.pet_id, this.petName});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
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
