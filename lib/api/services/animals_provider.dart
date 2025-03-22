import 'package:paw_and_craw/api/api.dart';
import 'package:paw_and_craw/functions/get_data_api.dart';
import 'package:paw_and_craw/objects/data_animal.dart';
import 'package:paw_and_craw/objects/pet_add.dart';
import 'package:paw_and_craw/objects/pets/my_pets.dart';
import 'package:paw_and_craw/objects/user.dart';
import 'package:paw_and_craw/objects/users/users_register.dart';

class AnimalsProvider {
  Future<List<DataAnimal>> get() {
    return GetDataAPI(
      method: GetDataAPIMethod.get,
      uri: api('animals'),
      formatter: (json) =>
          (json as List).map((e) => DataAnimal.fromJson(e)).toList(),
    ).call().then(
          (value) => value ?? [],
        );
  }
}
