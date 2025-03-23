import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/objects/data_animal.dart';

part 'user.g.dart';

enum UserType { newAccount, loginAccount, playWithoutAccount }

@JsonSerializable()
class User {
  ///Tên người chơi
  String? id;
  String? fullName;
  String? token;
  int? coin;

  User({
    this.id,
    this.fullName,
    this.token,
    this.coin,
  });

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
        val?.id = newData.id;
        val?.fullName = newData.fullName;
        val?.token = newData.token;
        val?.coin = newData.coin;
      },
    );
  }

  String? validateName() {
    if (data.value.fullName?.isEmpty == true) {
      return 'Please input your name!';
    }
    return null;
  }
}
