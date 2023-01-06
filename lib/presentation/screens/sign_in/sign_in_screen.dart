import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/sign_in_body.dart';

class SignInScreen extends StatelessWidget {

 

  static String routeName = "/signIn";
   SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return const Scaffold(
       
      body: SignInBody(), backgroundColor: Colors.white);
  }
}
