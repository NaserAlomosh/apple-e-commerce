import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_shop/view_model/account/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountCubit extends Cubit<AccountStates> {
  String? name;
  String image = "";
  String? uid;
  String? email = '';
  String? phoneNumber = '';
  SharedPreferences? prefs;
  String? firstCharName;
  AccountCubit() : super(AccountInitState());

  getData() async {
    emit(AccountLoadingState());
    prefs = await SharedPreferences.getInstance();
    uid = prefs!.getString('uid').toString();

    getUserImage();
    getUserName();
    getUserEmail();
    getUserPhone();

    emit(AccountLoadingState());
  }

  getUserName() {
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      name = value.get('userName');
      firstChar();
      log('USERNAME $name');
    }).catchError((onError) {
      log('USERNAME ERROR');
    });
  }

  getUserPhone() {
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      phoneNumber = value.get('phone');

      log('IIIIIIIIIIII$name');
      log('IMAGE$image');
      log('IMAGE$phoneNumber');

      emit(AccountSuccessState());
    }).catchError((onError) {
      log('Phone User ERROR');
    });
  }

  getUserEmail() {
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      email = value.get('email');

      log('IIIIIIIIIIII$email');
    }).catchError((onError) {
      log('EMAIL USER ERROR');
    });
  }

  getUserImage() {
    emit(AccountLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uid).get().then(
      (value) {
        image = value.get('image');
        emit(AccountSuccessState());
        log('IMAGE USER $image');
      },
    ).catchError((onError) {
      log('IMAGE USER ERROR');
    });
  }

  void firstChar() {
    emit(AccountLoadingState());
    firstCharName = name![0];
    capitalChar();
    emit(AccountSuccessState());
  }

  void capitalChar() {
    firstCharName = firstCharName!.toUpperCase();
  }
  // updateUserPhoto() async {
  //   final ImagePicker picker = ImagePicker();
  //   newImage = await picker.pickImage(source: ImageSource.camera);
  // }
}
