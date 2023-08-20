
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/app/app_preferences.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/base_home/view_model/base_home_view_model.dart';
import 'package:untitled/presentation/befor_signup/view_model/algorithem_viewmodel.dart';
import 'package:untitled/presentation/change_password/view_model/change_pass_view_model.dart';
import 'package:untitled/presentation/daily_recerviton/view_model/daily_reservation%20_viewmodel.dart';
import 'package:untitled/presentation/daily_reser_map/view_model/daily_reser_map_viewmodel.dart';
import 'package:untitled/presentation/forget_password/view_model/forget_password_viewmodel.dart';
import 'package:untitled/presentation/map/view_model/polyLine_map_viewmodel.dart';
import 'package:untitled/presentation/map_position/view_model/map_position_view_model.dart';
import 'package:untitled/presentation/not_viewmodel.dart';
import 'package:untitled/presentation/number/number_view_model.dart';
import 'package:untitled/presentation/page/add_lost_item/view_model/add_lost_item_viewmodel.dart';
import 'package:untitled/presentation/page/complaints/view_model/complaints_viewmodel.dart';
import 'package:untitled/presentation/page/drawer/view/drawer_viewmodel.dart';
import 'package:untitled/presentation/page/lost_items/view_model/lost_items_viewmodle.dart';
import 'package:untitled/presentation/page/page_view_model.dart';
import 'package:untitled/presentation/login/view_model/login_viewmodel.dart';
import 'package:untitled/presentation/page/position/view_model/polyline_view_model.dart';
import 'package:untitled/presentation/page/program/view_model/programs_viewmodel.dart';
import 'package:untitled/presentation/page/supervisor_trip/view_model/supervisor_trip_viewmodel.dart';
import 'package:untitled/presentation/page_superviser/daily_recieve/view_model/daily_recieve_viewmodel.dart';
import 'package:untitled/presentation/page_superviser/drawer/view_model/drawer_viewmodel.dart';
import 'package:untitled/presentation/page_superviser/home_supervisor/view_model/home_super_viewmodel.dart';
import 'package:untitled/presentation/page_superviser/page_view_model.dart';
import 'package:untitled/presentation/page_superviser/profile/view_model/supervisor_profile_viewmodel.dart';
import 'package:untitled/presentation/reset_password/view_model/reset_password_viewmodel.dart';

import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/them_manager.dart';
import 'package:untitled/presentation/scan_qr_view/view_model/scan_qr_viewmodel.dart';
import 'package:untitled/presentation/signup/view_model/signup_view_model.dart';
import 'package:untitled/presentation/page/home/view_model/home_view_model.dart';
import 'package:untitled/presentation/page/profile/view_model/profile_view_model.dart';
import 'package:untitled/presentation/subscription/view_model/subscription_view_model.dart';

import '../presentation/page/polyyline_view_model.dart';


class MyApp extends StatefulWidget {
  //name constructor
  const MyApp._internal();

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
        ChangeNotifierProvider(create: (_)=>instance<SignUpViewModel>(),lazy: true,),
        ChangeNotifierProvider(create: (_)=> MapPositionViewModel()),
        ChangeNotifierProvider(create: (_)=> instance<LoginViewModel>(),lazy: true),
        ChangeNotifierProvider(create: (_)=> instance<HomeViewModel>()),
        ChangeNotifierProvider(create: (_)=>NavbarProvider()),
        ChangeNotifierProvider(create: (_)=>PageSupervisorViewModel()),
        ChangeNotifierProvider(create: (_)=>instance<ProfileViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<SubscriptionViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<DrawerViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<BaseHomeViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<LostItemsViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<ComplaintsViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<ProgramsViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<ForgotPasswordViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<ResetPasswordViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<HomeSuperVisorViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<SupervisorProfileViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<DrawerSupervisorViewModel>()),
        ChangeNotifierProvider(create: (_)=>PolyLineViewModel()),
        ChangeNotifierProvider(create: (_)=>instance<ScanQrViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<AddLostItemViewModel>()),
        ChangeNotifierProvider(create: (_)=>PolyLineMapViewModel()),
        ChangeNotifierProvider(create: (_)=>instance<DailyReservationsViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<Not>()),
        ChangeNotifierProvider(create: (_)=>instance<SupervisorTripViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<DailyReservationViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<DailyReservationMapViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<AlgorithmViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<ChangePasswordViewModel>()),
        ChangeNotifierProvider(create: (_)=>instance<NumberViewModel>()),

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
