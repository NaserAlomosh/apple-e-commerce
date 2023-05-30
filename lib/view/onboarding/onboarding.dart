import 'package:final_shop/view/onboarding/widget/custem_indicator.dart';
import 'package:final_shop/view/onboarding/widget/page_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/size_config.dart';
import '../resources/strings_manager.dart';
import '../resources/widget/custem_button.dart';
import '../sign_in/signin_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController? pageController;
  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManger.white,
        body: Stack(
          children: [
            CustemPageView(pageController: pageController),
            Positioned(
              top: SizeConfig.defaultSize! * 8,
              right: 30,
              child: GestureDetector(
                onTap: () {
                  pageController?.nextPage(
                    curve: Curves.easeIn,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                  );
                },
                child: Visibility(
                  visible: pageController!.hasClients
                      ? pageController!.page! == 3
                          ? false
                          : true
                      : true,
                  child: Text(
                    AppString.skip.tr,
                    style: TextStyle(
                      color: ColorManger.primary,
                      fontWeight: FontWhightManager.bold,
                      fontFamily: FontConstants.fontFamily,
                      fontSize: FontSize.s16,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: SizeConfig.defaultSize! * 10,
              right: SizeConfig.defaultSize! * 10,
              bottom: SizeConfig.defaultSize! * 10,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustemIndicator(
                        doteIndex: pageController!.hasClients
                            ? pageController?.page
                            : 0),
                    SizedBox(height: SizeConfig.defaultSize! * 4),
                    CustemButtom(
                      onTap: () {
                        if (pageController!.page! < 3) {
                          pageController?.nextPage(
                            curve: Curves.easeIn,
                            duration: const Duration(
                              milliseconds: 500,
                            ),
                          );
                        } else {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const LoginView()),
                              (Route<dynamic> route) => false);
                        }
                      },
                      lable: pageController!.hasClients
                          ? pageController!.page == 3
                              ? AppString.getStarted.tr
                              : AppString.next.tr
                          : AppString.next.tr,
                      fontSize: FontSize.s22,
                      fontWeight: FontWhightManager.bold,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }
}
