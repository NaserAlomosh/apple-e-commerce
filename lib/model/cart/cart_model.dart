class CartModel {
  String? title;
  String? image;
  String? price;
  CartModel({this.title, this.image, this.price});
  CartModel.fromJosn(Map<String, dynamic> json) {
    title = json["title"];
    image = json["image"];
    price = json["price"];
  }
}
