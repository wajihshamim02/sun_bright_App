import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  final String text;
  final Icon icon;
  final IconData icon2;
  final VoidCallback? onPressed;
  const ProfileMenu(
      {Key? key,
      required this.text,
      required this.icon,
      required this.icon2,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                  color: Color.fromARGB(255, 240, 240, 240),
                    borderRadius: BorderRadius.circular(15)),
                  child: Icon(
                    icon2,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: "SF Pro Text",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
