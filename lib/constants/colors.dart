import 'package:flutter/material.dart';

const Color primaryColor = Color.fromARGB(255, 0, 0, 0);
const Color lightPrimaryColor = Color(0xFFFFECDF);

const Color secondaryColor = Color(0xFF979797);

const Color circleColor = Color.fromARGB(255, 0, 0, 0);

const Color socialCardBgColor = Color(0xFFF5F6F9);

const Color inActiveIconColor = Color(0xFFB6B6B6);

const Color searchFieldTextColor = Color(0xff858585);

const primaryGradientColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color.fromARGB(223, 255, 255, 255),
    Color.fromARGB(255, 255, 255, 255)
  ],
);

const circleGradientColor = LinearGradient(
  begin: Alignment.center,
  end: Alignment.bottomCenter,
  colors: [Color(0xfffab8c3), Color.fromARGB(255, 255, 255, 255)],
);
const Color textColor = Color(0xFF757575);

const primaryShadow = BoxShadow(
  color: Color(0x19393939),
  blurRadius: 60,
  offset: Offset(0, 30),
);

BoxShadow drawerShadow = BoxShadow(
  color: Colors.black.withOpacity(0.2),
  offset: Offset(-4, 4),
  spreadRadius: 1,
  blurRadius: 20,
);
