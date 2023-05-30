// ignore_for_file: file_names
import 'package:final_shop/view/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';

class PasswordTextFiald extends StatelessWidget {
  final TextEditingController controller;

  final bool iconSee;

  final void Function() onTap;

  const PasswordTextFiald(
      {Key? key,
      required this.controller,
      required this.iconSee,
      required this.onTap})
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
              AppString.password.tr,
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
              keyboardType: TextInputType.visiblePassword,

              obscureText: !iconSee,

              controller: controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: onTap,
                  icon: const Icon(Icons.remove_red_eye_outlined),
                  color:
                      iconSee ? ColorManger.red : IconTheme.of(context).color,
                ),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: ColorManger.primary,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 3, color: ColorManger.greyShad), //<-- SEE HERE
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorManger.primary)),
                hintText: AppString.passwordHint.tr,
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
