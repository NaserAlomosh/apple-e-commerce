import 'dart:developer';

import 'package:final_shop/view_model/sign_in/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninCubit extends Cubit<SigninStates> {
  String? uid;
  SigninCubit() : super(SigninInitState());
  Future<void> signInUser({String? email, String? password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(SigninLoadingState());
    try {
      if (email != '' && password != '') {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: email!,
          password: password!,
        )
            .then((value) {
          uid = FirebaseAuth.instance.currentUser!.uid.toString();
          prefs.setString('uid', uid!);
          emit(SigninSuccessState());
        });
      } else {
        emit(SigninEmailErrorState());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SigninErrorState());
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        emit(SigninErrorState());
        log('Wrong password provided for that user.');
      }
    }
  }
}
