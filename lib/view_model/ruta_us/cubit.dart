import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_shop/view_model/ruta_us/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RutaUsCubit extends Cubit<RutaUstState> {
  String? uid;

  RutaUsCubit() : super(RutaUstInitial());

  sendRutaUs({
    double? ruta,
  }) async {
    emit(RutaUstLoading());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('uid').toString();
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('rute')
        .doc()
        .set({
      "ruta": ruta,
    }).then((value) {
      emit(RutaUsSuccess());
      log("RUTA : $ruta");
    }).catchError((onError) {
      log('SEND DATA ERROR');
    });
  }
}
