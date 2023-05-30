import 'dart:developer';

import 'package:final_shop/main.dart';

import 'package:final_shop/view/resources/color_manager.dart';
import 'package:final_shop/view/resources/font_manager.dart';
import 'package:final_shop/view/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../utils/translate/translate.dart';
import '../../../view_model/theme/cubit.dart';
import '../resources/size_config.dart';
import '../screens_tap_n_bar/account_tab_view/account_tab_view.dart';
import '../screens_tap_n_bar/home_tab_view/home_tab_view.dart';
import '../screens_tap_n_bar/shopping_tab_view/shopping_cart.dart';
import '../search_item/search_item.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  int _selectedIndex = 0;
  int countCart = 0;
  static List<Widget> buildScreens = [
    HomeTabView(),
    const ShoppingCart(),
    const AccountTabView(),
  ];
  @override
  void initState() {
    database.getAll().then((value) {
      setState(() {
        countCart = value.length;
        log('%%%%%%%%%$countCart');
      });
    });
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      database.getAll().then((value) {
        setState(() {
          countCart = value.length;
          log('%%%%%%%%%$countCart');
        });
      });
    });
  }

  List<Widget> title = [
    Text(AppString.home.tr),
    Text(AppString.shoppingCart.tr),
    Text(AppString.account.tr),
  ];
  @override
  Widget build(BuildContext context) {
    Get.put(TranslationController());

    SizeConfig().init(context);
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Stack(children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchItem()),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ])
        ],
        titleTextStyle: const TextStyle(
            fontSize: FontSize.s24, fontWeight: FontWhightManager.bold),
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: ColorManger.primary),
        centerTitle: true,
        title: title[_selectedIndex],
        elevation: 0,
        backgroundColor: ColorManger.primary,
      ),
      body: buildScreens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor:
            theme.isDark ? ColorManger.white : ColorManger.grey1,
        selectedIconTheme: IconThemeData(color: ColorManger.primary),
        currentIndex: _selectedIndex,
        unselectedLabelStyle: TextStyle(color: ColorManger.white),
        selectedItemColor: ColorManger.primary,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedLabelStyle: const TextStyle(fontSize: 15),
        unselectedFontSize: 10,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
            ),
            label: (AppString.home.tr),
          ),
          BottomNavigationBarItem(
            icon: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('$countCart'),
              const Icon(Icons.shopping_cart_outlined),
            ]),
            label: (AppString.shoppingCart.tr),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: (AppString.account.tr),
          ),
        ],
      ),
    );
  }
}
