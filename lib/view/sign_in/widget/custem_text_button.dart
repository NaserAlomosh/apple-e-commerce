import 'package:final_shop/view/resources/font_manager.dart';
import 'package:flutter/cupertino.dart';

import '../../resources/color_manager.dart';

class CustemTextButton extends StatelessWidget {
  final String text;

  final void Function() onTap;

  const CustemTextButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: ColorManger.primary,
            fontFamily: FontConstants.fontFamily,
            fontWeight: FontWhightManager.regular,
          ),
        ));
  }
}
