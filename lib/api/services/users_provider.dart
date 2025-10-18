import 'package:paw_and_craw/api/api.dart';
import 'package:paw_and_craw/functions/get_data_api.dart';
import 'package:paw_and_craw/objects/user.dart';
import 'package:paw_and_craw/objects/users/users_register.dart';

class UsersProvider {
  Future<User> login({String? username, String? password}) {
    return GetDataAPI(
      method: GetDataAPIMethod.post,
      uri: api('users/login'),
      formatter: (json) => User.fromJson(json),
    ).call(
      params: {
        'username': username ?? '',
        'password': password ?? '',
      },
    ).then(
      (value) {
        return value ?? User();
      },
    );
  }

  Future<dynamic> register({required UsersRegister info}) {
    return GetDataAPI(
      method: GetDataAPIMethod.post,
      uri: api('users/register'),
    ).call(params: info.toJson());
  }

  Future<dynamic> addCoin({required int coin}) {
    return GetDataAPI(
      method: GetDataAPIMethod.post,
      uri: api('users/add-coin'),
    ).call(params: {'coin': coin});
  }

  Future<dynamic> diffCoin({required int coin}) {
    return GetDataAPI(
      method: GetDataAPIMethod.post,
      uri: api('users/diff-coin'),
    ).call(params: {'coin': coin});
  }

  Future<dynamic> delete() {
    return GetDataAPI(
      method: GetDataAPIMethod.delete,
      uri: api('users/delete'),
    ).call();
  }
}
