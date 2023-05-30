import 'dart:io';

import 'package:final_shop/view_model/sign_up/cubit.dart';
import 'package:final_shop/view_model/sign_up/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snack/snack.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/size_config.dart';
import '../resources/strings_manager.dart';
import '../resources/widget/custem_button.dart';
import '../sign_in/signin_view.dart';
import '../sign_in/widget/custem_password_textFiald.dart';
import '../sign_in/widget/custem_text_button.dart';
import '../sign_in/widget/custem_text_fiald.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  File? newImagePicker;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  bool iconSee = false;
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    userController.dispose();
    phoneController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => SignUpCubit(),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              AppString.welcomeToSignupPage.tr,
              style: const TextStyle(
                  fontSize: FontSize.s20, fontWeight: FontWhightManager.bold),
            ),
            backgroundColor: ColorManger.primary,
          ),
          body: SingleChildScrollView(
            child: BlocConsumer<SignUpCubit, SignUpStates>(
              listener: (context, state) {
                if (state is SignUpSuccessState) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const LoginView()),
                      (Route<dynamic> route) => false);
                } else if (state is SignUpEmailErrorState) {
                  SnackBar snackBar = SnackBar(
                    content:
                        Text(AppString.theAccountAlreadyExistsForThatEmail.tr),
                    backgroundColor: Colors.red,
                  );
                  return snackBar.show(context);
                } else if (state is SignUpErrorPassworState) {
                  SnackBar snackBar = SnackBar(
                    content: Text(AppString.passwordLessThan6Characters.tr),
                    backgroundColor: Colors.red,
                  );
                  return snackBar.show(context);
                }
              },
              builder: (context, state) {
                if (state is SignUpLoadingState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: SizeConfig.defaultSize! * 40),
                      Row(
                        children: [
                          SizedBox(width: SizeConfig.defaultSize! * 18),
                          const CircularProgressIndicator(),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      SizedBox(height: SizeConfig.defaultSize! * 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: SizedBox(
                            height: SizeConfig.defaultSize! * 16,
                            child: Image.asset(ImageAsset.signUpLoge)),
                      ),
                      SizedBox(height: SizeConfig.defaultSize! * 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppString.userName.tr,
                                  style: const TextStyle(
                                    fontSize: FontSize.s16,
                                    fontFamily: FontConstants.fontFamily,
                                    fontWeight: FontWhightManager.medium,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: SizeConfig.defaultSize! * 19,
                                  child: TextField(
                                    keyboardType: TextInputType.name,
                                    style: TextStyle(color: ColorManger.black),
                                    cursorColor: ColorManger.primary,
                                    controller: userController,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: ColorManger.primary,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 3,
                                          color: ColorManger.black,
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: ColorManger.primary,
                                        ),
                                      ),
                                      hintText: AppString.enterYourName.tr,
                                      hintStyle: TextStyle(
                                        color: ColorManger.darkGrey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppString.phoneNumber.tr,
                                  style: const TextStyle(
                                    fontSize: FontSize.s16,
                                    fontFamily: FontConstants.fontFamily,
                                    fontWeight: FontWhightManager.medium,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: SizeConfig.defaultSize! * 19,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                      color: ColorManger.black,
                                    ),
                                    cursorColor: ColorManger.primary,
                                    controller: phoneController,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.phone,
                                        color: ColorManger.primary,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3,
                                            color: ColorManger
                                                .black), //<-- SEE HERE
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: ColorManger.primary,
                                        ),
                                      ),
                                      hintText:
                                          AppString.enterYourPhoneNumper.tr,
                                      hintStyle: TextStyle(
                                        color: ColorManger.darkGrey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.defaultSize! * 2),
                      GestureDetector(
                        onTap: () {
                          context.read<SignUpCubit>().selectDateTime(context);
                        },
                        child: AbsorbPointer(
                          child: CustemTextField(
                            icon: Icons.date_range_outlined,
                            lable: AppString.date.tr,
                            hint: '${context.read<SignUpCubit>().selectDate}',
                            controller: dateController,
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.defaultSize! * 2),
                      CustemTextField(
                        keyboardType: TextInputType.emailAddress,
                        icon: Icons.email_outlined,
                        lable: AppString.email.tr,
                        hint: AppString.emailHint.tr,
                        controller: emailcontroller,
                      ),
                      SizedBox(height: SizeConfig.defaultSize! * 2),
                      PasswordTextFiald(
                          controller: passwordcontroller,
                          iconSee: iconSee,
                          onTap: () {
                            setState(() {
                              iconSee = !iconSee;
                            });
                          }),
                      SizedBox(height: SizeConfig.defaultSize! * 3),
                      Padding(
                        padding: EdgeInsets.only(
                          right: SizeConfig.defaultSize! * 1,
                          left: SizeConfig.defaultSize! * 1,
                        ),
                        child: CustemButtom(
                            lable: AppString.signUp.tr,
                            fontSize: FontSize.s20,
                            fontWeight: FontWhightManager.bold,
                            onTap: () {
                              if (emailcontroller.text.trim() != '' &&
                                  passwordcontroller.text.trim() != '' &&
                                  userController.text.trim() != '' &&
                                  phoneController.text.trim() != '') {
                                context.read<SignUpCubit>().signUpUser(
                                      email: emailcontroller.text.trim(),
                                      date: context
                                          .read<SignUpCubit>()
                                          .selectDate
                                          .toString(),
                                      password: passwordcontroller.text.trim(),
                                      userName: userController.text.trim(),
                                      phone: phoneController.text.trim(),
                                    );
                              } else {
                                var snackBar = SnackBar(
                                    duration: const Duration(seconds: 1),
                                    content: Text(AppString
                                        .aRequiredFieldOrGroupOfFields.tr),
                                    backgroundColor: Colors.red);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            }),
                      ),
                      SizedBox(height: SizeConfig.defaultSize! * 2),
                      CustemTextButton(
                        text: AppString.signIn.tr,
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const LoginView()),
                              (Route<dynamic> route) => false);
                        },
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

  void getImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      newImagePicker = File(image!.path);
    });
  }
}
