import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sun_bright/constants/colors.dart';
import 'package:sun_bright/constants/text_style.dart';

import '../../../../Utilities/size_config.dart';

class DrawerMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool lastItem;
  final String pageUrl;

  const DrawerMenuItem(
      {Key? key,
      required this.title,
      required this.icon,
      required this.lastItem,
      required this.pageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Future<void> _signOut() async {
            await FirebaseAuth.instance.signOut();
          }

          Navigator.pushNamed(
            context,
            pageUrl,
          );
          // Navigator.pushNamed(context, pageUrl);
        },
        child: Align(
            alignment: Alignment.centerLeft,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 18,
                    ),
                    Icon(
                      icon,
                      color: Colors.black,
                      //icons wajih
                      size: 20,
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Text(
                      title,
                      style: drawerItemTextStyle,
                      //text wajih
                    ),
                  ],
                ),
              ),
              if (!lastItem)
                Container(
                  margin: EdgeInsets.only(
                      right: SizeConfig.getProportionateScreenWidth(150),
                      top: 7),
                  height: 1,
                  width: SizeConfig.getProportionateScreenWidth(100),
                  color: Colors.black,
                  //lines wajih
                )
            ])),
      ),
    );
  }
}
