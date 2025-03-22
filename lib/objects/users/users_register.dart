import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_register.g.dart';

@JsonSerializable()
class UsersRegister {
  String? username;
  String? password;
  String? fullName;
  String? rePassword;

  UsersRegister({
    this.username,
    this.password,
    this.fullName,
    this.rePassword,
  });

  factory UsersRegister.fromJson(Map<String, dynamic> json) =>
      _$UsersRegisterFromJson(json);

  Map<String, dynamic> toJson() => _$UsersRegisterToJson(this);

  String? getValidate() {
    var checkRequired = username?.isNotEmpty == true &&
        password?.isNotEmpty == true &&
        fullName?.isNotEmpty == true &&
        rePassword?.isNotEmpty == true;
    if (!checkRequired) return 'Please input all required fields';

    if (password != rePassword)
      return 'Password and confirm password do not match';

    return null;
  }
}

class UsersRegisterController extends GetxController {
  Rx<UsersRegister> data = UsersRegister().obs;
  UsersRegisterController(UsersRegister value) {
    updateDisplay(value);
  }

  void updateDisplay(UsersRegister value) {
    data.update((val) {
      val?.username = value.username;
      val?.password = value.password;
      val?.fullName = value.fullName;
      val?.rePassword = value.rePassword;
    });
  }
}
