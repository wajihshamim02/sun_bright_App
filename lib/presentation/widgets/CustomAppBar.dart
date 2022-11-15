import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sun_bright/presentation/widgets/search_field.dart';

class CustomSliverAppBar extends StatefulWidget {
  const CustomSliverAppBar({super.key});

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  late double xOffset, yOffset, scaleFactor;
  late bool isDrawerOpen;

  @override
  void initState() {
    super.initState();
    xOffset = yOffset = 0.0;
    scaleFactor = 1.0;
    isDrawerOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: isDrawerOpen ? false : true,
      toolbarHeight: MediaQuery.of(context).size.height * 0.1,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: isDrawerOpen
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color.fromARGB(221, 0, 0, 0),
              ),
              onPressed: () {
                setState(() {
                  xOffset = 0.0;
                  yOffset = 0.0;
                  scaleFactor = 1;
                  isDrawerOpen = false;
                });
              },
            )
          : IconButton(
              icon: SvgPicture.asset("assets/icons/hamburger.svg"),
              onPressed: () {
                setState(() {
                  xOffset = MediaQuery.of(context).size.width * 0.55;
                  yOffset = MediaQuery.of(context).size.height * 0.2;
                  scaleFactor = 0.6;
                  isDrawerOpen = true;
                });
              },
            ),
      title: Expanded(
        // take the remaining space of the row
        child: SearchField(),
      ),
    );
  }
}
