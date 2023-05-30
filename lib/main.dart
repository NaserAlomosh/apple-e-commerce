import 'dart:developer';

import 'package:final_shop/serivcis/bloc_s.dart';
import 'package:final_shop/serivcis/db.dart';
import 'package:final_shop/utils/translate/cotraller_lang.dart';
import 'package:final_shop/utils/translate/translate.dart';
import 'package:final_shop/view/home/main_home_page.dart';
import 'package:final_shop/view/splash/splash_view.dart';

import 'package:final_shop/view_model/theme/cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

bool? isSignin;
var database = DatabaseHelper();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await database.initDatabase();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  Bloc.observer = MyBlocObserver();
  if (user == null) {
    database.getAll().then((value) {
      log(value.toString());
    });

    isSignin = false;
  } else {
    isSignin = true;
  }
  runApp(
    Builder(
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ThemeCubit()),
          ],
          child: const MyApp(),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TranslationController());
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: true);

    return GetMaterialApp(
      translations: MyLocale(),
      locale: Get.deviceLocale,
      darkTheme: theme.isDark ? ThemeData.dark() : ThemeData.light(),
      themeMode: theme.isDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: theme.isDark ? ThemeData.dark() : ThemeData.light(),
      home: isSignin == false ? const SplashView() : const MainHomeView(),
    );
  }
}
