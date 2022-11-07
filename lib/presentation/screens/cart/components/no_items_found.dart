import 'package:flutter/material.dart';

import '../../../widgets/default_button.dart';
import '../../home/home_screen.dart';

class NoItemsFound extends StatelessWidget {
  const NoItemsFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "No items found",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            DefaultButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, HomeScreen.routeName, (route) => false),
              backgroundColor: const Color(0xff57bfe9),
              forgroundColor: Colors.white,
              text: "Start shopping",
              // width: 250,
            )
          ],
        ));
  }
}
