import 'package:paw_and_craw/api/services/animals_provider.dart';
import 'package:paw_and_craw/api/services/pets_provider.dart';
import 'package:paw_and_craw/api/services/users_provider.dart';

Uri get uri => Uri.parse('https://pncp.ndx.vn/');
Uri api(String path) {
  // return uri.replace(path: path);
  return Uri.parse(uri.toString() + path);
}

//api/services/app/Devices/GetAll
class API {
  static UsersProvider get users => UsersProvider();
  static PetsProvider get pets => PetsProvider();
  static AnimalsProvider get animals => AnimalsProvider();
}
