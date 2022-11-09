import 'package:flutter/material.dart';
import 'package:sun_bright/presentation/widgets/social_media_box.dart';

import '../../../widgets/custom_header.dart';
import 'sign_up_form.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: Column(
          children: [
             CustomHeader(
              title: "Create Account",
              
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const SignUpForm(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const SocialMediaBox()
          ],
        ),
      ),
    );
  }
}
