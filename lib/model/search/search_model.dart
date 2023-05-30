class SearchModel {
  String? title;
  String? image;
  String? price;
  String? decoration;
  SearchModel({this.title, this.image, this.price});
  SearchModel.fromJosn(Map<String, dynamic> json) {
    image = json["image"];
    price = json["price"];
    title = json["title"];
    decoration = json["decoration"];
  }
}
