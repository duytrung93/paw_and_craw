import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paw_and_craw/functions/local_storage.dart';
import 'package:paw_and_craw/objects/http/api_result.dart';

import 'global.dart';

enum GetDataAPIMethod {
  get,
  post,
  put,
  delete,
}

class GetDataAPI<T> {
  final Uri uri;
  final GetDataAPIMethod method;
  final T Function(dynamic json)? formatter;

  GetDataAPI({
    required this.uri,
    this.method = GetDataAPIMethod.get,
    this.formatter,
  });

  Future<T?> call({
    String? path,
    Map<String, dynamic>? params,
    bool wait = true,
  }) async {
    return Future.delayed(Duration(seconds: 0), () async {
      // print('${uri} - ${path} - ${params}');
      try {
        if (wait) {
          print('ShowLoading');

          Global.loadingController.showLoading();
        }
        http.Response? response = null;
        var headers = <String, String>{
          'Content-Type': 'application/json; '
              'charset=UTF-8',
        };
        // if (uri.path == '/Account/Login') {
        //   headers['redirect_uri'] =
        //   "http://asset.quanlynoibo.com/Account/Callback";
        // }
        if (Global.loginResult != null && Global.loginResult!.token != null) {
          headers['Authorization'] = "Bearer ${Global.loginResult!.token!}";
          print(Global.loginResult!.token!);
        }
        try {
          switch (method) {
            case GetDataAPIMethod.get:
              response = await http.get(
                uri.replace(queryParameters: params),
                headers: headers,
              );
              break;
            case GetDataAPIMethod.post:
              response = await http.post(
                uri,
                headers: headers,
                body: utf8.encode(jsonEncode(params)),
                //body: params,
              );
              break;
            case GetDataAPIMethod.put:
              response = await http.put(
                path != null ? uri.replace(path: uri.path + '/' + path) : uri,
                headers: headers,
                body: utf8.encode(jsonEncode(params)),
              );
              break;
            case GetDataAPIMethod.delete:
              response = await http.delete(
                path != null ? uri.replace(path: uri.path + '/' + path) : uri,
                headers: headers,
              );
              break;
          }
        } catch (e) {
          throw e;
        }
        await Future.delayed(Duration(milliseconds: 250), () {});
        if (response == null) {
          throw Exception("Hệ tống lỗi, vui lòng thử lại.");
        }
        // if (response == null) {
        //   throw Exception('Đã có lỗi sảy ra');
        // }
        print(response.request!.url.toString());
        print(jsonEncode(params));
        // print(headers['Abp.TenantId']);
        ///Cần đăng nhập
        if (response.statusCode != 200) {
          if (response.statusCode == 401 && uri.path != '/users/login') {
            LocalStorage.setUser(null).then(
              (value) {
                Get.offAllNamed('/');
                // throw Exception(apiResult.ErrMessage);
              },
            );
          }
        }
        // print(uri.toString()+' - '+uri.query);
        var json = jsonDecode(response.body);

        // print(uri.path);
        // if (uri.path == '/Account/Login') {
        //   var result = formatter?.call(json);
        //   return result;
        // } else {
        var apiResult = APIResult.fromJson(json);
        print(json['value']);
        if (apiResult.isSuccess) {
          if (apiResult.value == null) return null;
          if (formatter != null) return formatter!(apiResult.value);
          return apiResult.value;
        } else {
          if (apiResult.unAuthorizedRequest) {
            if (uri.path != '/users/login') {
              LocalStorage.setUser(null).then(
                (value) {
                  Get.offAllNamed('/');
                  // throw Exception(apiResult.ErrMessage);
                },
              );
            }
          }
          if (apiResult.error != null) {
            throw Exception(apiResult.error?.description);
          } else {
            throw Exception(response.body);
          }
        }
        // switch (apiResult.Code) {
        //   case 1: //Thành công
        //     if (apiResult.Data == null) return null;
        //     if (formatter != null) return formatter!(apiResult.Data);
        //     return apiResult.Data;
        //   case 2: //Lỗi
        //     throw Exception(apiResult.ErrMessage);
        //   case 3: //Đăng nhập lại
        //     LocalStorage.setLogin(null).then(
        //       (value) {
        //         Get.offAllNamed('/');
        //         // throw Exception(apiResult.ErrMessage);
        //       },
        //     );
        //     break;
        //   default:
        //     throw Exception(response.body);
        // }

        // throw Exception('Đã có lỗi sảy ra');
      } on http.ClientException catch (e) {
        Get.dialog(AlertDialog(
          content: Text(
            e.message,
            style: TextStyle(color: Colors.redAccent),
          ),
        ));
        throw e.message;
      } catch (e) {
        // Utilitys.showMessage(
        //   e.toString().replaceAll('Exception: ', ''),
        //   type: MyNotificationType.error,
        // );
        Get.dialog(AlertDialog(
          content: Text(
            e.toString().replaceAll('Exception: ', ''),
            style: TextStyle(color: Colors.redAccent),
          ),
        ));
        print(e.toString());
        // Get.snackbar(
        //   'Thông báo',
        //   e.toString().replaceAll('Exception: ', ''),
        //   titleText: Text('Thông báo'),
        //   colorText: Colors.red,
        //   // messageText: Text('Abcd')
        // );
        throw e.toString().replaceAll('Exception: ', '');
      } finally {
        if (wait) {
          Future.delayed(Duration(seconds: 0), () {
            print('OffLoading');
            Global.loadingController.offLoading();
          });
        }
      }
    });
  }
}
