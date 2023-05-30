import 'package:final_shop/view/resources/color_manager.dart';
import 'package:final_shop/view/resources/font_manager.dart';
import 'package:final_shop/view/resources/strings_manager.dart';
import 'package:final_shop/view_model/account/cubit.dart';
import 'package:final_shop/view_model/account/state.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../help/help.dart';
import '../../history_page/history_view.dart';
import '../../privacy_policy/privacy_policy_view.dart';
import '../../resources/size_config.dart';
import '../../ruta_us/ruta_us_view.dart';

import '../../settings_page/settings_account.dart';
import '../../sign_in/signin_view.dart';
import 'widget/custem_item_account_view.dart';

class AccountTabView extends StatefulWidget {
  const AccountTabView({Key? key}) : super(key: key);

  @override
  State<AccountTabView> createState() => _AccountTabViewState();
}

class _AccountTabViewState extends State<AccountTabView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => AccountCubit()..getData(),
      child: BlocConsumer<AccountCubit, AccountStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AccountLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Scaffold(
              body: ListView(
                children: [
                  BlocConsumer<AccountCubit, AccountStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is AccountLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Column(
                          children: [
                            Container(
                              color: ColorManger.primary,
                              height: SizeConfig.defaultSize! * 20,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: CircleAvatar(
                                        backgroundColor: ColorManger.grey,
                                        radius: 60,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: context
                                                      .read<AccountCubit>()
                                                      .image ==
                                                  ""
                                              ? Center(
                                                  child: Text(
                                                    context
                                                        .read<AccountCubit>()
                                                        .firstCharName
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: SizeConfig
                                                                .defaultSize! *
                                                            7,
                                                        fontWeight:
                                                            FontWhightManager
                                                                .bold,
                                                        color:
                                                            ColorManger.white),
                                                  ),
                                                )
                                              : Image(
                                                  image: NetworkImage(
                                                    context
                                                        .read<AccountCubit>()
                                                        .image
                                                        .toString(),
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height: SizeConfig.defaultSize! * 1),
                                    Text(
                                      context
                                          .read<AccountCubit>()
                                          .name
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWhightManager.bold,
                                        color: ColorManger.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Divider(),
                            CusteItemAccountView(
                              label: AppString.purchaseHistory.tr,
                              icon: Icons.history,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HistoryView()),
                                );
                              },
                            ),
                            CusteItemAccountView(
                              label: AppString.settings.tr,
                              icon: Icons.settings,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SettingsView()),
                                );
                              },
                            ),
                            CusteItemAccountView(
                              label: AppString.rateUs.tr,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RutaUsView()),
                                );
                              },
                              icon: Icons.event_available_sharp,
                            ),
                            CusteItemAccountView(
                                label: AppString.privacyPolicy.tr,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PrivacyPolicyView()),
                                  );
                                },
                                icon: Icons.privacy_tip_outlined),
                            CusteItemAccountView(
                              label: AppString.help.tr,
                              icon: Icons.help_center_outlined,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HelpScreen()),
                                );
                              },
                            ),
                            CusteItemAccountView(
                              label: AppString.logOut.tr,
                              onTap: () async {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const LoginView()),
                                    (Route<dynamic> route) => false);
                                await FirebaseAuth.instance.signOut();
                              },
                              icon: Icons.logout,
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
