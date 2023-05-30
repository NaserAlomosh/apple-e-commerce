import 'dart:developer';
import 'dart:io';

import 'package:final_shop/view_model/add_image/state.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddImageCubit extends Cubit<AddImageState> {
  AddImageCubit() : super(AddImageStateInitial());
  XFile? image;
  bool isPic = false;
  Future<void> imagePick() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    isPic = true;
    emit(AddImageUpdateStateInitial());
  }

  void saveImage() {
    log('VVVVVVVVVVVVVVVVVVVVVVVV');
    FirebaseStorage.instance
        .ref()
        .child("images/${Uri.file(image!.path).pathSegments.last}")
        .putFile(File(image!.path))
        .then((p0) {
      p0.ref.getDownloadURL().then((value) {});
    });
  }
}
