import 'package:flutter/material.dart';
import 'package:sun_bright/presentation/screens/home/components/contact_info.dart';

import '../../../../constants/colors.dart';
import '../../../widgets/custom_page_transition.dart';

class NeedAPainter extends StatefulWidget {
  static const String routeName = "/need_a_painter";
  const NeedAPainter({Key? key}) : super(key: key);

  @override
  _NeedAPainterState createState() => _NeedAPainterState();
}

class _NeedAPainterState extends State<NeedAPainter> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 60,
        width: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.black),
        child: Center(
          child: Text(
            "Need a painter ?",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          "Give us your contact info we will find a painter for you paint work.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: primaryColor,
            fontSize: 18,
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Container(
        height: 280,
        width: 280,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/painter.png'))),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      InkWell(
        onTap: () => Navigator.push(context,
            CustomScaleTransition(nextPage: ContactInfo(), nextPageUrl: '')),
        child: Container(
          height: 50,
          width: 170,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color.fromARGB(255, 224, 0, 0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Click here",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Icon(
                Icons.format_paint,
                color: Colors.white,
              )
            ],
          ),
        ),
      )
    ]);
  }
}
