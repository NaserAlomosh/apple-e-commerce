import 'package:final_shop/view/resources/font_manager.dart';
import 'package:final_shop/view/resources/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  final String title;

  final String subTitle;

  final String image;

  const PageViewItem(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.defaultSize! * 15),
        Text(
          title,
          style: const TextStyle(
            fontSize: FontSize.s18,
            fontWeight: FontWhightManager.bold,
            fontFamily: FontConstants.fontFamily,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 8),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: subTitle,
                    style: const TextStyle(
                      fontWeight: FontWhightManager.medium,
                      fontSize: FontSize.s18,
                      fontFamily: FontConstants.fontFamily,
                    ),
                  ),
                ]),
          ),
        ),
        SizedBox(height: SizeConfig.defaultSize! * 5),
        SizedBox(
          height: SizeConfig.defaultSize! * 25,
          child: Image.asset(image),
        ),
      ],
    );
  }
}
