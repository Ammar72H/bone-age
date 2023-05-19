// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:rive/rive.dart';
//
// class testrive extends StatefulWidget {
//   const testrive({Key? key}) : super(key: key);
//
//   @override
//   State<testrive> createState() => _testriveState();
// }
//
// class _testriveState extends State<testrive> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//
//           Positioned.fill(
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//               child: const SizedBox(),
//             ),
//           ),
//           const RiveAnimation.asset(
//             "assets/images/app-pump.riv",
//           ),
//           Positioned.fill(
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//               child: const SizedBox(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
