import 'package:flutter/material.dart';
import 'package:sun_bright/presentation/screens/profile/components/Edit_Profile.dart';
import 'package:sun_bright/presentation/screens/profile/components/edit_profile2.dart';
import 'package:sun_bright/presentation/screens/profile/components/editprofile3.dart';

import '../../sign_in/sign_in_screen.dart';
import 'profile_menu.dart';
import 'profile_picture.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          const ProfilePicture(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: ((context) => Editprofile3()))),
            child: ProfileMenu(
              text: "Edit Profile",
              icon: const Icon(
                Icons.supervised_user_circle,
              ),
              onPressed: () {},
              icon2: Icons.person,
            ),
          ),
          ProfileMenu(
            text: "Notification",
            icon: const Icon(
              Icons.notification_add_outlined,
              color: Color.fromARGB(255, 253, 0, 0),
            ),
            onPressed: () {},
            icon2: Icons.notifications,
          ),
          ProfileMenu(
            text: "Settings",
            icon: const Icon(Icons.supervised_user_circle),
            onPressed: () {},
            icon2: Icons.settings,
          ),
          ProfileMenu(
            text: "Help Center",
            icon: const Icon(Icons.supervised_user_circle),
            onPressed: () {},
            icon2: Icons.help,
          ),
          ProfileMenu(
            text: "Log Out",
            icon: const Icon(Icons.supervised_user_circle),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) =>  SignInScreen()),
                (Route<dynamic> route) => false,
              );
              // Navigator.pushReplacementNamed(context, SignInScreen.routeName);
            },
            icon2: Icons.logout,
          ),
        ],
      ),
    );
  }
}
