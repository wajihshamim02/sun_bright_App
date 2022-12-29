import 'package:flutter/material.dart';
import 'package:sun_bright/presentation/screens/color_pallete_grid/components/slider.dart';
import 'package:sun_bright/presentation/screens/product_details/components/custom_app_bar.dart';
import 'package:sun_bright/presentation/widgets/CustomAppBar.dart';

import 'components/product_container.dart';

class Interior_ColorPalleteGrid extends StatefulWidget {
  const Interior_ColorPalleteGrid({super.key});

  @override
  State<Interior_ColorPalleteGrid> createState() =>
      _Interior_ColorPalleteGridState();
}

class _Interior_ColorPalleteGridState extends State<Interior_ColorPalleteGrid> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverToBoxAdapter(
              child: SizedBox(
                  height: size.height * 0.5,
                  width: size.width * 0.80,
                  child: SliderCarousel())),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Royal Matt Emulsion',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Home/',
                        style: TextStyle(fontSize: 10, color: Colors.black54),
                      ),
                      Text('Products/',
                          style:
                              TextStyle(fontSize: 10, color: Colors.black54)),
                      Text('Interior Paint/',
                          style:
                              TextStyle(fontSize: 10, color: Colors.black54)),
                      Text('Royal Matt Emulsion',
                          style: TextStyle(fontSize: 10, color: Colors.grey))
                    ],
                  ),
                )),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.68,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ProductDetailContainer(
                      image: 'assets/images/PastelPeach.png',
                      title: 'Pastel Peaches',
                      price: 13089);
                },
                childCount: 8,
              ),
              
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: MediaQuery.of(context).size.height*0.02,))
        ],
      ),
    );
  }
}
