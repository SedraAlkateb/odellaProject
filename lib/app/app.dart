
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/app/app_preferences.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/base_home/view_model/base_home_view_model.dart';
import 'package:untitled/presentation/map_position/view_model/map_position_view_model.dart';
import 'package:untitled/presentation/page/complaints/view_model/complaints_viewmodel.dart';
import 'package:untitled/presentation/page/drawer/view/drawer_viewmodel.dart';
import 'package:untitled/presentation/page/lost_items/view_model/lost_items_viewmodle.dart';
import 'package:untitled/presentation/page/page_view_model.dart';
import 'package:untitled/presentation/login/view_model/login_viewmodel.dart';
import 'package:untitled/presentation/page/program/view_model/programs_viewmodel.dart';
import 'package:untitled/presentation/page_superviser/page_view_model.dart';

import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/them_manager.dart';
import 'package:untitled/presentation/settings/view_model/settings_viewmaodel.dart';
import 'package:untitled/presentation/signup/view_model/signup_view_model.dart';
import 'package:untitled/presentation/page/home/view_model/home_view_model.dart';
import 'package:untitled/presentation/page/profile/view_model/profile_view_model.dart';
import 'package:untitled/presentation/subscription/view_model/subscription_view_model.dart';


class MyApp extends StatefulWidget {
  //name constructor
  MyApp._internal();

  static final MyApp _instance=

  MyApp._internal();

  factory MyApp()=> _instance;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _appPreferences =instance<AppPreferences>();
  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>instance<SignUpViewModel>()),
        ChangeNotifierProvider(create: (_)=> MapPositionViewModel()),
        ChangeNotifierProvider(create: (_)=> instance<LoginViewModel>()),
        ChangeNotifierProvider(create: (_)=> instance<HomeViewModel>()),
        ChangeNotifierProvider(create: (_)=>NavbarProvider()),
        ChangeNotifierProvider(create: (_)=>PageSupervisorViewModel()),
        ChangeNotifierProvider(create: (_)=>instance<ProfileViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<SubscriptionViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<DrawerViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<BaseHomeViewModel>()),
        ChangeNotifierProvider(create: (_)=>LostItemsViewModel()),
        ChangeNotifierProvider(create: (_)=>ComplaintsViewModel()),
        ChangeNotifierProvider(create: (_)=>instance<ProgramsViewModel>()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner:false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
        theme: getApplicationTheme(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),

    );


  }
}
