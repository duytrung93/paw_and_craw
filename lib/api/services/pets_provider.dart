import 'package:paw_and_craw/api/api.dart';
import 'package:paw_and_craw/functions/get_data_api.dart';
import 'package:paw_and_craw/objects/pet_add.dart';
import 'package:paw_and_craw/objects/pets/my_pets.dart';
import 'package:paw_and_craw/objects/user.dart';
import 'package:paw_and_craw/objects/users/users_register.dart';

class PetsProvider {
  Future<MyPets?> get({required String animal_id}) {
    return GetDataAPI(
      method: GetDataAPIMethod.get,
      uri: api('pets'),
      formatter: (json) => MyPets.fromJson(json),
    ).call(params: {'animal_id': animal_id});
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

  Future<dynamic> updateAgeStage(
      {required num age, required String stage, required String animal_id}) {
    return GetDataAPI(
      method: GetDataAPIMethod.post,
      uri: api('pets/update-age-stage'),
    ).call(params: {"age": age, "stage": stage, 'animal_id': animal_id});
  }

  Future<List<MyPetsAccessory>> addAccessory(
      {required String accessory_id, required String animal_id}) {
    return GetDataAPI(
      method: GetDataAPIMethod.post,
      uri: api('pets/add-accessory'),
      formatter: (json) =>
          (json as List).map((e) => MyPetsAccessory.fromJson(e)).toList(),
    ).call(params: {"accessory_id": accessory_id, 'animal_id': animal_id}).then(
        (value) => value ?? []);
  }

  Future<List<MyPetsAccessory>> accessoryBind(
      {required String accessory_id, required String animal_id}) {
    return GetDataAPI(
      method: GetDataAPIMethod.post,
      uri: api('pets/accessory-bind'),
      formatter: (json) =>
          (json as List).map((e) => MyPetsAccessory.fromJson(e)).toList(),
    ).call(params: {"accessory_id": accessory_id, 'animal_id': animal_id}).then(
        (value) => value ?? []);
  }

  Future<List<MyPetsAccessory>> accessoryUnbind(
      {required String accessory_id, required String animal_id}) {
    return GetDataAPI(
      method: GetDataAPIMethod.post,
      uri: api('pets/accessory-unbind'),
      formatter: (json) =>
          (json as List).map((e) => MyPetsAccessory.fromJson(e)).toList(),
    ).call(params: {"accessory_id": accessory_id, 'animal_id': animal_id}).then(
        (value) => value ?? []);
  }
}
