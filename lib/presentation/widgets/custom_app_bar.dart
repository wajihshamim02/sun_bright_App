import 'package:flutter/material.dart';
import 'package:sun_bright/Utilities/size_config.dart';
import 'package:sun_bright/presentation/screens/home/home_screen.dart';
import 'package:sun_bright/presentation/widgets/custom_bottom_navbar.dart';

import '../../constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Icon? icon;
  final GestureTapCallback? onIconTapped;
  const CustomAppBar(
      {Key? key, required this.title, this.icon, this.onIconTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.getProportionateScreenWidth(30),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: SizeConfig.getProportionateScreenWidth(40),
                  height: SizeConfig.getProportionateScreenWidth(40),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      backgroundColor: Colors.transparent,
                      // backgroundColor: Colors.white,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> CustomBottomNavbar())),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: (icon != null) ? 0 : 40),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                (icon != null)
                    ? SizedBox(
                        width: SizeConfig.getProportionateScreenWidth(40),
                        height: SizeConfig.getProportionateScreenWidth(40),
                        child: InkWell(
                          splashColor: Colors.redAccent,
                          onTap: onIconTapped,
                          borderRadius: BorderRadius.circular(40),
                          child: const Icon(
                            Icons.restore_from_trash,
                            color: Colors.redAccent,
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height +
      SizeConfig.getProportionateScreenHeight(40));
}
