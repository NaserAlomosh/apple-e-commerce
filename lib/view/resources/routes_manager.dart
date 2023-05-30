// import 'package:final_shop/view/forgot_password/forgot_password_view.dart';
// import 'package:final_shop/view/sign_in/signin_view.dart';
// import 'package:final_shop/view/main/main_view.dart';

// import 'package:final_shop/view/onboarding/onboarding.dart';
// import 'package:final_shop/view/register/register_view.dart';
// import 'package:final_shop/view/resources/strings_manager.dart';
// import 'package:final_shop/view/sign_up/sign_up.dart';
// import 'package:final_shop/view/splash/splash_view.dart';
// import 'package:flutter/material.dart';

// class Routes {
//   static const String splashRoute = '/';
//   static const String onBoardingRoute = '/onBoarding';
//   static const String loginRoute = '/login';
//   static const String signupRoute = '/signup';
//   static const String registerRoute = '/register';
//   static const String forgotPasswordRoute = '/forgotPassword';
//   static const String mainRoute = '/main';
//   static const String storeDetailsRoute = '/sroreDetails';
// }

// class RouteGenerator {
//   static Route<dynamic> getRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.splashRoute:
//         return MaterialPageRoute(builder: ((_) => const SplashView()));
//       case Routes.onBoardingRoute:
//         return MaterialPageRoute(builder: ((_) => const OnboardingView()));
//       case Routes.loginRoute:
//         return MaterialPageRoute(builder: ((_) => const LoginView()));
//       case Routes.signupRoute:
//         return MaterialPageRoute(builder: ((_) => const SignUpView()));
//       case Routes.registerRoute:
//         return MaterialPageRoute(builder: ((_) => const RegisterView()));
//       case Routes.forgotPasswordRoute:
//         return MaterialPageRoute(builder: ((_) => const ForgotPasswordView()));
//       case Routes.mainRoute:
//         return MaterialPageRoute(builder: ((_) =>  MainView()));

//       default:
//         return unDefindRoute();
//     }
//   }

//   static Route<dynamic> unDefindRoute() {
//     return MaterialPageRoute(
//       builder: (context) => Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             AppString.unDefindRoute,
//           ),
//         ),
//         body: const Center(
//           child: Text(
//             AppString.unDefindRoute,
//           ),
//         ),
//       ),
//     );
//   }
// }
