import 'package:flutter/material.dart';
import 'package:sun_bright/constants/colors.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../../widgets/custom_circle.dart';

class WelcomeBack extends StatelessWidget {
  const WelcomeBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage('assets/images/sunbright.jpg')
          ,fit: BoxFit.cover,
          )
     ), );
  }
}
