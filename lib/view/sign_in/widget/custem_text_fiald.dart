import 'package:final_shop/view/resources/color_manager.dart';
import 'package:final_shop/view/resources/font_manager.dart';
import 'package:final_shop/view/resources/values_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustemTextField extends StatelessWidget {
  final String lable;

  final String hint;
  final IconData icon;
  final TextEditingController controller;

  TextInputType keyboardType;

  bool obscureText;
  CustemTextField(
      {Key? key,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      required this.lable,
      required this.hint,
      required this.controller,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppSize.s12, left: AppSize.s12),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lable,
              style: const TextStyle(
                fontSize: FontSize.s16,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWhightManager.medium,
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              style: TextStyle(color: ColorManger.black), //<-- SEE HERE
              cursorColor: ColorManger.primary,
              keyboardType: keyboardType,
              obscureText: obscureText,

              controller: controller,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  icon,
                  color: ColorManger.primary,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 3, color: ColorManger.greyShad), //<-- SEE HERE
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorManger.primary)),
                hintText: hint,
                hintStyle: TextStyle(
                  color: ColorManger.darkGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
