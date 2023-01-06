import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sun_bright/constants/form_messages.dart';
import 'package:sun_bright/model/user_model.dart';
import 'package:sun_bright/presentation/screens/sign_in/components/sign_in_form.dart';
import 'package:sun_bright/presentation/screens/sign_in/sign_in_screen.dart';

import '../../../../constants/colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_page_transition.dart';
import '../../complete_profile/complete_profile.dart';
import '../../profile/components/DateContainer.dart';
import '../sign_up_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  final _auth = FirebaseAuth.instance;

  String? email, password, confirmedPassword;
  late FocusNode passwordFocusNode, confirmPasswordFocusNode;
  @override
  void initState() {
    super.initState();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  void signup(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => postDetailToFirestore())
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailToFirestore() async {
    //calling our firestore
    //calling our usermodel
    //sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = _auth.currentUser;

    Usermodel usermodel = Usermodel();

    // writing all the values
    usermodel.email = user!.email;
    usermodel.uid = user.uid;
    usermodel.username = _usernameController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(usermodel.toMap());

    Fluttertoast.showToast(msg: 'Account created Successfully ');
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => SignInScreen())));
  }

  DateTime date1 = DateTime(2000, 02, 13);
  int gender = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
                width: double.infinity, height: 80, child: userFormField()),
            Container(
                width: double.infinity, height: 80, child: emailFormField()),
            Container(
                width: double.infinity, height: 80, child: passwordFormField()),
            Container(
                width: double.infinity,
                height: 80,
                child: confirmPasswordFormField()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Row(
                    children: [
                      Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black87),
                        value: 1,
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = 1;
                          });
                        },
                      ),
                      Text("Male"),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black87),
                        value: 2,
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = 2;
                          });
                        },
                      ),
                      Text("Female"),
                    ],
                  ),
                ),
              ],
            ),

            //date of birth
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DateContainer(
                  datevalue: '${date1.day}',
                ),
                DateContainer(
                  datevalue: '${date1.month}',
                ),
                DateContainer(
                  datevalue: '${date1.year}',
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            InkWell(
              onTap: () async {
                DateTime? datepicked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1930),
                    lastDate: DateTime(2024),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: Colors.black87,
                          ),
                        ),
                        child: child!,
                      );
                    });

                if (datepicked != null) {
                  //  print("Date Picked ${datepicked.day}-${datepicked.month}-${datepicked.year}");
                  setState(() {
                    date1 = datepicked;
                  });
                }
              },
              child: Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black87
                   
                    ),
                child: Center(
                    child: Text(
                  "Edit",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
           SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CustomButton(
              title: "Create Account",
              backgroundColor: primaryColor,
              forgroundColor: Colors.white,
              width: MediaQuery.of(context).size.width * 0.85,
              onPressed: () {
                signup(
                  _emailController.text,
                  _passwordController.text,
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.16,
            ),
            Text(
              'Already have an account?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  CustomScaleTransition(
                      nextPageUrl: SignInScreen.routeName,
                      nextPage:   SignInScreen())),
              child: const Text(
                "Login",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField userFormField() {
    return TextFormField(
      controller: _usernameController,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter your User name ");
        }

        return null;
      },
      onFieldSubmitted: (newuser) {
        passwordFocusNode.requestFocus();
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          labelText: "User",
          hintText: "Username",
          suffixIcon: Icon(Icons.person)),
    );
  }

  TextFormField emailFormField() {
    return TextFormField(
      controller: _emailController,
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
      // onSaved: (newEmail) {
      //   setState(() {
      //     email = newEmail;
      //   });
      // },
      // onChanged: (newEmail) {
      //   _emailFormFieldKey.currentState!.validate();
      // },
      onFieldSubmitted: (newEmail) {
        passwordFocusNode.requestFocus();
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          suffixIcon: Icon(Icons.email)),
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

  TextFormField passwordFormField() {
    return TextFormField(
      controller: _passwordController,
      focusNode: passwordFocusNode,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please Enter your Password ");
        }

        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Password (Min 6 Characters)");
        }
      },
      onSaved: (value) {
        _passwordController.text = value!;
      },
      // onChanged: (newPassword) {
      //   _passwordFormFieldKey.currentState!
      //       .validate(); // call passowrd field validator
      //   password = newPassword;
      // },
      // onFieldSubmitted: (newPassword) {
      //   confirmPasswordFocusNode.requestFocus();
      // },
      keyboardType: TextInputType.visiblePassword,
      obscureText: false,
      decoration: const InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          suffixIcon: Icon(Icons.lock)),
      // validator: (newPassword) {
      //   if (newPassword!.isEmpty) {
      //     return kPasswordNullError;
      //   } else if (newPassword.length < 8) {
      //     return kShortPasswordError;
      //   }
      //   return null;
      // },
    );
  }

  TextFormField confirmPasswordFormField() {
    return TextFormField(
      controller: _confirmpasswordController,
      focusNode: confirmPasswordFocusNode,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Enter Confirm Password';
        }
        if (_confirmpasswordController.text != _passwordController.text) {
          return "Password don't match";
        }
        return null;
      },
      onSaved: (value) {
        _confirmpasswordController.text = value!;
      },
      keyboardType: TextInputType.visiblePassword,
      obscureText: false,
      decoration: const InputDecoration(
          labelText: "Confirm Password",
          hintText: "Re-Enter your password",
          suffixIcon: Icon(Icons.lock)),
    );
  }

  @override
  void dispose() {
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }
}

class ScreenArgs {
  final String email;
  final String password;
  const ScreenArgs({required this.email, required this.password});
}
