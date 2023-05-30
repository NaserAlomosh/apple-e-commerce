import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_shop/model/home/home_model.dart';
import 'package:final_shop/view_model/home/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());
  List<HomeModel> mobile = [];
  List<HomeModel> ipad = [];
  List<HomeModel> axssores = [];

  getData() {
    getMobileData(dataMobile: mobile);
    getIpadData(dataIpad: ipad);
    getDataAxssores(axssores: axssores);
  }

  getDataAxssores({List<HomeModel>? axssores}) {
    FirebaseFirestore.instance.collection("axssores").get().then((value) {
      for (var element in value.docs) {
        axssores!.add(HomeModel.fromJosn(element.data()));
      }
      emit(HomeSuccessState());
    }).catchError((onError) {
      log('DATA1[] DONT GET DATA');
    });
  }

  getIpadData({List<HomeModel>? dataIpad}) {
    FirebaseFirestore.instance.collection("ipad").get().then((value) {
      for (var element in value.docs) {
        dataIpad!.add(HomeModel.fromJosn(element.data()));
      }
      emit(HomeSuccessState());
    }).catchError((onError) {
      log('DATA1[] DONT GET DATA');
    });
  }

  getMobileData({List<HomeModel>? dataMobile}) {
    FirebaseFirestore.instance.collection("mobile").get().then((value) {
      for (var element in value.docs) {
        dataMobile!.add(HomeModel.fromJosn(element.data()));
      }
      emit(HomeSuccessState());
    }).catchError((onError) {
      log('DATA0[] DONT GET DATA');
    });
  }
}
