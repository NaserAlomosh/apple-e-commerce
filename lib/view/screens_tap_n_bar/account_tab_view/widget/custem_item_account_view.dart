import 'package:final_shop/view/resources/color_manager.dart';
import 'package:final_shop/view/resources/font_manager.dart';
import 'package:flutter/material.dart';

class CusteItemAccountView extends StatelessWidget {
  final IconData? icon;
  final void Function() onTap;
  final String label;

  const CusteItemAccountView(
      {Key? key, this.icon, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 0.5,
        bottom: 0.5,
      ),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: Icon(
            icon,
            size: 30,
            color: ColorManger.primary,
          ),
          title: Text(
            label,
            style: const TextStyle(
                fontSize: FontSize.s20, fontFamily: FontConstants.fontFamily),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
        ),
      ),
    );
  }
}
