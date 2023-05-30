// ignore_for_file: file_names

class AccountModel {
  String? email;
  String? userName;
  String? image;
  String? uid;
  AccountModel({this.email, this.userName, this.image});
  AccountModel.fromJosn(Map<String, dynamic> json) {
    email = json["email"];
    userName = json["userName"];
    image = json["image"];
    uid = json["uid"];
  }
}
