import 'package:final_shop/view/resources/assets_manager.dart';
import 'package:final_shop/view/resources/color_manager.dart';
import 'package:final_shop/view/resources/font_manager.dart';
import 'package:final_shop/view/resources/size_config.dart';
import 'package:final_shop/view/resources/strings_manager.dart';
import 'package:final_shop/view/resources/widget/custem_button.dart';
import 'package:final_shop/view/sign_in/widget/custem_password_textFiald.dart';
import 'package:final_shop/view/sign_in/widget/custem_text_button.dart';
import 'package:final_shop/view/sign_in/widget/custem_text_fiald.dart';
import 'package:final_shop/view_model/sign_in/cubit.dart';
import 'package:final_shop/view_model/sign_in/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:snack/snack.dart';

import '../home/main_home_page.dart';
import '../sign_up/sign_up.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool iconSee = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ColorManger.primary,
            centerTitle: true,
            title: Text(
              AppString.welcomeToSignInPage.tr,
              style: const TextStyle(
                  fontSize: FontSize.s20, fontWeight: FontWhightManager.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(height: SizeConfig.defaultSize! * 1),
                    SizedBox(height: SizeConfig.defaultSize! * 2),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 16,
                      child: Image.asset(ImageAsset.signInLoge),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.defaultSize! * 1),
                CustemTextField(
                  icon: Icons.email_outlined,
                  lable: AppString.email.tr,
                  hint: AppString.emailHint.tr,
                  controller: emailController,
                ),
                SizedBox(height: SizeConfig.defaultSize! * 2),
                PasswordTextFiald(
                    controller: passwordController,
                    iconSee: iconSee,
                    onTap: () {
                      setState(() {
                        iconSee = !iconSee;
                      });
                    }),
                SizedBox(
                  height: SizeConfig.defaultSize! * 6,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: SizeConfig.defaultSize! * 1,
                    left: SizeConfig.defaultSize! * 1,
                  ),
                  child: BlocConsumer<SigninCubit, SigninStates>(
                    listener: (context, state) {
                      if (state is SigninErrorState) {
                        SnackBar snackBar = SnackBar(
                          content: Text(AppString.checkYourEmailOrPassword.tr),
                          backgroundColor: Colors.red,
                        );
                        return snackBar.show(context);
                      } else if (state is SigninEmailErrorState) {
                        SnackBar snackBar = SnackBar(
                          content:
                              Text(AppString.emailAndPasswordIsRequired.tr),
                          backgroundColor: Colors.red,
                        );
                        return snackBar.show(context);
                      } else if (state is SigninSuccessState) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const MainHomeView()),
                            (Route<dynamic> route) => false);
                      }
                    },
                    builder: (context, state) {
                      if (state is SigninLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return CustemButtom(
                            lable: AppString.signIn.tr,
                            fontSize: FontSize.s20,
                            fontWeight: FontWhightManager.bold,
                            onTap: () {
                              context.read<SigninCubit>().signInUser(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                            });
                      }
                    },
                  ),
                ),
                SizedBox(height: SizeConfig.defaultSize! * 2),
                Padding(
                  padding: EdgeInsets.only(
                    right: SizeConfig.defaultSize! * 2,
                    left: SizeConfig.defaultSize! * 2,
                  ),
                  child: Column(
                    children: [
                      CustemTextButton(
                          text: AppString.signUp.tr,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignUpView()));
                          }),
                      const SizedBox(height: 10),
                      CustemTextButton(
                        text: AppString.forgetPassword.tr,
                        onTap: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
