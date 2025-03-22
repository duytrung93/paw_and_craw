import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pet_add.g.dart';

@JsonSerializable()
class PetAdd {
  String? animalId;
  String? name;

  PetAdd({this.animalId, this.name});

  factory PetAdd.fromJson(Map<String, dynamic> json) => _$PetAddFromJson(json);

  Map<String, dynamic> toJson() => _$PetAddToJson(this);
}

class PetAddController extends GetxController {
  Rx<PetAdd> data = PetAdd().obs;
  PetAddController(PetAdd idata) {
    updateDisplay(idata);
  }

  void updateDisplay(PetAdd newData) {
    data.update(
      (val) {
        val?.animalId = newData.animalId;
        val?.name = newData.name;
      },
    );
  }

  String? validateName() {
    if (data.value.name?.isEmpty == true) {
      return 'Please input your pet name!';
    }
    return null;
  }
}
