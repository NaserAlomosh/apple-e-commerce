import 'package:final_shop/view/resources/color_manager.dart';
import 'package:final_shop/view/resources/font_manager.dart';
import 'package:final_shop/view/resources/size_config.dart';
import 'package:final_shop/view/resources/strings_manager.dart';
import 'package:final_shop/view/screens_tap_n_bar/home_tab_view/widget/button_tab_bar.dart';
import 'package:final_shop/view_model/home/cubit.dart';
import 'package:final_shop/view_model/home/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../utils/translate/translate.dart';
import '../../detals_screen/detals_view.dart';
import '../../home/widget/list_builder_item.dart';
import '../../home/widget/list_mobile_item.dart';

// ignore: must_be_immutable
class HomeTabView extends StatefulWidget {
  HomeTabView({Key? key}) : super(key: key);
  String? label;
  String? image;
  String? price;
  String? decoration;
  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  bool iconFavorite0 = true;
  bool iconFavorite1 = true;
  @override
  Widget build(BuildContext context) {
    Get.put(TranslationController());
    return ButtonTabBar(
      allProdect: SafeArea(
        child: BlocProvider(
            create: (context) => HomeCubit()..getData(),
            child: BlocConsumer<HomeCubit, HomeStates>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: SizeConfig.defaultSize! * 1,
                                    top: SizeConfig.defaultSize! * 2,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            AppString.allMobiles.tr,
                                            style: const TextStyle(
                                                fontSize: FontSize.s18,
                                                fontWeight:
                                                    FontWhightManager.medium),
                                          ),
                                          SizedBox(
                                              width:
                                                  SizeConfig.defaultSize! * 3),
                                          Text(
                                            '(20% off)',
                                            style: TextStyle(
                                              color: ColorManger.primary,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                          height: SizeConfig.defaultSize! * 1),
                                      Text(AppString.madeinApple.tr),
                                      SizedBox(
                                          height:
                                              SizeConfig.defaultSize! * 0.1),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: SizeConfig.defaultSize! * 28,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (x) => DetalsView(
                                                      decoration: context
                                                          .read<HomeCubit>()
                                                          .mobile[index]
                                                          .decoration
                                                          .toString(),
                                                      price: context
                                                          .read<HomeCubit>()
                                                          .mobile[index]
                                                          .price
                                                          .toString(),
                                                      label: context
                                                          .read<HomeCubit>()
                                                          .mobile[index]
                                                          .title
                                                          .toString(),
                                                      image: context
                                                          .read<HomeCubit>()
                                                          .mobile[index]
                                                          .image
                                                          .toString(),
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: ListBuilderItem(
                                                image: context
                                                    .read<HomeCubit>()
                                                    .mobile[index]
                                                    .image
                                                    .toString(),
                                                title: context
                                                    .read<HomeCubit>()
                                                    .mobile[index]
                                                    .title
                                                    .toString(),
                                                price: context
                                                    .read<HomeCubit>()
                                                    .mobile[index]
                                                    .price
                                                    .toString(),
                                                icon: iconFavorite0
                                                    ? Icons.favorite_border
                                                    : Icons.favorite,
                                                onTapIcon: favouriteSwich0,
                                              ),
                                            );
                                          },
                                          itemCount: context
                                              .read<HomeCubit>()
                                              .mobile
                                              .length,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: SizeConfig.defaultSize! * 1,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  AppString.allIpad.tr,
                                                  style: const TextStyle(
                                                      fontSize: FontSize.s18,
                                                      fontWeight:
                                                          FontWhightManager
                                                              .medium),
                                                ),
                                                SizedBox(
                                                    width: SizeConfig
                                                            .defaultSize! *
                                                        3),
                                                Text(
                                                  '(20% off)',
                                                  style: TextStyle(
                                                    color: ColorManger.primary,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                                height:
                                                    SizeConfig.defaultSize! *
                                                        1),
                                            Text(AppString.madeinApple.tr),
                                            SizedBox(
                                                height:
                                                    SizeConfig.defaultSize! *
                                                        0.1),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 270,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                widget.decoration = context
                                                    .read<HomeCubit>()
                                                    .ipad[index]
                                                    .decoration
                                                    .toString();
                                                widget.price = context
                                                    .read<HomeCubit>()
                                                    .ipad[index]
                                                    .price
                                                    .toString();
                                                widget.label = context
                                                    .read<HomeCubit>()
                                                    .ipad[index]
                                                    .title
                                                    .toString();
                                                widget.image = context
                                                    .read<HomeCubit>()
                                                    .ipad[index]
                                                    .image
                                                    .toString();
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (c) => DetalsView(
                                                      decoration: widget
                                                          .decoration
                                                          .toString(),
                                                      price: widget.price
                                                          .toString(),
                                                      label: widget.label
                                                          .toString(),
                                                      image: widget.image
                                                          .toString(),
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: ListBuilderItem(
                                                image: context
                                                    .read<HomeCubit>()
                                                    .ipad[index]
                                                    .image!
                                                    .toString(),
                                                title: context
                                                    .read<HomeCubit>()
                                                    .ipad[index]
                                                    .title!
                                                    .toString(),
                                                price: context
                                                    .read<HomeCubit>()
                                                    .ipad[index]
                                                    .price!
                                                    .toString(),
                                                icon: iconFavorite1
                                                    ? Icons.favorite_border
                                                    : Icons.favorite,
                                                onTapIcon: favouriteSwich1,
                                              ),
                                            );
                                          },
                                          itemCount: context
                                              .read<HomeCubit>()
                                              .ipad
                                              .length,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: SizeConfig.defaultSize! * 1,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  AppString.allAxssores.tr,
                                                  style: const TextStyle(
                                                      fontSize: FontSize.s18,
                                                      fontWeight:
                                                          FontWhightManager
                                                              .medium),
                                                ),
                                                SizedBox(
                                                    width: SizeConfig
                                                            .defaultSize! *
                                                        3),
                                                Text(
                                                  '(20% off)',
                                                  style: TextStyle(
                                                    color: ColorManger.primary,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                                height:
                                                    SizeConfig.defaultSize! *
                                                        1),
                                            Text(AppString.madeinApple.tr),
                                            SizedBox(
                                                height:
                                                    SizeConfig.defaultSize! *
                                                        0.1),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 270,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (x) => DetalsView(
                                                      decoration: context
                                                          .read<HomeCubit>()
                                                          .axssores[index]
                                                          .decoration
                                                          .toString(),
                                                      price: context
                                                          .read<HomeCubit>()
                                                          .axssores[index]
                                                          .price
                                                          .toString(),
                                                      label: context
                                                          .read<HomeCubit>()
                                                          .axssores[index]
                                                          .title
                                                          .toString(),
                                                      image: context
                                                          .read<HomeCubit>()
                                                          .axssores[index]
                                                          .image
                                                          .toString(),
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: ListBuilderItem(
                                                image: context
                                                    .read<HomeCubit>()
                                                    .axssores[index]
                                                    .image!
                                                    .toString(),
                                                title: context
                                                    .read<HomeCubit>()
                                                    .axssores[index]
                                                    .title!
                                                    .toString(),
                                                price: context
                                                    .read<HomeCubit>()
                                                    .axssores[index]
                                                    .price!
                                                    .toString(),
                                                icon: iconFavorite1
                                                    ? Icons.favorite_border
                                                    : Icons.favorite,
                                                onTapIcon: favouriteSwich1,
                                              ),
                                            );
                                          },
                                          itemCount: context
                                              .read<HomeCubit>()
                                              .axssores
                                              .length,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }
              },
            )),
      ),
      mobileView: SafeArea(
        child: BlocProvider(
            create: (context) => HomeCubit()..getData(),
            child: BlocConsumer<HomeCubit, HomeStates>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: SizeConfig.defaultSize! * 1,
                                    top: SizeConfig.defaultSize! * 2,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            AppString.allMobiles.tr,
                                            style: const TextStyle(
                                                fontSize: FontSize.s18,
                                                fontWeight:
                                                    FontWhightManager.medium),
                                          ),
                                          SizedBox(
                                              width:
                                                  SizeConfig.defaultSize! * 3),
                                          Text(
                                            '(20% off)',
                                            style: TextStyle(
                                              color: ColorManger.primary,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                          height: SizeConfig.defaultSize! * 1),
                                      Text(AppString.madeinApple.tr),
                                      SizedBox(
                                          height:
                                              SizeConfig.defaultSize! * 0.1),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: SizeConfig.defaultSize! * 58,
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                widget.image = context
                                                    .read<HomeCubit>()
                                                    .mobile[index]
                                                    .image
                                                    .toString();
                                                widget.decoration = context
                                                    .read<HomeCubit>()
                                                    .mobile[index]
                                                    .decoration
                                                    .toString();
                                                widget.label = context
                                                    .read<HomeCubit>()
                                                    .mobile[index]
                                                    .title
                                                    .toString();
                                                widget.price = context
                                                    .read<HomeCubit>()
                                                    .ipad[index]
                                                    .price
                                                    .toString();
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (c) => DetalsView(
                                                      decoration:
                                                          widget.decoration!,
                                                      price: widget.price!,
                                                      label: widget.label!,
                                                      image: widget.image!,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: ListMobileItem(
                                                image: context
                                                    .read<HomeCubit>()
                                                    .mobile[index]
                                                    .image
                                                    .toString(),
                                                title: context
                                                    .read<HomeCubit>()
                                                    .mobile[index]
                                                    .title
                                                    .toString(),
                                                price: context
                                                    .read<HomeCubit>()
                                                    .mobile[index]
                                                    .price
                                                    .toString(),
                                                icon: iconFavorite0
                                                    ? Icons.favorite_border
                                                    : Icons.favorite,
                                                onTapIcon: favouriteSwich0,
                                              ),
                                            );
                                          },
                                          itemCount: context
                                              .read<HomeCubit>()
                                              .mobile
                                              .length,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }
              },
            )),
      ),
      ipadView: SafeArea(
        child: BlocProvider(
            create: (context) => HomeCubit()..getData(),
            child: BlocConsumer<HomeCubit, HomeStates>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: SizeConfig.defaultSize! * 1,
                                    top: SizeConfig.defaultSize! * 2,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            AppString.allIpad.tr,
                                            style: const TextStyle(
                                                fontSize: FontSize.s18,
                                                fontWeight:
                                                    FontWhightManager.medium),
                                          ),
                                          SizedBox(
                                              width:
                                                  SizeConfig.defaultSize! * 3),
                                          Text(
                                            '(20% off)',
                                            style: TextStyle(
                                              color: ColorManger.primary,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                          height: SizeConfig.defaultSize! * 1),
                                      Text(AppString.madeinApple.tr),
                                      SizedBox(
                                          height:
                                              SizeConfig.defaultSize! * 0.1),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: SizeConfig.defaultSize! * 58,
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                widget.image = context
                                                    .read<HomeCubit>()
                                                    .ipad[index]
                                                    .image
                                                    .toString();
                                                widget.decoration = context
                                                    .read<HomeCubit>()
                                                    .ipad[index]
                                                    .decoration
                                                    .toString();
                                                widget.label = context
                                                    .read<HomeCubit>()
                                                    .ipad[index]
                                                    .title
                                                    .toString();
                                                widget.price = context
                                                    .read<HomeCubit>()
                                                    .ipad[index]
                                                    .price
                                                    .toString();
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetalsView(
                                                      decoration:
                                                          widget.decoration!,
                                                      price: widget.price!,
                                                      label: widget.label!,
                                                      image: widget.image!,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: ListMobileItem(
                                                image: context
                                                    .read<HomeCubit>()
                                                    .ipad[index]
                                                    .image
                                                    .toString(),
                                                title: context
                                                    .read<HomeCubit>()
                                                    .ipad[index]
                                                    .title
                                                    .toString(),
                                                price: context
                                                    .read<HomeCubit>()
                                                    .ipad[index]
                                                    .price
                                                    .toString(),
                                                icon: iconFavorite0
                                                    ? Icons.favorite_border
                                                    : Icons.favorite,
                                                onTapIcon: favouriteSwich0,
                                              ),
                                            );
                                          },
                                          itemCount: context
                                              .read<HomeCubit>()
                                              .ipad
                                              .length,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }
              },
            )),
      ),
      accessoriesView: SafeArea(
        child: BlocProvider(
            create: (context) => HomeCubit()..getData(),
            child: BlocConsumer<HomeCubit, HomeStates>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: SizeConfig.defaultSize! * 1,
                                    top: SizeConfig.defaultSize! * 2,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            AppString.axssores.tr,
                                            style: const TextStyle(
                                                fontSize: FontSize.s18,
                                                fontWeight:
                                                    FontWhightManager.medium),
                                          ),
                                          SizedBox(
                                              width:
                                                  SizeConfig.defaultSize! * 3),
                                          Text(
                                            '(20% off)',
                                            style: TextStyle(
                                              color: ColorManger.primary,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                          height: SizeConfig.defaultSize! * 1),
                                      Text(AppString.madeinApple.tr),
                                      SizedBox(
                                          height:
                                              SizeConfig.defaultSize! * 0.1),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: SizeConfig.defaultSize! * 58,
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                widget.image = context
                                                    .read<HomeCubit>()
                                                    .axssores[index]
                                                    .image
                                                    .toString();
                                                widget.decoration = context
                                                    .read<HomeCubit>()
                                                    .axssores[index]
                                                    .decoration
                                                    .toString();
                                                widget.label = context
                                                    .read<HomeCubit>()
                                                    .axssores[index]
                                                    .title
                                                    .toString();
                                                widget.price = context
                                                    .read<HomeCubit>()
                                                    .axssores[index]
                                                    .price
                                                    .toString();
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (c) => DetalsView(
                                                      decoration:
                                                          widget.decoration!,
                                                      price: widget.price!,
                                                      label: widget.label!,
                                                      image: widget.image!,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: ListMobileItem(
                                                image: context
                                                    .read<HomeCubit>()
                                                    .axssores[index]
                                                    .image
                                                    .toString(),
                                                title: context
                                                    .read<HomeCubit>()
                                                    .axssores[index]
                                                    .title
                                                    .toString(),
                                                price: context
                                                    .read<HomeCubit>()
                                                    .axssores[index]
                                                    .price
                                                    .toString(),
                                                icon: iconFavorite0
                                                    ? Icons.favorite_border
                                                    : Icons.favorite,
                                                onTapIcon: favouriteSwich0,
                                              ),
                                            );
                                          },
                                          itemCount: context
                                              .read<HomeCubit>()
                                              .axssores
                                              .length,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }
              },
            )),
      ),
    );
  }

  void favouriteSwich0() {
    setState(() {
      iconFavorite0 = !iconFavorite0;
    });
  }

  void favouriteSwich1() {
    setState(() {
      iconFavorite1 = !iconFavorite1;
    });
  }
}
