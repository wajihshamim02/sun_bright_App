import 'package:flutter/material.dart';

import '../../../widgets/custom_header.dart';
import 'forgot_password_form.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Center(
          child: Column(
            children: [
               CustomHeader(
                title: "Forgot Password?",
               
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const ForgotPasswordForm(),
            ],
          ),
        ),
      ),
    ));
  }
}
