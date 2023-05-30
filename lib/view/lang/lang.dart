import 'package:final_shop/utils/translate/translate.dart';
import 'package:final_shop/view/resources/color_manager.dart';
import 'package:final_shop/view/resources/strings_manager.dart';
import 'package:final_shop/view/resources/widget/custem_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:snack/snack.dart';

import '../home/main_home_page.dart';

class LangView extends StatefulWidget {
  const LangView({Key? key}) : super(key: key);
  @override
  State<LangView> createState() => _LangViewState();
}

class _LangViewState extends State<LangView> {
  @override
  Widget build(BuildContext context) {
    var snackBarEN = SnackBar(
      content: const Text(AppString.theLanguageHasBeenChanged),
      backgroundColor: ColorManger.green,
    );
    var snackBarAR = SnackBar(
      content: const Text(AppStringAr.theLanguageHasBeenChanged),
      backgroundColor: ColorManger.green,
    );

    TranslationController controllerLang = Get.find();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustemButtom(
                lable: AppString.arabic.tr,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                onTap: () {
                  controllerLang.changeLang('ar');
                  snackBarAR.show(context);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const MainHomeView()),
                      (Route<dynamic> route) => false);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustemButtom(
                lable: AppString.english,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                onTap: () {
                  controllerLang.changeLang('en');
                  snackBarEN.show(context);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const MainHomeView()),
                      (Route<dynamic> route) => false);
                }),
          ),
        ],
      ),
    );
  }
}
