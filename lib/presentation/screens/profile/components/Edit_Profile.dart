
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sun_bright/data/models/user.dart';
import 'package:sun_bright/model/user_model.dart';
import 'package:sun_bright/presentation/screens/profile/components/Customtextfield.dart';
import 'package:sun_bright/presentation/screens/profile/components/DateContainer.dart';
import 'package:firebase_storage/firebase_storage.dart' as fstorage;

class EditProfileScreen extends StatefulWidget {
  // const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

 String imageURL = "";

  Usermodel loggedInUser = Usermodel();
  String name = "";
  var user = FirebaseAuth.instance.currentUser;
  // FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController user_name = TextEditingController();

  // TextEditingController email = TextEditingController();

  void get() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var getname = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    setState(() {
      name = getname.data()!['username'];
    });
  }

  void pickUploadImage() async{
    //  String fileName = DateTime.now().microsecondsSinceEpoch.toString();
    //  fstorage.Reference reference = fstorage.FirebaseStorage.instance.ref().child("userImages").child(fileName): 
    //  fstorage.UploadTask uploadTask = reference.putFile(File(ima)
    //  fstorage.Tasl

    final image = await ImagePicker().pickImage(
    source: ImageSource.gallery,
    maxWidth:512,
    maxHeight: 512,
    imageQuality: 75, );

    Reference ref = FirebaseStorage.instance.ref().child('profilepic.jpg');

//upload image 
    await ref.putFile(File(image!.path));

//image url
    ref.getDownloadURL().then((value) {
      print(value);
      setState(() {
        imageURL = value;
      });
    });

  }

  @override
  void initState() {
    super.initState();
    get();
    // FirebaseFirestore.instance
    //     .collection("users")
    //     .doc(user!.uid)
    //     .get()
    //     .then((value) {
    //   this.loggedInUser = Usermodel.fromMap(value.data());
    //   setState(() {});
    // });
  }

  DateTime date1 = DateTime(2000, 02, 13);
  int gender = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
        ),
        title: const Text(
          'Edit Profile',
          textAlign: TextAlign.justify,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Center(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [ 

                      Container(
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          // shape: BoxShape.circle, 
    
                        ),
                        child: Center(
                          child: imageURL == " " ? Icon(Icons.person,size:80,color: Colors.black) :Image.network(imageURL) ,
                        )
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade800),
                      ),
                    ],
                  ),
                   Positioned(
                      right: 10,
                      bottom: 45,
                      child: InkWell(
                        onTap:() {
                          pickUploadImage();
                        },
                        child: CircleAvatar(
                          maxRadius: 18,
                          child: Icon(
                            Icons.edit,
                            size: 22,
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomTextfield(
                    controller_value: user_name,
                    text_label: 'Username',
                    icon1: const Icon(
                      Icons.person_outline,
                      color: Colors.black87,
                      size: 20,
                    ),
                    obscure_text: false,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  // CustomTextfield(
                  //   text_label: 'Email',
                  //   icon1: Icon(
                  //     Icons.email_outlined,
                  //     color: Colors.black87,
                  //     size: 20,
                  //   ),
                  //   obscure_text: false,
                  // ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  // CustomTextfield(
                  //   text_label: 'Password',
                  //   icon1: Icon(
                  //     Icons.key,
                  //     color: Colors.black87,
                  //     size: 20,
                  //   ),
                  //   obscure_text: true,
                  // ),
                  // SizedBox(
                  //   height: size.height * 0.03,
                  // ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "Gender",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
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
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date of Birth",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                          height: size.height * 0.02,
                        ),
                        InkWell(
                          onTap: () async {
                            DateTime? datepicked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1930),
                                lastDate: DateTime(2023),
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
                                // gradient: LinearGradient(
                                //   colors: [Color(0xff7a71ad), Color(0xffaea8dd)],
                                // ),
                                ),
                            child: Center(
                                child: Text(
                              "Edit",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            final docuser = FirebaseFirestore.instance
                                .collection('users')
                                .doc(user!.uid);

                            // update specific fields
                            docuser.update({'username': user_name.text});
                          },
                          child: Center(
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.black87),
                              child: Center(
                                  child: Text(
                                'Submit',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
