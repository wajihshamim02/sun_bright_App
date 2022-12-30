import 'package:flutter/material.dart';

class DateContainer extends StatefulWidget {

 final String datevalue;
  const DateContainer({Key? key, required this.datevalue}) : super(key: key);

  @override
  _DateContainerState createState() => _DateContainerState();
}

class _DateContainerState extends State<DateContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color:Colors.black87)),
              child: Center(child: Text(widget.datevalue)),
          ),
          
          SizedBox(
            width: size.width * 0.04,
          ),
        ],
      ),
    );
  }
}
