import 'package:final_shop/view/resources/color_manager.dart';
import 'package:final_shop/view/resources/strings_manager.dart';
import 'package:final_shop/view_model/account/cubit.dart';
import 'package:final_shop/view_model/account/state.dart';
import 'package:final_shop/view_model/theme/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';

import '../lang/lang.dart';
import '../user_name_edit/username.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool? swich;
  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: false);

    return BlocProvider(
      create: (context) => AccountCubit()..getData(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppString.settings.tr),
            elevation: 0,
            backgroundColor: ColorManger.primary,
          ),
          body: BlocConsumer<AccountCubit, AccountStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return SettingsList(
                sections: [
                  SettingsSection(
                    title: Text(
                      AppString.application.tr,
                      style: TextStyle(color: ColorManger.primary),
                    ),
                    tiles: <SettingsTile>[
                      SettingsTile.navigation(
                        leading: const Icon(Icons.language),
                        title: Text(AppString.language.tr),
                        value: Text(AppString.english.tr),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                        onPressed: (_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LangView()),
                          );
                        },
                      ),
                      SettingsTile.switchTile(
                        onToggle: (v) {
                          setState(() {
                            swich = v;
                            theme.changeTheme();
                          });
                        },
                        initialValue: swich,
                        leading: const Icon(
                          Icons.format_paint,
                          size: 20,
                        ),
                        title: Text(AppString.changeTheme.tr),
                      ),
                    ],
                  ),
                  SettingsSection(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.account.tr,
                          style: TextStyle(color: ColorManger.primary),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (c) =>
                                          const UserNameSettings()));
                            },
                            child: Text(
                              AppString.edit.tr,
                              style: TextStyle(color: ColorManger.primary),
                            ))
                      ],
                    ),
                    tiles: <SettingsTile>[
                      SettingsTile.navigation(
                        onPressed: (_) {},
                        leading: const Icon(
                          Icons.person_outline,
                          size: 20,
                        ),
                        title: Text(AppString.userName.tr),
                        value:
                            Text(context.read<AccountCubit>().name.toString()),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      ),
                      SettingsTile.navigation(
                        leading: const Icon(Icons.email_outlined),
                        title: Text(AppString.email.tr),
                        value:
                            Text(context.read<AccountCubit>().email.toString()),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      ),
                      SettingsTile.navigation(
                        leading: const Icon(Icons.phone),
                        title: Text(AppString.phone.tr),
                        value: Text(context
                            .read<AccountCubit>()
                            .phoneNumber
                            .toString()),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
