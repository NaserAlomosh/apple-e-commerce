import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:final_shop/view/resources/color_manager.dart';
import 'package:final_shop/view/resources/size_config.dart';
import 'package:final_shop/view/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonTabBar extends StatelessWidget {
  final Widget allProdect;

  final Widget mobileView;

  final Widget ipadView;

  final Widget accessoriesView;

  const ButtonTabBar(
      {Key? key,
      required this.allProdect,
      required this.mobileView,
      required this.ipadView,
      required this.accessoriesView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.defaultSize! * 2),
                backgroundColor: ColorManger.primary,
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                tabs: [
                  Tab(text: AppString.all.tr),
                  Tab(text: AppString.mobile.tr),
                  Tab(text: AppString.ipad.tr),
                  Tab(text: AppString.axssores.tr),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    allProdect,
                    mobileView,
                    ipadView,
                    accessoriesView,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
