import 'package:final_shop/view/onboarding/widget/page_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

class CustemPageView extends StatelessWidget {
  final PageController? pageController;

  const CustemPageView({Key? key, required this.pageController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          image: ImageAsset.onBoardingImage1,
          title: AppString.onBorderTitel1.tr,
          subTitle: AppString.onBorderSubTitel1.tr,
        ),
        PageViewItem(
          image: ImageAsset.onBoardingImage2,
          title: AppString.onBorderTitel2.tr,
          subTitle: AppString.onBorderSubTitel2.tr,
        ),
        PageViewItem(
          image: ImageAsset.onBoardingImage3,
          title: AppString.onBorderTitel3.tr,
          subTitle: AppString.onBorderSubTitel3.tr,
        ),
        PageViewItem(
          image: ImageAsset.onBoardingImage4,
          title: AppString.onBorderTitel4.tr,
          subTitle: AppString.onBorderSubTitel4.tr,
        ),
      ],
    );
  }
}
