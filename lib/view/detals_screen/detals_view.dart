import 'dart:developer';

import 'package:final_shop/main.dart';
import 'package:final_shop/view/resources/color_manager.dart';
import 'package:final_shop/view/resources/size_config.dart';
import 'package:final_shop/view/resources/strings_manager.dart';
import 'package:final_shop/view/resources/widget/custem_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snack/snack.dart';

import '../resources/font_manager.dart';

class DetalsView extends StatelessWidget {
  final String image;

  final String label;

  final String price;

  final String decoration;
  const DetalsView(
      {Key? key,
      required this.image,
      required this.label,
      required this.price,
      required this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(AppString.details.tr),
            backgroundColor: ColorManger.primary,
            elevation: 0,
          ),
          body: Stack(
            children: [
              SizedBox(
                height: SizeConfig.defaultSize! * 77,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: SizeConfig.defaultSize! * 1,
                    left: SizeConfig.defaultSize! * 1,
                    top: SizeConfig.defaultSize! * 0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(image),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: SizeConfig.defaultSize! * 1),
                        child: Text(
                          label,
                          style: const TextStyle(
                              fontSize: FontSize.s28,
                              fontWeight: FontWhightManager.regular),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
                        child: Text(
                          decoration,
                          style: const TextStyle(
                              fontWeight: FontWhightManager.regular),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          '${AppString.price.tr}\$$price',
                          style: const TextStyle(
                              fontSize: FontSize.s16,
                              fontWeight: FontWhightManager.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: SizeConfig.defaultSize! * 1,
                left: SizeConfig.defaultSize! * 1,
                bottom: 5,
                child: CustemButtom(
                  lable: AppString.addToCart.tr,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  onTap: () async {
                    database.insertToDatabase(image, label, price).then((V) {
                      database.getAll().then((value) {
                        log(value.toString());
                      });
                    });
                    SnackBar snackBar = SnackBar(
                      content: Text(
                          AppString.theProductHasBeenSentToTheShoppingCart.tr),
                      backgroundColor: Colors.green,
                    );
                    snackBar.show(context);
                  },
                ),
              )
            ],
          )),
    );
  }
}
