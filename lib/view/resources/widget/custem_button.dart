import 'package:final_shop/view/resources/color_manager.dart';
import 'package:final_shop/view/resources/font_manager.dart';
import 'package:final_shop/view/resources/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustemButtom extends StatelessWidget {
  final String lable;

  final dynamic fontFamily;

  final double fontSize;

  final FontWeight fontWeight;

  final void Function() onTap;

  const CustemButtom(
      {Key? key,
      required this.lable,
      this.fontFamily,
      required this.fontSize,
      required this.fontWeight,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(FontSize.s12),
          color: ColorManger.primary,
        ),
        child: Center(
          child: Text(
            lable,
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
              color: ColorManger.white,
            ),
          ),
        ),
      ),
    );
  }
}
