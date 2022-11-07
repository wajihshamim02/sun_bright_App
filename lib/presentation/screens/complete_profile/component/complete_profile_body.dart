import 'package:flutter/material.dart';
import 'package:sun_bright/Utilities/size_config.dart';

import '../../sign_in/components/sign_in_form.dart';
import 'complete_profile_form.dart';

// ignore: must_be_immutable
class CompleteProfileBody extends StatefulWidget {
   final ScreenArgs userData;
   const CompleteProfileBody({Key? key,required this.userData}) : super(key: key);

  @override
  State<CompleteProfileBody> createState() => _CompleteProfileBodyState();
}

class _CompleteProfileBodyState extends State<CompleteProfileBody> {
  @override
  Widget build(BuildContext context) {
    final String userName = widget.userData.email.split("@")[0];
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Text(
                "Complete $userName Profile",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2
                ),
                ),
                const Text(
                  "Please complete your information",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                // CompleteProfileForm(userData: userData,),
                SizedBox(height: SizeConfig.getProportionateScreenHeight(30)),
                Text(
                  "By continuing your confirm that you agree \nwith our Term and Condition",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: SizeConfig.getProportionateScreenHeight(30)),
              ],
            )
          ),
        ),
      ),
    );
  }
}
