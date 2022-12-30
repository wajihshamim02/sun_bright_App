import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sun_bright/constants/colors.dart';

import '../../../../constants/form_messages.dart';
import '../../../widgets/custom_button.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {


  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String? email;
  @override
  void initState() {
    super.initState();
  }


   void resetpassword(String email) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .sendPasswordResetEmail(email: email)
          .then((uid) => {
                Fluttertoast.showToast(msg: 'Please Check your Email'),
             
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          emailFormField(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          CustomButton(
            title: "Continue",
            backgroundColor: primaryColor,
            forgroundColor: Colors.white,
            width: MediaQuery.of(context).size.width * 0.85,
            onPressed: () {
              resetpassword(_emailController.text)  ;          
            },
          ),
        ],
      ),
    );
  }

  TextFormField emailFormField() {
    return TextFormField(
      // key: _formKey,
      controller: _emailController,
    
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          suffixIcon: Icon(Icons.email)),
     validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter your Email ");
        }

        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
