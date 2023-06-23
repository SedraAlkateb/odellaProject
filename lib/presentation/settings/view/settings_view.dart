import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/app/app_preferences.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/language_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';

import '../../../lang/locale_keys.g.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  AppPreferences _appPreferences=instance<AppPreferences>();
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.settings.tr(),
            style: Theme
                .of(context)
                .textTheme
                .labelLarge,
          ),
        ),
        body: SafeArea(
            child: orientation == Orientation.portrait
                ? ListView(
              children: [
                ListTile(
                  subtitle: Text(
                    LocaleKeys.changePassword.tr(),
                    style: TextStyle(color: ColorManager.sidBarIcon),
                  ),
                  title: Text(
                    LocaleKeys.changePassword.tr(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium,
                  ),
                  leading: Icon(
                    Icons.language,
                    color: ColorManager.sidBarIcon,
                  ),
                  onTap: () {
                    _changeLanguage();
                  },
                ),
                Divider(
                  color: ColorManager.sidBarIcon,
                  height: 15,
                ),
                ListTile(
                  subtitle: Text(
                    "resetpass",
                    style: TextStyle(color: ColorManager.sidBarIcon),
                  ),
                  title: Text(
                    "resetpass",
                    //style: Theme.of(context).textTheme.titleMedium,
                  ),
                  leading: Icon(
                    Icons.password,
                    color: ColorManager.sidBarIcon,
                  ),
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {});
                    Navigator.pushNamed(context, Routes.resetPasswordRoute);
                  },
                ),
                Divider(
                  color: ColorManager.sidBarIcon,
                  height: 15,
                ),

                // ListTile(
                //   subtitle: Text(
                //     StringsManager.inviteFriends,
                //     style: TextStyle(color: ColorManager.sidBarIcon),
                //   ),
                //   title: Text(
                //     StringsManager.changePassword,
                //     //style: Theme.of(context).textTheme.titleMedium,
                //   ),
                //   leading: Icon(
                //     Icons.language,
                //     color: ColorManager.sidBarIcon,
                //   ),
                //   onTap: () {
                //     WidgetsBinding.instance.addPostFrameCallback((_) {});
                //   },
                // ),

                // ListTile(
                //   subtitle: Text(
                //     "StringsManager.inviteFriends",
                //     style: TextStyle(color: ColorManager.sidBarIcon),
                //   ),
                //   title: Text(
                //     LocaleKeys.changePassword.tr(),
                //     //style: Theme.of(context).textTheme.titleMedium,
                //   ),
                //   leading: Icon(
                //     Icons.language,
                //     color: ColorManager.sidBarIcon,
                //   ),
                //   onTap: () {
                //     WidgetsBinding.instance.addPostFrameCallback((_) {});
                //   },
                // ),
                //
                // Divider(
                //   color: ColorManager.sidBarIcon,
                //   height: 15,
                // ),

                // ListTile(
                //   subtitle: Text(
                //     StringsManager.contactUs,
                //     style: TextStyle(color: ColorManager.sidBarIcon),
                //   ),
                //   title: Text(
                //     StringsManager.changePassword,
                //     //style: Theme.of(context).textTheme.titleMedium,
                //   ),
                //   leading: Icon(
                //     Icons.language,
                //     color: ColorManager.sidBarIcon,
                //   ),
                //   onTap: () {
                //     WidgetsBinding.instance.addPostFrameCallback((_) {});
                //   },
                // ),

                ListTile(
                  subtitle: Text(
                    "contactus",
                    style: TextStyle(color: ColorManager.sidBarIcon),
                  ),
                  title: Text(
                    "contactus",
                    //style: Theme.of(context).textTheme.titleMedium,
                  ),
                  leading: Icon(
                    Icons.language,
                    color: ColorManager.sidBarIcon,
                  ),
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {});
                  },
                ),

                Divider(
                  color: ColorManager.sidBarIcon,
                  height: 15,
                ),

                //     ListTile(
                //         title: Text(StringsManager.signOut),
                //         leading: Icon(
                //           Icons.logout,
                //           color: ColorManager.sidBarIcon,
                //         ),
                //         onTap: () async {}),
                //   ],
                // )

                //     ListTile(
                //         title: Text(LocaleKeys.signOut.tr()),
                //         leading: Icon(
                //           Icons.logout,
                //           color: ColorManager.sidBarIcon,
                //         ),
                //         onTap: () async {}),
                //   ],
                // )
              ], )
                :ListView(
              children: [
                ListTile(
                  subtitle: Text(
                    LocaleKeys.changePassword.tr(),
                    style: TextStyle(color: ColorManager.sidBarIcon),
                  ),
                  title: Text(
                    LocaleKeys.changePassword.tr(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium,
                  ),
                  leading: Icon(
                    Icons.language,
                    color: ColorManager.sidBarIcon,
                  ),
                  onTap: () {
                    _changeLanguage();
                  },
                ),
                Divider(
                  color: ColorManager.sidBarIcon,
                  height: 15,
                ),
                ListTile(
                  subtitle: Text(
                    "resetpass",
                    style: TextStyle(color: ColorManager.sidBarIcon),
                  ),
                  title: Text(
                    "resetpass",
                    //style: Theme.of(context).textTheme.titleMedium,
                  ),
                  leading: Icon(
                    Icons.password,
                    color: ColorManager.sidBarIcon,
                  ),
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {});
                    Navigator.pushNamed(context, Routes.resetPasswordRoute);
                  },
                ),
                Divider(
                  color: ColorManager.sidBarIcon,
                  height: 15,
                ),

                // ListTile(
                //   subtitle: Text(
                //     StringsManager.inviteFriends,
                //     style: TextStyle(color: ColorManager.sidBarIcon),
                //   ),
                //   title: Text(
                //     StringsManager.changePassword,
                //     //style: Theme.of(context).textTheme.titleMedium,
                //   ),
                //   leading: Icon(
                //     Icons.language,
                //     color: ColorManager.sidBarIcon,
                //   ),
                //   onTap: () {
                //     WidgetsBinding.instance.addPostFrameCallback((_) {});
                //   },
                // ),

                // ListTile(
                //   subtitle: Text(
                //     "StringsManager.inviteFriends",
                //     style: TextStyle(color: ColorManager.sidBarIcon),
                //   ),
                //   title: Text(
                //     LocaleKeys.changePassword.tr(),
                //     //style: Theme.of(context).textTheme.titleMedium,
                //   ),
                //   leading: Icon(
                //     Icons.language,
                //     color: ColorManager.sidBarIcon,
                //   ),
                //   onTap: () {
                //     WidgetsBinding.instance.addPostFrameCallback((_) {});
                //   },
                // ),
                //
                // Divider(
                //   color: ColorManager.sidBarIcon,
                //   height: 15,
                // ),

                // ListTile(
                //   subtitle: Text(
                //     StringsManager.contactUs,
                //     style: TextStyle(color: ColorManager.sidBarIcon),
                //   ),
                //   title: Text(
                //     StringsManager.changePassword,
                //     //style: Theme.of(context).textTheme.titleMedium,
                //   ),
                //   leading: Icon(
                //     Icons.language,
                //     color: ColorManager.sidBarIcon,
                //   ),
                //   onTap: () {
                //     WidgetsBinding.instance.addPostFrameCallback((_) {});
                //   },
                // ),

                ListTile(
                  subtitle: Text(
                    "contactus",
                    style: TextStyle(color: ColorManager.sidBarIcon),
                  ),
                  title: Text(
                    "contactus",
                    //style: Theme.of(context).textTheme.titleMedium,
                  ),
                  leading: Icon(
                    Icons.language,
                    color: ColorManager.sidBarIcon,
                  ),
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {});
                  },
                ),

                Divider(
                  color: ColorManager.sidBarIcon,
                  height: 15,
                ),

                //     ListTile(
                //         title: Text(StringsManager.signOut),
                //         leading: Icon(
                //           Icons.logout,
                //           color: ColorManager.sidBarIcon,
                //         ),
                //         onTap: () async {}),
                //   ],
                // )

                //     ListTile(
                //         title: Text(LocaleKeys.signOut.tr()),
                //         leading: Icon(
                //           Icons.logout,
                //           color: ColorManager.sidBarIcon,
                //         ),
                //         onTap: () async {}),
                //   ],
                // )
              ],
            )
        ),
      );
    }
    );
  }
  isRtl(){
    return context.locale==ARABIC_LOCALE;
  }
  _changeLanguage()async {
    // i will implement it later
    await  _appPreferences.changeAppLanguage().then((value) =>

        Phoenix.rebirth(context)
    );


  }
}
