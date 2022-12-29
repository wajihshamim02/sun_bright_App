class Usermodel {
  String? uid;
  String? email;
  // String? nickname;

  Usermodel({this.uid, this.email,
  //  this.nickname
   });

  //receive data to server

  factory Usermodel.fromMap(map) {
    return Usermodel(
      uid: map['uid'],
      email: map['email'],
      // nickname: map['nickname']
      );
  }
  //sending data to server
  Map<String,dynamic> toMap(){
    return {
      'uid':uid,
      'email':email,
      // 'nickname':nickname,
    };

  } 
}
