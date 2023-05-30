import 'package:final_shop/view/home/widget/stars_rating.dart';
import 'package:flutter/material.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/size_config.dart';

// ignore: must_be_immutable
class ListMobileItem extends StatelessWidget {
  final String title;

  final String image;

  String? price;

  IconData? icon;
  final void Function() onTapIcon;

  ListMobileItem(
      {Key? key,
      required this.title,
      required this.image,
      this.price,
      this.icon,
      required this.onTapIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
      child: Container(
        width: SizeConfig.defaultSize! * 13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: SizeConfig.defaultSize! * 16,
                    child: Center(
                      child: Image.network(
                        image,
                        height: SizeConfig.defaultSize! * 20,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
                  child: CircleAvatar(
                      radius: 16,
                      backgroundColor: ColorManger.white,
                      child: InkWell(
                        onTap: onTapIcon,
                        child: Icon(
                          icon,
                          color: ColorManger.red,
                        ),
                      )),
                ),
              ],
            ),
            const StarsRating(itemSize: 30),
            Padding(
              padding: EdgeInsets.only(
                  top: SizeConfig.defaultSize! * 1,
                  left: SizeConfig.defaultSize! * 1),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: FontSize.s24,
                    fontWeight: FontWhightManager.bold,
                    color: ColorManger.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.defaultSize! * 1,
                left: SizeConfig.defaultSize! * 1,
                bottom: SizeConfig.defaultSize! * 1,
              ),
              child: Text(
                ' \$ $price',
                style: TextStyle(
                  fontSize: FontSize.s14,
                  color: ColorManger.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
