import 'package:flutter/material.dart';
import 'package:sun_bright/presentation/screens/color_pallete_grid/components/slider_footer.dart';
import 'package:sun_bright/presentation/screens/home/home_screen.dart';

class SliderCarousel extends StatefulWidget {
  const SliderCarousel({super.key});

  @override
  State<SliderCarousel> createState() => _SliderCarouselState();
}

class _SliderCarouselState extends State<SliderCarousel> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView.builder(
          itemCount: 6,
          padEnds: false,
          controller: PageController(viewportFraction: 0.8),
          itemBuilder: (context, index) {
            return Stack(children: [
              Positioned(
                top: size.height * 0,
                left: size.width * 0.070,
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const HomeScreen()));
                  },
                  child: Container(
                    height: size.height * 0.4,
                    width: size.width * 0.80,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        // boxShadow: const [
                        //   BoxShadow(
                        //       color: Colors.grey,
                        //       blurRadius: 2,
                        //       spreadRadius: 1 / 100,
                        //       offset: Offset(1, 1))
                        // ],
                        borderRadius: BorderRadius.circular(0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/slider_1.jpeg'),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              ),
              // Positioned(
              //   top: size.height * 0.20,
              //   left: size.width * 0.13,
              //   child: SizedBox(
              //     height: size.height * 0.12,
              //     width: size.width * 0.7,
              //     child: const SliderFooter(),
              //   ),
              // )
            ]);
          },
        ),
      ),
    );
  }
}
