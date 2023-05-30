class HomeModel {
  String? title;
  String? image;
  String? price;
  String? decoration;
  HomeModel({this.title, this.image, this.price});
  HomeModel.fromJosn(Map<String, dynamic> json) {
    image = json["image"];
    price = json["price"];
    title = json["title"];
    decoration = json["decoration"];
  }
}
