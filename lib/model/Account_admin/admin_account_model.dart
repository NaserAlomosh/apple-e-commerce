class AdminAccountModel {
  String? name;
  String? email;
  String? image;

  AdminAccountModel({this.name, this.email});
  AdminAccountModel.fromJosn(Map<String, dynamic> json) {
    name = json["userName"];
    email = json["email"];
    image = json["image"];
  }
}
