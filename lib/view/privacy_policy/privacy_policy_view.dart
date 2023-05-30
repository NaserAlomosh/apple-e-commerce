import 'package:final_shop/view/resources/color_manager.dart';
import 'package:final_shop/view/resources/font_manager.dart';
import 'package:final_shop/view/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppString.privacyPolicy.tr,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWhightManager.bold,
                  ),
                ),
                const SizedBox(height: 6),
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: AppString.privacyPolicyDescription.tr,
                        style: TextStyle(
                            color: ColorManger.black, fontSize: FontSize.s18)),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
