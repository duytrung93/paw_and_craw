// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gif/gif.dart';
// import 'package:paw_and_craw/components/main_scaffold.dart';
// import 'package:paw_and_craw/functions/global.dart';
// import 'package:paw_and_craw/objects/user.dart';
// import 'package:paw_and_craw/pages/login/choose_animal_name_page.dart';
//
// class OldChooseAnimalPage extends StatefulWidget {
//   const OldChooseAnimalPage({super.key});
//
//   @override
//   State<OldChooseAnimalPage> createState() => _OldChooseAnimalPageState();
// }
//
// class _OldChooseAnimalPageState extends State<OldChooseAnimalPage> {
//   Rx<User> get user => Get.find<UserController>().data;
//   @override
//   Widget build(BuildContext context) {
//     return MainScaffold(
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           //Vương miệng
//           Positioned(
//             top: 10,
//             left: 40,
//             child: Gif(
//               image: AssetImage('assets/images/image49.gif'),
//               width: 80,
//               autostart: Autostart.loop,
//               duration: Duration(seconds: 2),
//             ),
//           ),
//           //Nấm
//           Positioned(
//             top: 0,
//             right: 30,
//             child: Gif(
//               image: AssetImage('assets/images/image46.gif'),
//               width: 70,
//               autostart: Autostart.loop,
//               duration: Duration(seconds: 2),
//             ),
//           ),
//           //Lời chào
//           Positioned(
//               top: 10,
//               left: 140,
//               child: Obx(
//                 () => Text(
//                   'Welcome ${user.value.name}'.toUpperCase(),
//                   style: TextStyle(
//                       fontFamily: 'Shantell Sans',
//                       color: Color(0xffb0cceb),
//                       fontSize: 48,
//                       fontWeight: FontWeight.bold),
//                 ),
//               )),
//           //Mô tả
//           Positioned(
//             top: 90,
//             left: 20,
//             child: Text(
//               'Choose your favorite animal!',
//               style: TextStyle(
//                 fontFamily: 'DejaVu Serif',
//                 fontWeight: FontWeight.bold,
//                 fontSize: 29,
//               ),
//             ),
//           ),
//
//           //Nơ
//           Positioned(
//             top: 80,
//             left: 540,
//             child: Transform(
//               alignment: Alignment.center,
//               transform: Matrix4.rotationY(pi),
//               child: Image.asset(
//                 'assets/images/image51.png',
//                 width: 70,
//               ),
//             ),
//           ),
//
//           //Gấu trúc
//           Positioned(
//             top: 150,
//             left: 20,
//             child: GestureDetector(
//               onTap: () {
//                 pickAnimal(0);
//               },
//               child: Image.asset(
//                 'assets/images/image37.png',
//                 width: 130,
//               ),
//             ),
//           ),
//
//           //Rùa
//           Positioned(
//             top: 170,
//             left: 260,
//             child: GestureDetector(
//               onTap: () {
//                 pickAnimal(1);
//               },
//               child: Image.asset(
//                 'assets/images/image43.png',
//                 width: 150,
//               ),
//             ),
//           ),
//
//           //Khỉ
//           Positioned(
//             top: 130,
//             left: 460,
//             child: GestureDetector(
//               onTap: () {
//                 pickAnimal(2);
//               },
//               child: Image.asset(
//                 'assets/images/image39.png',
//                 width: 150,
//               ),
//             ),
//           ),
//
//           //Hoa
//           Positioned(
//             bottom: 0,
//             left: 0,
//             child: Image.asset(
//               'assets/images/image47.png',
//               width: 110,
//             ),
//           ),
//
//           //Báo
//           Positioned(
//             bottom: 20,
//             left: 120,
//             child: GestureDetector(
//               onTap: () {
//                 pickAnimal(3);
//               },
//               child: Image.asset(
//                 'assets/images/image41.png',
//                 width: 180,
//               ),
//             ),
//           ),
//           //Chim
//           Positioned(
//             bottom: 50,
//             left: 350,
//             child: GestureDetector(
//               onTap: () {
//                 pickAnimal(4);
//               },
//               child: Image.asset(
//                 'assets/images/image44.png',
//                 width: 220,
//               ),
//             ),
//           ),
//           //Capypara
//           Positioned(
//             bottom: 100,
//             right: 20,
//             child: GestureDetector(
//               onTap: () {
//                 pickAnimal(5);
//               },
//               child: Image.asset(
//                 'assets/images/image38.png',
//                 width: 120,
//               ),
//             ),
//           ),
//           //Cỏ
//           Positioned(
//             bottom: 0,
//             right: 30,
//             child: Gif(
//               image: AssetImage('assets/images/image50.gif'),
//               width: 140,
//               autostart: Autostart.loop,
//               duration: Duration(seconds: 6),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void pickAnimal(int i) {
//     user.update((val) {
//       val?.pet_id = i;
//     });
//     Global.to(ChooseAnimalNamePage());
//   }
// }
