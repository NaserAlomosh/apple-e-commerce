import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_shop/view_model/edit_information/state.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class EditInformationCubit extends Cubit<EditInformationState> {
  SharedPreferences? prefs;
  String? uid;
  String? name;
  String? email;
  String? phoneNumber;
  String? image = "";
  XFile? file;
  String? saveUrlImage;
  bool selectImage = false;
  File? imagePath;
  String? firstCharName;
  bool selected = false;

  EditInformationCubit() : super(EditInformationInitialState());
//  (Methode) Get All data (Username , Phone Number, Email, Image)
  getData() async {
    prefs = await SharedPreferences.getInstance();
    uid = prefs!.getString('uid').toString();

    getUserName();
    getUserEmail();
    getUserPhone();
    getUserImage();
  }

//
  getUserImage() {
    emit(EditInformationLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uid).get().then(
      (value) {
        image = value.get('image');
        emit(EditInformationSuccessState());
        log('IMAGE USER $image');
      },
    ).catchError((onError) {
      log('IMAGE USER ERROR');
    });
  }

//  (Methode) Get Phone Number
  getUserPhone() {
    emit(EditInformationLoadingState());
    //
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      phoneNumber = value.get('phone');
      emit(EditInformationSuccessState());
      //
      log('IMAGE$phoneNumber');
    }).catchError((onError) {
      log('Phone User ERROR');
    });
  }

//  (Methode) Get Username
  getUserName() {
    emit(EditInformationLoadingState());
    //
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      name = value.get('userName');
      firstChar();
      emit(EditInformationSuccessState());
      //
      log('USERNAME $name');
    }).catchError((onError) {
      log('USERNAME ERROR');
    });
  }

//  (Methode) Get Email
  getUserEmail() {
    emit(EditInformationLoadingState());
    //
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      email = value.get('email');
      emit(EditInformationSuccessState());
      //
      log('IIIIIIIIIIII$email');
    }).catchError((onError) {
      log('EMAIL USER ERROR');
    });
  }

//  (Methode) Update User updateUserInformation
  updateUserInformation({String? newName, String? newPhoneNumber}) {
    updateName(uid: uid, newName: newName);
    updatePhoneNumber(uid: uid, newPhoneNumber: newPhoneNumber);
  }

//  (Methode) Update Phone Number
  updatePhoneNumber({String? uid, String? newPhoneNumber}) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'phone': newPhoneNumber}).then((value) {
      log('UPDATE PHONE NUMBER SUCCESS');
    }).catchError((onError) {
      log('UPDATE PHONE NUMBER ERROR');
    });
  }

//  (Methode) Update Username
  updateName({String? uid, String? newName}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'userName': newName});
  }

//  (Methode) Select Image from (gallery)
  Future<void> getImagePicker() async {
    ImagePicker picker = ImagePicker();
    file = await picker.pickImage(source: ImageSource.gallery);
    //start upload
    if (file != null) {
      imagePath = File(file!.path);
      selectImage = true;
      var refStoreg = FirebaseStorage.instance.ref("images/$uid");
      emit(EditInformationLoadingState());
      await refStoreg.putFile(imagePath!);
      var url = await refStoreg.getDownloadURL();
      emit(EditInformationSuccessState());
      saveUrlImage = url;
      log('IMAGE PATH :$url');
      //Success
    }
  }

//  (Methode) Send Image from gallery to Firestore
  sendImageFirestore() async {
    emit(EditInformationLoadingState());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'image': saveUrlImage}).then((value) {
      emit(EditInformationSuccessState());
    }).catchError((onError) {
      log('updateImage ERROR');
    });
  }

//  (Methode) Remove Image From Firestore and update
  removeImageFirestore() async {
    emit(EditInformationLoadingState());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'image': ""}).then((value) {
      getUserImage();
      emit(EditInformationSuccessState());
    }).catchError((onError) {
      log('updateImage ERROR');
    });
  }

//  (Methode) Get First Char from (name)
  void firstChar() {
    emit(EditInformationLoadingState());
    firstCharName = name![0];
    capitalChar();
    emit(EditInformationSuccessState());
  }

//  (Methode) Get Capital Char from (name)
  void capitalChar() {
    firstCharName = firstCharName!.toUpperCase();
  }
}
