import 'package:flutter/material.dart';

import '../../../Utilities/size_config.dart';
import '../../widgets/custom_app_bar.dart';
import 'components/profile_content.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(
      appBar: CustomAppBar(
        title: "My Profile",
      ),
      body: ProfileContent(),
    );
  }
}
