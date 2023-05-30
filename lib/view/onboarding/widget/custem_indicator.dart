import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';

class CustemIndicator extends StatelessWidget {
  final double? doteIndex;

  const CustemIndicator({Key? key, required this.doteIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 4,
      decorator: DotsDecorator(
        color: ColorManger.white,
        activeColor: ColorManger.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: ColorManger.primary),
        ),
      ),
      position: (.5 * doteIndex!).round(),
    );
  }
}
