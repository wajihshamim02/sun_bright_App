import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sun_bright/data/models/user.dart';
import 'package:sun_bright/model/user_model.dart';
import 'package:sun_bright/presentation/screens/profile/components/Customtextfield.dart';
import 'package:sun_bright/presentation/screens/profile/components/DateContainer.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class EditProfileScreen extends StatefulWidget {
  // const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
   FirebaseAuth _auth = FirebaseAuth.instance;
  File? _image;
  final picker = ImagePicker();
  String imageUrl = "";
  DateTime date1 = DateTime(2000, 02, 13);
  String gender = "";
  String name = " Name is Loading";
  String email = "Email is loading";

  void get() async {
    TextEditingController _username;
    User? user = await FirebaseAuth.instance.currentUser;
    var getName = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get();

    setState(() {
      user_name = TextEditingController(text: getName.data()!['username']);
      email = getName.data()!['email'];
      name = getName.data()!['username'];
      gender = getName.data()!['gender'];
      date1 = getName.data()!['date1'];
    });

  }

  late TextEditingController user_name;

  pickImageFromGallery() async {
    XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print("no image picked");
    }
    File image = File(pickedFile!.path);

    setState(() {
      _image = imageUrl as File?;
    });
  }
  

  
  // postDetailToFirestore() async {
  //   //calling our firestore
  //   //calling our usermodel
  //   //sedning these values

  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  //   Usermodel usermodel = Usermodel();

  //   // writing all the values
  //   usermodel.email = user!.email;
  //   usermodel.uid = user!.uid;
  //   // usermodel.username = _usernameController.text;

  //   await firebaseFirestore
  //       .collection("users")
  //       .doc(user?.uid)
  //       .set(usermodel.toMap());

  //   // Fluttertoast.showToast(msg: 'Account created Successfully ');
  //   // Navigator.push(
  //   //     context, MaterialPageRoute(builder: ((context) => SignInScreen())));
  // }

  @override
  void initState() {
     user_name = TextEditingController();
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

  DateTime DOB = DateTime(2000, 02, 13);
  // String gender = "";
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
                            child:  _image == ""
                                ? Icon(Icons.person,
                                    size: 80, color: Colors.black)
                                : Image.network(imageUrl),
                          )),
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
                        onTap: () {
                          pickImageFromGallery();
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
                  SizedBox(
                    height: size.height * 0.03,
                  ),
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
                              value: "Male",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value!;
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
                              value: "Female",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value!;
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
                        const Text(
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
                              datevalue: '${DOB.day}',
                            ),
                            DateContainer(
                              datevalue: '${DOB.month}',
                            ),
                            DateContainer(
                              datevalue: '${DOB.year}',
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
                                DOB = datepicked;
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
                          height: 10,
                        ),
                        InkWell(
                          onTap: () async {

                            User? user =
                                await FirebaseAuth.instance.currentUser;

                            final docuser = FirebaseFirestore.instance
                                .collection('users')
                                .doc(user!.uid);

                            docuser.update({
                              'username': user_name.text,
                              'imageURL': imageUrl,
                              "DOB": DOB,
                              'gender': gender
                            });
                             
                            DateTime.now().millisecondsSinceEpoch.toString();
                            
                            firebase_storage.Reference ref = firebase_storage
                                .FirebaseStorage.instance
                                .ref('/UserProfileImage/' +
                                    DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString());
                            firebase_storage.UploadTask uploadTask =
                                ref.putFile(_image!.absolute);
                            await Future.value(uploadTask);
                            ref.getDownloadURL().then((value) {
                              setState(() {
                                imageUrl = value;
                              });
                            });
                            
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
