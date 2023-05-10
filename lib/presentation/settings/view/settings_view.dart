import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:untitled/app/app_preferences.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/language_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  AppPreferences _appPreferences=instance<AppPreferences>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringsManager.settings,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            subtitle: Text(
              StringsManager.languageInfo,
              style: TextStyle(color: ColorManager.sidBarIcon),
            ),
            title: Text(
              StringsManager.language,
              style: Theme.of(context).textTheme.titleMedium,
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
              StringsManager.changePassword,
              style: TextStyle(color: ColorManager.sidBarIcon),
            ),
            title: Text(
              StringsManager.changePassword,
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
          ListTile(
            subtitle: Text(
              StringsManager.inviteFriends,
              style: TextStyle(color: ColorManager.sidBarIcon),
            ),
            title: Text(
              StringsManager.changePassword,
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
          ListTile(
            subtitle: Text(
              StringsManager.contactUs,
              style: TextStyle(color: ColorManager.sidBarIcon),
            ),
            title: Text(
              StringsManager.changePassword,
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
          ListTile(
              title: Text(StringsManager.signOut),
              leading: Icon(
                Icons.logout,
                color: ColorManager.sidBarIcon,
              ),
              onTap: () async {}),
        ],
      ),
    );
  }
  isRtl(){
    return context.locale==ARABIC_LOCALE;
  }
  _changeLanguage() {
    // i will implement it later
    _appPreferences.changeAppLanguage();


    Phoenix.rebirth(context);
  }
}
