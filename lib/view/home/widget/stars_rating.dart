import 'package:final_shop/view/resources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarsRating extends StatelessWidget {
  final double itemSize;

  const StarsRating({Key? key, required this.itemSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: SizeConfig.defaultSize! * 0.5),
      child: RatingBar.builder(
        itemSize: itemSize,
        initialRating: 3,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: const EdgeInsets.all(2),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          // print(rating);
        },
      ),
    );
  }
}
