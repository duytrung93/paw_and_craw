import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paw_and_craw/api/api.dart';
import 'package:paw_and_craw/components/loading_dialog.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';
import 'package:paw_and_craw/functions/audio_utils.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/functions/local_storage.dart';
import 'package:paw_and_craw/pages/home/home_page.dart';
import 'package:paw_and_craw/pages/login/choose_animal_page.dart';
import 'package:paw_and_craw/pages/login/welcome_page.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Global.
  WakelockPlus.enable();

  Global.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    AudioUtils.playBgMusic();

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        AudioUtils.playBgMusic();
        break;
      case AppLifecycleState.inactive:
        AudioUtils.pauseBgMusic(); //If you want to pause music while inactive.
        break;
      case AppLifecycleState.paused:
        AudioUtils.pauseBgMusic();
        break;
      case AppLifecycleState.detached:
        AudioUtils.disposeBGMusic();
        break;
      case AppLifecycleState.hidden:
        AudioUtils.pauseBgMusic();
        break;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return GetMaterialApp(
      title: 'PAWS & CLAWS PROTECTOR',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      theme: ThemeData(
        // applyElevationOverlayColor: false,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.red,
          ),
        ),
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      builder: (context, child) => Stack(
        children: [
          GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child:
                  Container(color: Colors.white, child: child ?? Container())),
          Obx(
            () => Global.loadingController.count > 0
                ? LoadingDialog()
                : Container(),
          )
        ],
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () {
            return FutureBuilder(
              future: API.animals.get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  Global.animals = snapshot.data ?? [];
                  return RedirectPage();
                } else {
                  return Container();
                }
              },
            );
          },
        ),
        GetPage(
          name: '/WelcomePage',
          page: () => WelcomePage(),
        ),
        GetPage(
          name: '/HomePage',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/ChooseAnimalPage',
          page: () => ChooseAnimalPage(),
        ),
      ],
    );
  }
}

class RedirectPage extends StatefulWidget {
  const RedirectPage({super.key});

  @override
  State<RedirectPage> createState() => _RedirectPageState();
}

class _RedirectPageState extends State<RedirectPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialData();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(child: Container());
  }

  Future<void> initialData() async {
    var user = await LocalStorage.getUser();
    if (user != null) {
      Global.loginResult = user;
      if (user.token == null) {
        var myPet = await LocalStorage.getMyPet();
        if (myPet != null) {
          Global.myPets = myPet;
          Get.offAllNamed('/HomePage');
        }
      } else {
        var pet = await API.pets.get();
        if (pet != null) {
          Global.myPets = pet;
          Get.offAllNamed('/HomePage');
        } else {
          Get.offAllNamed('/ChooseAnimalPage');
        }
      }
    } else {
      Get.offAllNamed('/WelcomePage');
    }
  }
}
