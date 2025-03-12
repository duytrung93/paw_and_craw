import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paw_and_craw/components/loading_dialog.dart';
import 'package:paw_and_craw/functions/global.dart';
import 'package:paw_and_craw/functions/local_storage.dart';
import 'package:paw_and_craw/pages/home/home_page.dart';
import 'package:paw_and_craw/pages/login/welcome_page.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

final List<String> _allAsset = [
  'image1.png',
  'image2.svg',
  'image3.png',
  'image4.png',
  'image5.svg',
  'image6.png',
  'image7.png',
  'image8.png',
  'image9.png',
  'image11.png',
  'image12.svg',
  'image13.gif',
  'image14.gif',
  'image15.gif',
  'image16.gif',
  'image17.png',
  'image18.svg',
  'image19.png',
  'image20.svg',
  'image21.png',
  'image22.png',
  'image23.svg',
  'image24.gif',
  'image25.png',
  'image26.svg',
  'image27.png',
  'image28.svg',
  'image29.png',
  'image30.gif',
  'image31.png',
  'image32.svg',
  'image33.png',
  'image34.png',
  'image35.gif',
  'image36.gif',
  'image37.png',
  'image38.png',
  'image39.png',
  'image40.svg',
  'image41.png',
  'image42.svg',
  'image43.png',
  'image44.png',
  'image45.svg',
  'image46.gif',
  'image47.png',
  'image48.svg',
  'image49.gif',
  'image50.gif',
  'image51.png',
  'image52.png',
  'image53.svg',
  'image54.png',
  'image55.svg',
  'image56.png',
  'image57.svg',
  'image58.png',
  'image59.svg',
  'image60.png',
  'image61.svg',
  'image62.png',
  'image63.svg',
  'image64.png',
  'image65.png',
  'image66.svg',
  'image67.png',
  'image68.svg',
  'image69.png',
  'image70.svg',
  'image71.png',
  'image72.png',
  'image73.svg',
  'image74.png',
  'image75.svg',
  'image76.png',
  'image77.svg',
  'image78.png',
  'image79.png',
  'image80.svg',
  'image81.gif',
  'image82.png',
  'image83.svg',
  'image84.png',
  'image85.png',
  'image86.svg',
  'image87.png',
  'image88.svg',
  'image89.png',
  'image90.svg',
  'image91.png',
  'image92.svg',
  'image93.png',
  'image94.svg',
  'image95.png',
  'image96.png',
  'image97.png',
  'image98.svg',
  'image99.png',
  'image100.svg',
  'image101.png',
  'image102.png',
  'image103.svg',
  'image104.png',
  'image105.svg',
  'image106.png',
  'image107.svg',
  'image108.jpeg',
  'image109.png',
  'image110.svg',
  'image111.png',
  'image112.png',
  'image113.png',
  'image114.svg',
  'image115.png',
  'image116.png',
  'image117.jpeg',
  'image118.gif',
  'image119.gif',
  'image120.gif',
  'image121.png',
  'image122.png',
  'image123.svg',
  'image124.png',
  'image125.png',
  'image126.svg',
  'image127.gif',
  'image128.png',
  'image129.png',
  'image130.png',
  'media1.mp4',
  'Picture1.png',
  'Picture3.png',
  'Picture5.png',
  'Picture6.png',
  'Picture7.png',
  'Picture8.gif',
  'Picture10.gif',
  'Picture11.png',
  'Picture12.png',
  'Picture13.png',
  'Picture14.png'
];

void main() {
  final binding = WidgetsFlutterBinding.ensureInitialized();

  binding.addPostFrameCallback((_) async {
    BuildContext? context = binding.rootElement;
    if (context != null) {
      for (var asset in _allAsset) {
        var ext = asset.split('.').last;
        if (ext == 'png' || ext == 'gif') {
          print('assets/images/$asset');
          precacheImage(AssetImage('assets/images/$asset'), context);
        }
      }
    }
  });
  // Global.
  WakelockPlus.enable();

  Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              future: Future.wait([LocalStorage.getLogin()]),
              builder: (context, snapshot) {
                Global.loginResult = snapshot.data?[0];
                return Global.loginResult != null ? HomePage() : WelcomePage();
              },
            );
          },
        ),
      ],
    );
  }
}
