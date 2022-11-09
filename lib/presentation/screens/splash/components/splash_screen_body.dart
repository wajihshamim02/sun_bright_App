import 'package:flutter/material.dart';
import 'package:sun_bright/constants/colors.dart';
import 'package:sun_bright/presentation/screens/sign_in/sign_in_screen.dart';

import '../../../../constants/text_style.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_page_transition.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({Key? key}) : super(key: key);

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 2), vsync: this)
        ..repeat(reverse: true);
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.ease);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage('assets/images/sunbright.jpg'),
                    fit: BoxFit.cover,
                  )),
            )
          ],
        ),
      ),
    );
  }

  // override dispose method to release the memory of controller object after leaving the screen
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
