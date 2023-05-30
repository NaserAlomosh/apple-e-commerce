import 'dart:async';

import 'package:flutter/material.dart';

import '../onboarding/onboarding.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/constants.manager.dart';
import '../resources/size_config.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const OnboardingView()));
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManger.primary,
        body: Center(
          child: SizedBox(
            height: SizeConfig.defaultSize! * 20,
            width: SizeConfig.defaultSize! * 20,
            child: const Image(
              image: AssetImage(ImageAsset.splashLogo),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
