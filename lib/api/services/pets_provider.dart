import 'package:paw_and_craw/api/api.dart';
import 'package:paw_and_craw/functions/get_data_api.dart';
import 'package:paw_and_craw/objects/pet_add.dart';
import 'package:paw_and_craw/objects/pets/my_pets.dart';
import 'package:paw_and_craw/objects/user.dart';
import 'package:paw_and_craw/objects/users/users_register.dart';

class PetsProvider {
  Future<MyPets?> get() {
    return GetDataAPI(
      method: GetDataAPIMethod.get,
      uri: api('pets'),
      formatter: (json) => MyPets.fromJson(json),
    ).call();
  }

  Future<dynamic> add({required PetAdd info}) {
    return GetDataAPI(
      method: GetDataAPIMethod.post,
      uri: api('pets/add'),
    ).call(params: info.toJson()).then(
      (value) {
        return value ?? User();
      },
    );
  }

  Future<dynamic> updateAgeStage({
    required num age,
    required String stage,
  }) {
    return GetDataAPI(
      method: GetDataAPIMethod.post,
      uri: api('pets/update-age-stage'),
    ).call(params: {"age": age, "stage": stage});
  }
}
