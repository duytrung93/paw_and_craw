// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gif/gif.dart';
// import 'package:paw_and_craw/components/main_scaffold.dart';
// import 'package:paw_and_craw/functions/global.dart';
// import 'package:paw_and_craw/functions/local_storage.dart';
// import 'package:paw_and_craw/objects/user.dart';
// import 'package:paw_and_craw/pages/donate/donate_page.dart';
// import 'package:paw_and_craw/pages/email/email_start_page.dart';
// import 'package:paw_and_craw/pages/follow_animals/follow_video_list_page.dart';
// import 'package:paw_and_craw/pages/quiz/quiz_page.dart';
// import 'package:paw_and_craw/pages/quiz/quiz_start_page.dart';
//
// class OldHomePage extends StatefulWidget {
//   const OldHomePage({super.key});
//
//   @override
//   State<OldHomePage> createState() => _OldHomePageState();
// }
//
// class _OldHomePageState extends State<OldHomePage> {
//   late UserController userController;
//   Rx<User> get user => userController.data;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     userController = UserController(Global.loginResult ?? User());
//     Get.put(userController);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MainScaffold(
//       backgroundColor: Color(0xfffefbeb),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Container(
//             height: 68,
//             color: Color(0xfff4e69e),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 spacing: 10,
//                 children: [
//                   Image.asset(
//                     user.value.gender == 1
//                         ? 'assets/images/avatar_nam.png'
//                         : 'assets/images/image65.png',
//                     width: 45,
//                   ),
//                   Text(
//                     '${Global.loginResult?.name}',
//                     style: TextStyle(
//                         fontFamily: 'Shantell Sans',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18),
//                   ),
//                   Expanded(child: Container()),
//                   Obx(
//                     () => GestureDetector(
//                       onTap: () {
//                         user.update(
//                           (val) {
//                             val?.userType = UserType.loginAccount;
//                           },
//                         );
//                         Global.loginResult?.userType = user.value.userType;
//                         LocalStorage.setUser(user.value);
//                       },
//                       child: Text(
//                         user.value.userType == UserType.playWithoutAccount
//                             ? 'Make account'
//                             : '',
//                         style: TextStyle(
//                           fontFamily: 'DejaVu Serif',
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   //Donate
//                   GestureDetector(
//                     onTap: () {
//                       Global.to(DonatePage());
//                     },
//                     child: Image.asset(
//                       'assets/images/image69.png',
//                       width: 45,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Global.logout();
//                     },
//                     child: Image.asset(
//                       'assets/images/image67.png',
//                       width: 45,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: Stack(
//               children: [
//                 //Box Your Pet
//                 Positioned(
//                   top: 16,
//                   left: 20,
//                   child: GestureDetector(
//                     onTap: () {
//                       Global.to(QuizStartPage());
//                     },
//                     child: Column(
//                       spacing: 5,
//                       children: [
//                         Container(
//                           width: 160,
//                           height: 155,
//                           padding: EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             color: Color(0xffe8d298),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Obx(
//                             () => Image.asset(
//                               user.value.getPetAvatar(),
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                         ),
//                         buildText('Meet your pet', size: 18)
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 //Box Your Pet Image
//
//                 //Box Change skin
//                 Positioned(
//                   bottom: 10,
//                   left: 20,
//                   child: Container(
//                     width: 90,
//                     height: 90,
//                     decoration: BoxDecoration(
//                       color: Color(0xfff2ca6d),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Center(
//                       child: buildText('Change skin',
//                           decoration: TextDecoration.none, size: 20),
//                     ),
//                   ),
//                 ),
//                 //Hi User
//                 Positioned(
//                   top: 15,
//                   left: 190,
//                   child: Row(
//                     children: [
//                       Text(
//                         'Hi ${Global.loginResult?.name}',
//                         style: TextStyle(
//                           fontSize: 40,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Image.asset(
//                         'assets/images/mat_cuoi.png',
//                         width: 40,
//                       ),
//                       Text(
//                         '!',
//                         style: TextStyle(
//                           fontSize: 40,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // //Box make quiz
//                 // Positioned(
//                 //   top: 85,
//                 //   left: 205,
//                 //   child: Column(
//                 //     spacing: 5,
//                 //     children: [
//                 //       Stack(
//                 //         children: [
//                 //           SizedBox(
//                 //             height: 140,
//                 //             child: Column(
//                 //               mainAxisAlignment: MainAxisAlignment.end,
//                 //               children: [
//                 //                 Container(
//                 //                   width: 100,
//                 //                   height: 100,
//                 //                   decoration: BoxDecoration(
//                 //                     color: Color(0xfff2ca6d),
//                 //                     borderRadius: BorderRadius.circular(30),
//                 //                   ),
//                 //                 ),
//                 //               ],
//                 //             ),
//                 //           ),
//                 //           Positioned(
//                 //             bottom: 0,
//                 //             left: 10,
//                 //             child: Image.asset(
//                 //               'assets/images/image78.png',
//                 //               width: 80,
//                 //             ),
//                 //           ),
//                 //         ],
//                 //       ),
//                 //       buildText('Make\nquiz', size: 30)
//                 //     ],
//                 //   ),
//                 // ),
//                 // //Box make quiz image
//                 //
//                 // //Box quiz
//                 // Positioned(
//                 //   top: 110,
//                 //   left: 325,
//                 //   child: GestureDetector(
//                 //     onTap: () {
//                 //       Global.to(QuizStartPage());
//                 //     },
//                 //     child: Column(
//                 //       spacing: 5,
//                 //       children: [
//                 //         Container(
//                 //           width: 140,
//                 //           height: 140,
//                 //           decoration: BoxDecoration(
//                 //             color: Color(0xfff2ca6d),
//                 //             borderRadius: BorderRadius.circular(50),
//                 //           ),
//                 //           child: Center(
//                 //             child: Image.asset(
//                 //               'assets/images/image72.png',
//                 //               width: 110,
//                 //               height: 110,
//                 //               // fit: BoxFit.contain,
//                 //             ),
//                 //           ),
//                 //         ),
//                 //         buildText('Quiz', size: 40)
//                 //       ],
//                 //     ),
//                 //   ),
//                 // ),
//
//                 //Box follow
//                 Positioned(
//                   top: 80,
//                   left: 220,
//                   child: GestureDetector(
//                     onTap: () {
//                       Global.to(FollowVideoListPage());
//                     },
//                     child: Column(
//                       spacing: 5,
//                       children: [
//                         Container(
//                           width: 165,
//                           height: 145,
//                           decoration: BoxDecoration(
//                             color: Color(0xfff2ca6d),
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           child: Center(
//                             child: Image.asset(
//                               'assets/images/image74.png',
//                               width: 120,
//                               height: 120,
//                               // fit: BoxFit.contain,
//                             ),
//                           ),
//                         ),
//                         buildText('Follow the\nanimals', size: 22)
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 //Củ khoai tây
//                 Positioned(
//                   bottom: -5,
//                   right: 175,
//                   child: Gif(
//                     image: AssetImage('assets/images/image81.gif'),
//                     width: 100,
//                     duration: Duration(seconds: 1),
//                     autostart: Autostart.loop,
//                   ),
//                 ),
//
//                 //Lấp lánh
//                 Positioned(
//                   top: 20,
//                   right: 20,
//                   child: Center(
//                     child: Image.asset(
//                       'assets/images/image79.png',
//                       width: 110,
//                       // fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//
//                 //Đĩa
//                 Positioned(
//                   top: 130,
//                   right: 200,
//                   child: Center(
//                     child: Image.asset(
//                       'assets/images/image89.png',
//                       width: 150,
//                       // fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//
//                 //Cỏ
//                 Positioned(
//                   top: 70,
//                   right: 225,
//                   child: Center(
//                     child: Image.asset(
//                       'assets/images/image91.png',
//                       width: 100,
//                       // fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//
//                 //Box Email
//                 Positioned(
//                   bottom: 13,
//                   right: 30,
//                   child: GestureDetector(
//                     onTap: () {
//                       Global.to(EmailStartPage());
//                     },
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       spacing: 5,
//                       children: [
//                         Container(
//                           width: 111,
//                           height: 101,
//                           decoration: BoxDecoration(
//                             color: Color(0xfff2ca6d),
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           child: Center(
//                             child: Image.asset(
//                               'assets/images/image76.png',
//                               width: 80,
//                               height: 80,
//                               // fit: BoxFit.contain,
//                             ),
//                           ),
//                         ),
//                         buildText('Email us!', size: 20)
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             height: 58,
//             color: Color(0xfff4e69e),
//             child: Padding(
//               padding: const EdgeInsets.all(10),
//               child: Row(
//                 spacing: 40,
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text('Report',
//                       style: TextStyle(
//                         decoration: TextDecoration.underline,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400,
//                       )),
//                   Text('Rating us',
//                       style: TextStyle(
//                         decoration: TextDecoration.underline,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400,
//                       )),
//                   Text('Need support?',
//                       style: TextStyle(
//                         decoration: TextDecoration.underline,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400,
//                       )),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget buildText(
//     String text, {
//     double size = 16,
//     FontWeight? weight,
//     TextDecoration? decoration,
//   }) {
//     return Text(
//       text,
//       textAlign: TextAlign.center,
//       style: TextStyle(
//           fontFamily: 'Shantell Sans',
//           fontSize: size,
//           height: 1.1,
//           fontWeight: weight ?? FontWeight.bold,
//           decoration: decoration ?? TextDecoration.underline,
//           decorationThickness: 0.5),
//     );
//   }
// }
