import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_shop/view_model/sign_up/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  DateTime selectDate = DateTime.now();

  SignUpCubit() : super(SignUpInitState());
  String? name;
  Future<void> signUpUser({
    String? email,
    String? password,
    String? date,
    String? phone,
    String? userName,
    String? uid,
    String image = "",
  }) async {
    try {
      emit(SignUpLoadingState());
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      )
          .then((value) {
        uid = FirebaseAuth.instance.currentUser!.uid.toString();

        saveData(email, uid, date, phone, userName, image);
        emit(SignUpSuccessState());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpErrorPassworState());
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpEmailErrorState());
        log('The account already exists for that email.');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void saveData(
    String? email,
    String? uid,
    String? date,
    String? phone,
    String? userName,
    String? image,
  ) {
    emit(SignUpLoadingState());
    FirebaseFirestore.instance.collection("users").doc(uid.toString()).set({
      "email": email,
      "userName": userName,
      "date": date,
      "phone": phone,
      "uid": uid,
      "image": image,
    }).then((value) {
      log('DATA SAVED ID $uid');
      emit(SignUpSuccessState());
    }).catchError((onError) {
      log('ERROR DATA SAVED ID $uid');
      emit(SignUpErrorState());
    });
  }

  selectDateTime(BuildContext context) async {
    final DateTime? picker = await showDatePicker(
        context: context,
        initialDate: selectDate,
        firstDate: DateTime(1990),
        lastDate: DateTime(2100));
    if (picker != null) {
      selectDate = picker;
    }

    emit(SignUpPickerDateState());
  }
}
