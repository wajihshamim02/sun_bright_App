import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sun_bright/constants/text_style.dart';
import 'package:sun_bright/presentation/screens/cart/components/cart_app_bar.dart';

import '../../../../Utilities/size_config.dart';
import '../../../../constants/colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_page_transition.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../sign_up/sign_up_screen.dart';
import '../home_screen.dart';

class ContactInfo extends StatefulWidget {
  
  const ContactInfo({Key? key}) : super(key: key);

  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: const Text(
                "Contact information",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
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
                    onPressed: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                children: [

                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      yourname(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      yourphone(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text('Convenient Time',style: TextStyle(fontSize: 20)),
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      time1(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      time2(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      CustomButton(
                        title: "Submit",
                        backgroundColor: primaryColor,
                        forgroundColor: Colors.white,
                        width: MediaQuery.of(context).size.width * 0.85,
                        onPressed: () async {
                          // // if (_formKey.currentState!.validate()) {
                          //   _formKey.currentState!.save();
                          //   // Check user Identity
                          //   bool result = await _sqliteDbHelper.checkIdentity(
                          //       email: email, password: password);
                          //   if (result) {
                          //     KeyboardUtil.hideKeyboard(context);

                          // } else {
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(const SnackBar(
                          //     content: Text("Please check your email or password"),
                          //     backgroundColor: Colors.black38,
                          //   ));
                          // }
                          // }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFormField yourname() {
    return TextFormField(
      // key: _emailFormFieldKey,
      // onSaved: (newEmail) {
      //   setState(() {
      //     email = newEmail;
      //   });
      // },
      // onChanged: (newEmail) {
      //   _emailFormFieldKey.currentState!
      //       .validate(); // call emailFormField validator
      // },
      // onFieldSubmitted: (newEmail) {
      //   passwordFocusNode.requestFocus();
      // },
      style: TextStyle(fontFamily: "Roboto"),
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          labelText: "Your name", hintText: "Enter your name",hintStyle: TextStyle(fontFamily: "Roboto")),
      // validator: (newEmail) {
      //   if (newEmail!.isEmpty) {
      //     return kEmailNullError;
      //   } else if (!emailValidatorRegExp.hasMatch(newEmail)) {
      //     return kInvalidEmailError;
      //   }
      //   return null;
      // },
    );
  }

  TextFormField yourphone() {
    return TextFormField(
      // key: _emailFormFieldKey,
      // onSaved: (newEmail) {
      //   setState(() {
      //     email = newEmail;
      //   });
      // },
      // onChanged: (newEmail) {
      //   _emailFormFieldKey.currentState!
      //       .validate(); // call emailFormField validator
      // },
      // onFieldSubmitted: (newEmail) {
      //   passwordFocusNode.requestFocus();
      // },
      style: TextStyle(fontFamily: "Roboto"),
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
          labelText: "Phone", hintText: "Enter your Phone number",hintStyle: TextStyle(fontFamily: "Roboto")),
      // validator: (newEmail) {
      //   if (newEmail!.isEmpty) {
      //     return kEmailNullError;
      //   } else if (!emailValidatorRegExp.hasMatch(newEmail)) {
      //     return kInvalidEmailError;
      //   }
      //   return null;
      // },
    );
  }

  TextFormField time1() {
    return TextFormField(
      style: TextStyle(fontFamily: "Roboto"),
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        
           hintText: "09:00",hintStyle: TextStyle(fontFamily: "Roboto")),

    );
  }
  TextFormField time2() {
    return TextFormField(
      style: TextStyle(fontFamily: "Roboto"),
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
          hintText: "20:00",hintStyle: TextStyle(fontFamily: "Roboto")),

    );
  }
}
