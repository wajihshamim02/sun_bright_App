import 'package:flutter/material.dart';
import 'package:sun_bright/constants/colors.dart';

import '../../../Utilities/size_config.dart';
import 'components/otp_body.dart';

class OTPScreen extends StatelessWidget {
  static const String routeName = "/otp";
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text("OTP Verification"),
      ),
      body: const OTPBody(),
    );
  }
}
