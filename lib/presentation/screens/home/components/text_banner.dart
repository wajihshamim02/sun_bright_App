import 'package:flutter/material.dart';

import '../../../../constants/text_style.dart';

class TextBanner extends StatelessWidget {
  const TextBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.1,
        top: MediaQuery.of(context).size.height * 0.04,
        bottom: MediaQuery.of(context).size.height * 0.04,
      ),
      child: const Text("Sab rang\nsunbright k sang", style: kBannerTextStyle),
    );
  }
}
