import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_shop/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'state.dart';

class ShopCartCubit extends Cubit<ShopCartState> {
  String? uid;
  String? location;
  SharedPreferences? prefs;
  ShopCartCubit() : super(ShopCartInitial());

  order({String? image, String? priceOrder, String? title}) async {
    getLocation();
    sendOrderData(id: uid, image: image, priceOrder: priceOrder, title: title);
  }

  sendOrderData(
      {String? id, String? image, String? priceOrder, String? title}) async {
    prefs = await SharedPreferences.getInstance();
    uid = prefs!.getString('uid').toString();
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('orders')
        .doc()
        .set({
      "image": image,
      "location": location,
      "priceOrder": priceOrder,
      "title": title
    }).then((value) {
      log("image : $image location: $location id: $id");
    }).catchError((onError) {
      log('SEND DATA ERROR');
    });
  }

  getLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then(
      (value) {
        location = '${value.latitude} : ${value.longitude}';
      },
    );
  }

  deleteOrderData({int? id}) {
    database.deleteDatabase(id: id);
  }
}
