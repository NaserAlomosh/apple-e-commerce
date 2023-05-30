import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:final_shop/view_model/search/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/search/search_model.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitState());
  List<SearchModel> dataAll = [];
  List<SearchModel> disDataAll = [];

  getSearchData() {
    getMobileData();
    getIpadData();
    getDataAxssores();
  }

  getDataAxssores({List<SearchModel>? axssores}) {
    FirebaseFirestore.instance.collection("axssores").get().then((value) {
      for (var element in value.docs) {
        dataAll.add(SearchModel.fromJosn(element.data()));
      }
      log('DATAALL[] $dataAll');
      emit(SearchSuccessState());
      disDataAll = List.from(dataAll);
    }).catchError((onError) {
      log('DATA1[] DONT GET DATA');
    });
  }

  getIpadData({List<SearchModel>? dataIpad}) {
    FirebaseFirestore.instance.collection("ipad").get().then((value) {
      for (var element in value.docs) {
        dataAll.add(SearchModel.fromJosn(element.data()));
      }

      log('DATAALL[] $dataAll');
      emit(SearchSuccessState());
      disDataAll = List.from(dataAll);
    }).catchError((onError) {
      log('DATA1[] DONT GET DATA');
    });
  }

  getMobileData({List<SearchModel>? dataMobile}) {
    FirebaseFirestore.instance.collection("mobile").get().then((value) {
      for (var element in value.docs) {
        dataAll.add(SearchModel.fromJosn(element.data()));
      }
      log('DATAALL[] $dataAll');
      emit(SearchSuccessState());
      disDataAll = List.from(dataAll);
    }).catchError((onError) {
      log('DATA0[] DONT GET DATA');
    });
  }
}
