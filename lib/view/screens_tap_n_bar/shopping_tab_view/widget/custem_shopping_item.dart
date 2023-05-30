import 'package:final_shop/view/resources/color_manager.dart';
import 'package:final_shop/view/resources/font_manager.dart';
import 'package:final_shop/view/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/translate/translate.dart';

class CustemShoppingCartItem extends StatelessWidget {
  final String image;

  final String title;

  final String price;

  final void Function() onTapRemove;

  const CustemShoppingCartItem(
      {Key? key,
      required this.image,
      required this.title,
      required this.price,
      required this.onTapRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TranslationController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Container(
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(fit: BoxFit.fill, image: NetworkImage(image)),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: FontSize.s16),
            ),
            Text(
              '\$$price',
              style: const TextStyle(fontSize: FontSize.s12),
            ),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: onTapRemove,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: ColorManger.primary,
          ),
          child: Text(
            AppString.remove.tr,
          ),
        ),
      ),
    );
  }
}



    // Padding(
    //               padding: EdgeInsets.only(right: SizeConfig.defaultSize! * 12),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.only(left: 8),
    //                     child: Text(
    //                       title,
    //                       style: const TextStyle(fontSize: FontSize.s16),
    //                     ),
    //                   ),
    //                   const StarsRating(),
    //                   Padding(
    //                     padding: const EdgeInsets.only(left: 8),
    //                     child: Text(AppString.ratethisProduct.tr,
    //                         style: const TextStyle(fontSize: FontSize.s12)),
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.only(left: 8),
    //                     child: Text(description,
    //                         style: const TextStyle(fontSize: FontSize.s12)),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             const Icon(Icons.arrow_forward_ios),