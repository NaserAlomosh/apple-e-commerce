import 'package:final_shop/view/resources/color_manager.dart';
import 'package:final_shop/view/resources/font_manager.dart';
import 'package:final_shop/view/resources/strings_manager.dart';
import 'package:final_shop/view/resources/widget/custem_button.dart';
import 'package:final_shop/view_model/ruta_us/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:snack/snack.dart';

import '../../../../../../../view_model/ruta_us/state.dart';

class RutaUsView extends StatefulWidget {
  const RutaUsView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RutaUsViewState createState() => _RutaUsViewState();
}

class _RutaUsViewState extends State<RutaUsView> {
  late double _rating;

  final int _ratingBarMode = 1;
  final double _initialRating = 3.0;
  final bool _isRTLMode = false;
  final bool _isVertical = false;

  IconData? _selectedIcon;

  @override
  void initState() {
    super.initState();
    _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RutaUsCubit(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(AppString.performanceRating.tr),
            backgroundColor: ColorManger.primary,
          ),
          body: Directionality(
            textDirection: _isRTLMode ? TextDirection.rtl : TextDirection.ltr,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    AppString.ratingBar.tr,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWhightManager.medium,
                    ),
                  ),
                  _ratingBar(_ratingBarMode),
                  const SizedBox(height: 20.0),
                  Text(
                    '${AppString.rating.tr}: $_rating',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  BlocConsumer<RutaUsCubit, RutaUstState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is RutaUstLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child: CustemButtom(
                            lable: AppString.sendRuta.tr,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            onTap: () {
                              context
                                  .read<RutaUsCubit>()
                                  .sendRutaUs(ruta: _rating);
                              var snackBarEN = SnackBar(
                                  content: const Text(
                                      '${AppString.sendRuta} is done'),
                                  backgroundColor: ColorManger.green);
                              snackBarEN.show(context);
                            },
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _ratingBar(int mode) {
    switch (mode) {
      case 1:
        return RatingBar.builder(
          initialRating: _initialRating,
          minRating: 1,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          allowHalfRating: true,
          unratedColor: Colors.amber.withAlpha(50),
          itemCount: 5,
          itemSize: 50.0,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            _selectedIcon ?? Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
      case 2:
        return RatingBar(
          initialRating: _initialRating,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          ratingWidget: RatingWidget(
            full: _image('assets/heart.png'),
            half: _image('assets/heart_half.png'),
            empty: _image('assets/heart_border.png'),
          ),
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
      case 3:
        return RatingBar.builder(
          initialRating: _initialRating,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return const Icon(
                  Icons.sentiment_very_dissatisfied,
                  color: Colors.red,
                );
              case 1:
                return const Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.redAccent,
                );
              case 2:
                return const Icon(
                  Icons.sentiment_neutral,
                  color: Colors.amber,
                );
              case 3:
                return const Icon(
                  Icons.sentiment_satisfied,
                  color: Colors.lightGreen,
                );
              case 4:
                return const Icon(
                  Icons.sentiment_very_satisfied,
                  color: Colors.green,
                );
              default:
                return Container();
            }
          },
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
      default:
        return Container();
    }
  }

  Widget _image(String asset) {
    return Image.asset(
      asset,
      height: 30.0,
      width: 30.0,
      color: Colors.amber,
    );
  }
}
