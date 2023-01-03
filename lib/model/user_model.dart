class Usermodel { 
  String? uid;
  String? email;
  String? username;
  String? imageURL;
  String? gender;
  String? date1;
  
  Usermodel({
    this.uid,
    this.email,
    this.username,
    this.imageURL,
    this.gender,
    this.date1,
  });

  //receive data to server

  factory Usermodel.fromMap(map) {
    return Usermodel(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
      imageURL: map['imageurl'],
      gender: map['gender'],
      date1: map['date1'],
    );
  }
  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username':username,
      'imageurl':imageURL,
      'gender':gender,
      'date1':date1
    };
  }
}