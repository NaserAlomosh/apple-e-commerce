class SignInModel {
  String? name;
  String? image;
  String? email;
  SignInModel({this.name, this.image, this.email});
  SignInModel.fromJosn(Map<String, dynamic> json) {
    name = json["userName"];
    image = json["image"];
    email = json["email"];
  }
}
