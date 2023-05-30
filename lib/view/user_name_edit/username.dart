import 'dart:io';

import 'package:final_shop/view/resources/color_manager.dart';
import 'package:final_shop/view/resources/size_config.dart';
import 'package:final_shop/view/resources/strings_manager.dart';
import 'package:final_shop/view/resources/widget/custem_button.dart';
import 'package:final_shop/view_model/edit_information/cubit.dart';
import 'package:final_shop/view_model/edit_information/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:snack/snack.dart';

import '../home/main_home_page.dart';
import '../resources/font_manager.dart';

class UserNameSettings extends StatelessWidget {
  const UserNameSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => EditInformationCubit()..getData(),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ColorManger.primary,
            title: Text(
              AppString.editYourPersonalInformation.tr,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          body: SingleChildScrollView(
            child: BlocConsumer<EditInformationCubit, EditInformationState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is EditInformationLoadingState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: SizeConfig.defaultSize! * 40,
                      ),
                      Row(
                        children: [
                          SizedBox(width: SizeConfig.defaultSize! * 18),
                          const CircularProgressIndicator(),
                        ],
                      ),
                    ],
                  );
                } else {
                  TextEditingController? emailController =
                      TextEditingController(
                          text: context.read<EditInformationCubit>().email);
                  TextEditingController? usernameController =
                      TextEditingController(
                          text: context.read<EditInformationCubit>().name);
                  TextEditingController? phoneNumberController =
                      TextEditingController(
                          text:
                              context.read<EditInformationCubit>().phoneNumber);
                  return Column(
                    children: [
                      SizedBox(height: SizeConfig.defaultSize! * 5),
                      Stack(
                        children: [
                          context.read<EditInformationCubit>().selectImage
                              ? CircleAvatar(
                                  radius: SizeConfig.defaultSize! * 7,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.file(
                                      File(
                                        context
                                            .read<EditInformationCubit>()
                                            .file!
                                            .path,
                                      ),
                                    ),
                                  ),
                                )
                              : (context.read<EditInformationCubit>().image ==
                                      ""
                                  ? CircleAvatar(
                                      backgroundColor: ColorManger.grey,
                                      radius: SizeConfig.defaultSize! * 7,
                                      child: Center(
                                        child: Text(
                                          context
                                              .read<EditInformationCubit>()
                                              .firstCharName
                                              .toString(),
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.defaultSize! * 8,
                                              fontWeight:
                                                  FontWhightManager.bold,
                                              color: ColorManger.white),
                                        ),
                                      ),
                                    )
                                  : CircleAvatar(
                                      radius: SizeConfig.defaultSize! * 7,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image(
                                            image: NetworkImage(context
                                                .read<EditInformationCubit>()
                                                .image
                                                .toString())),
                                      ),
                                    )),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: ColorManger.primary,
                              child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<EditInformationCubit>()
                                        .getImagePicker();
                                  },
                                  icon: const Icon(Icons.add)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      InkWell(
                        onTap: () {
                          if (context.read<EditInformationCubit>().image !=
                              "") {
                            context
                                .read<EditInformationCubit>()
                                .removeImageFirestore();
                          }
                        },
                        child: Text(
                          AppString.remove.tr,
                          style: TextStyle(color: ColorManger.red),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppString.email.tr,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: SizeConfig.defaultSize! * 1),
                            AbsorbPointer(
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 2, 10, 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border:
                                        Border.all(color: ColorManger.primary)),
                                child: TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: context
                                        .read<EditInformationCubit>()
                                        .email,
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.defaultSize! * 1),
                            Text(
                              AppString.userName.tr,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: SizeConfig.defaultSize! * 1),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(color: ColorManger.primary)),
                              child: TextField(
                                controller: usernameController,
                                decoration: InputDecoration(
                                  hintText:
                                      context.read<EditInformationCubit>().name,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.defaultSize! * 1),
                            Text(
                              AppString.phoneNumber.tr,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: SizeConfig.defaultSize! * 1),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(color: ColorManger.primary)),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                controller: phoneNumberController,
                                decoration: InputDecoration(
                                  hintText: context
                                      .read<EditInformationCubit>()
                                      .phoneNumber,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.defaultSize! * 2),
                            CustemButtom(
                              lable: AppString.edit.tr,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              onTap: () {
                                context
                                    .read<EditInformationCubit>()
                                    .updateUserInformation(
                                      newName: usernameController.text,
                                      newPhoneNumber:
                                          phoneNumberController.text,
                                    );
                                if (context
                                        .read<EditInformationCubit>()
                                        .saveUrlImage !=
                                    null) {
                                  context
                                      .read<EditInformationCubit>()
                                      .sendImageFirestore();
                                }

                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MainHomeView()),
                                    (Route<dynamic> route) => false);
                                SnackBar snackBar = SnackBar(
                                  content: Text(AppString
                                      .yourInformationHasBeenUpdated.tr),
                                  backgroundColor: Colors.green,
                                );
                                return snackBar.show(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
