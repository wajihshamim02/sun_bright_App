// import 'package:flutter/material.dart';

// class SliderFooter extends StatefulWidget {
//   const SliderFooter({super.key});

//   @override
//   State<SliderFooter> createState() => _SliderFooterState();
// }

// class _SliderFooterState extends State<SliderFooter> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 28.0),
//         child: Row(
//           children: [
//             Container(
//               width: size.width * 0.2,
//               height: size.height * 0.4,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                 image: AssetImage('assets/images/paint_3.png'),
//               )),
//             ),
//             const Spacer(),
//             Container(
//               height: size.height * 0.4,
//               width: size.width * 0.2,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage('assets/images/sunbright_logo.png'))),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
