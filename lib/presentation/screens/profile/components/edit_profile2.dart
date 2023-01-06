import 'dart:io';

// import 'package:booking_app/Edit%20Profile%20Screen/components/DateContainer.dart';
// import 'package:booking_app/settings.dart';
// import 'package:booking_app/user_model.dart';
// import 'package:booking_app/widgets/customTextfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:sun_bright/model/user_model.dart';
import 'package:sun_bright/presentation/screens/profile/components/Customtextfield.dart';
import 'package:sun_bright/presentation/screens/profile/components/DateContainer.dart';

class EditProfileScreen2 extends StatefulWidget {
  const EditProfileScreen2({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen2> {
  // TextEditingController genderr = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  File? _image;
  final picker = ImagePicker();
  String imageUrl = "";
  DateTime date1 = DateTime(2000, 02, 13);
  String gender = "";
  String name =   "Loading";
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
      imageUrl = getName.data()!['imageUrl'];
      // date1 = getName.data()!['date1'];
    });
    // setState(() {
      
    // });
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

  @override
  void initState() {
    user_name = TextEditingController();
    get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[Colors.black87, Colors.black])),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => SettingsScreens()));
          },
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
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 1),
                            // image: DecorationImage(
                            //     image: AssetImage(
                            //       'assets/images/wahaj.png',
                            //     ),
                            //     fit: BoxFit.cover),
                          ),
                          child: _image != null
                              ? Image.network(imageUrl)
                              : Center(
                                  child: Icon(Icons.person),
                                )),
                      SizedBox(
                        height: size.height * 0.02,
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
                  InkWell(
                    onTap: () {
                      pickImageFromGallery();
                    },
                    child: const Positioned(
                        left: 10,
                        bottom: 42,
                        child: CircleAvatar(
                          maxRadius: 18,
                          child: Icon(
                            Icons.edit,
                            size: 22,
                          ),
                        )),
                  )
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
                    text_label: 'Username',
                    icon1: const Icon(
                      Icons.person_outline,
                      color:Colors.black87,
                      size: 20,
                    ),
                    obscure_text: false,
                    controller_value: user_name,
                   
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  // CustomTextfield(
                  //   text_label: 'Password',
                  //   icon1: const Icon(
                  //     Icons.key,
                  //     color: Colors.black,
                  //     size: 20,
                  //   ),
                  //   obscure_text: true,
                  //   controller_value: password_controller,
                  //   onChanged_value: '',
                  //   validation_value: '',
                  // ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
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

                                  print(value);
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
                                  (states) =>Colors.black87),
                              value: "Female",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value!;
                                  print(value);
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                lastDate: DateTime(2024),
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.light(
                                        primary:Colors.black87,
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
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                colors: [Colors.black87,Colors.black],
                              ),
                            ),
                            child: const Center(
                                child: Text(
                              "Edit",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () async {
                            User? user =
                                await FirebaseAuth.instance.currentUser;

                            final docUser = FirebaseFirestore.instance
                                .collection('users')
                                .doc(user!.uid);

                            docUser.update({
                              'username': user_name.text,
                              'imageUrl': imageUrl,
                              'date1': date1,
                              'gender': gender,
                              // 'gender': gender == 1 ? "male" : "Female"
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
                            // ignore: use_build_context_synchronously
                            addInfoToFirebase();
                          },
                          child: Center(
                            child: Container(
                              width: 90,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  colors: [
                                   Colors.black87,
                                   Colors.black
                                  ],
                                ),
                              ),
                              child: const Center(
                                  child: Text(
                                "Submit",
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

  addInfoToFirebase() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = _auth.currentUser;

    Usermodel usermodel = Usermodel();

    // writing all the values
    usermodel.gender = gender;
    usermodel.imageUrl = imageUrl;
    usermodel.date1 = date1 as String;

    usermodel.username = user_name.text;
    // usermodel.username = user!.email;

    usermodel.uid = user!.uid;
    usermodel.email = user.email;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(usermodel.toMap());
  }
}