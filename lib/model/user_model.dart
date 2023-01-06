class Usermodel { 
  String? uid;
  String? email;
  String? username;
  String? imageUrl;
  String? gender;
  String? date1;
  
  Usermodel({
    this.uid,
    this.email,
    this.username,
    this.imageUrl,
    this.gender,
    this.date1,
  });

  //receive data to server

  factory Usermodel.fromMap(map) {
    return Usermodel(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
      imageUrl: map['imageUrl'],
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
      'imageUrl':imageUrl,
      'gender':gender,
      'date1':date1
    };
  }
}