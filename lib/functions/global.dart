import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_craw/functions/local_storage.dart';
import 'package:paw_and_craw/get_controller/loading_controller.dart';
import 'package:paw_and_craw/objects/user.dart';

class Global {
  static Size get targetPlatform => Size(800, 450);

  static Color get mainBackgroundColor => Colors.black.withAlpha(15);
  static Color get mainColor => Color(0xfffef8d8);
  static User? loginResult;

  static late LoadingController loadingController;

  static void init() {
    loadingController = Get.put(LoadingController(), permanent: true);
  }

  static Future logout() {
    return LocalStorage.setLogin(null).then(
      (value) {
        return Get.offAllNamed('/');
      },
    );
  }

  static void to(Widget child) {
    Get.to(
      () => PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) {
          if (!didPop) {
            if (Global.loadingController.count <= 0) {
              Get.back();
            }
          }
        },
        child: child,
      ),
      preventDuplicates: false,
      fullscreenDialog: true,
      transition: Transition.fade,
    );
  }

  static Future showMessage(String message,
      {String? title, Color? messageColor, List<Widget>? actions}) {
    return Get.dialog(AlertDialog(
      title: title != null ? Text(title) : null,
      content: Text(
        message,
        style: TextStyle(color: messageColor ?? mainColor),
      ),
      actions: actions,
    ));
  }

  static void showError(String message) {
    showMessage(message, messageColor: Colors.redAccent);
  }

  static Future<String> showInput(
    BuildContext context, {
    String initialValue = '',
    String? hintText,
    int? maxLength,
  }) {
    return Future(
      () async {
        TextEditingController txtName =
            TextEditingController(text: initialValue);
        await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Wrap(
              children: [
                Row(
                  children: [
                    Expanded(child: Container()),
                    Container(
                      width: Global.targetPlatform.width *
                          (MediaQuery.of(context).size.height /
                              Global.targetPlatform.height),
                      color: Colors.white,
                      child: Stack(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              isDense: true,
                              border: InputBorder.none,
                              hintText: hintText,
                            ),
                            controller: txtName,
                            maxLength: maxLength,
                            // textAlign: TextAlign.center,
                            autofocus: true,
                            style: TextStyle(
                              fontFamily: 'Shantell Sans',
                              fontWeight: FontWeight.bold,
                            ),
                            onEditingComplete: () {
                              Navigator.pop(context);
                            },
                          ),
                          Positioned(
                            right: 10,
                            top: 15,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                )
              ],
            ),
          ),
        );

        return txtName.text;
      },
    );
  }
}

extension ListNN<T> on List<T?> {
  /// Returns a `RxInt` with [this] `int` as initial value.
  List<T> get asNonNullList =>
      where((element) => element != null).map((e) => e!).toList();
}
