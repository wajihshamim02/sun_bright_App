import 'package:flutter/material.dart';

import '../../../../Utilities/size_config.dart';
import '../../../../constants/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.getProportionateScreenWidth(20),
      ),
      child: SizedBox(
        width: SizeConfig.getProportionateScreenWidth(40),
        height: SizeConfig.getProportionateScreenWidth(40),
        child: TextButton(
          style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            backgroundColor: Colors.transparent,
            // backgroundColor: Colors.white,
            padding: EdgeInsets.zero,
          ),
          onPressed: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
