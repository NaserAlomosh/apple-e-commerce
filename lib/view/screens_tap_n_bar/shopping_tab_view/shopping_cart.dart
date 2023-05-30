import 'dart:async';
import 'dart:developer';

import 'package:final_shop/main.dart';
import 'package:final_shop/view/resources/color_manager.dart';
import 'package:final_shop/view/resources/size_config.dart';
import 'package:final_shop/view/resources/strings_manager.dart';
import 'package:final_shop/view/resources/widget/custem_button.dart';
import 'package:final_shop/view/screens_tap_n_bar/shopping_tab_view/widget/custem_shopping_item.dart';
import 'package:final_shop/view_model/shoping_cart/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:snack/snack.dart';

import '../../../../../utils/translate/translate.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List orderList = [];
  bool placeOrder = false;
  int indexCubit = 0;
  int totalPrice = 0;

  @override
  void initState() {
    database.getAll().then((value) {
      setState(() {
        orderList = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(TranslationController());
    log(orderList.toString());
    return BlocProvider(
      create: (context) => ShopCartCubit(),
      child: BlocConsumer<ShopCartCubit, ShopCartState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: SizeConfig.defaultSize! * 60,
                child: ListView.builder(
                  itemBuilder: (contexta, index) {
                    if (placeOrder == true) {
                      log('PLACE ORDER111${database.getAll()}');
                      context.read<ShopCartCubit>().sendOrderData(
                            id: orderList[index]['id'].toString(),
                            image: orderList[index]['image'],
                            priceOrder: orderList[index]['price'],
                            title: orderList[index]['title'],
                          );
                      database
                          .deleteDatabase(id: orderList[index]['id'])
                          .then((value) {
                        database.getAll().then((valuee) {
                          setState(() {
                            orderList = valuee;
                          });
                        });
                      });
                    }

                    indexCubit = index;
                    log('TOTALPRICE $totalPrice');
                    return CustemShoppingCartItem(
                      onTapRemove: () {
                        database
                            .deleteDatabase(id: orderList[index]['id'])
                            .then((value) {
                          totalPrice =
                              totalPrice + int.parse(orderList[index]['price']);
                          database.getAll().then((value) {
                            setState(() {
                              orderList = value;
                            });
                          });
                        });
                      },
                      image: orderList[index]['image'],
                      title: orderList[index]['title'],
                      price: orderList[index]['price'],
                    );
                  },
                  itemCount: orderList.length,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.defaultSize! * 1),
                child: CustemButtom(
                  lable: AppString.order.tr,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  onTap: () {
                    if (orderList.isEmpty) {
                      confirmOrder(context);
                    } else {
                      _placeOrder(context);
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _placeOrder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppString.confirmation.tr),
          content: Text(
            AppString.desConfirm.tr,
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(
                AppString.no.tr,
                style: TextStyle(color: ColorManger.primary),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(
                AppString.yas.tr,
                style: TextStyle(color: ColorManger.primary),
              ),
              onPressed: () {
                setState(() {
                  placeOrder = true;
                });
                const snackBar = SnackBar(
                  content: Text('request sent is done'),
                  backgroundColor: Colors.green,
                );
                snackBar.show(context);

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> confirmOrder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppString.note.tr),
          content: Text(
            AppString.youDoNotHaveOrdersInTheShoppingCart.tr,
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(
                AppString.ok.tr,
                style: TextStyle(color: ColorManger.primary),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
