import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../sign_in/components/sign_in_form.dart';
import 'component/complete_profile_body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static const String routeName ="/complete_profile";
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = ModalRoute.of(context)!.settings.arguments  as ScreenArgs;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text("Complete Your Profile"),
      ),
      body:  CompleteProfileBody(userData: userData),
    );
  }
}
