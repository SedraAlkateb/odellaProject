
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/lang/locale_keys.g.dart';
import 'package:untitled/presentation/page_superviser/daily_recieve/view/daily_recieve_view.dart';
import 'package:untitled/presentation/page_superviser/home_supervisor/view/home_supervisor_view.dart';
import 'package:untitled/presentation/page_superviser/profile/view/profile_view.dart';
import 'package:untitled/presentation/page_superviser/profile/view/supervispr_profile_view.dart';
import 'package:untitled/presentation/page_superviser/program_supervisor/view/program_supervisor_view.dart';
import 'package:untitled/presentation/resources/conestants_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';

import '../../testing.dart';

class PageSupervisorViewModel  with ChangeNotifier {
 late BuildContext context;
  List<NavbarDTO> items = [

    NavbarDTO(label: LocaleKeys.dailyrecieve.tr(),widget: DailyReceiveView(),iconData: Icons.chrome_reader_mode),
    NavbarDTO(label: LocaleKeys.Home.tr(),widget: HomeSupervisorView(),iconData: Icons.home),
    NavbarDTO(label: LocaleKeys.profile.tr(),widget:SupervisorProfileView(),iconData: Icons.account_box_rounded),
    NavbarDTO(label: LocaleKeys.programmer.tr(),widget: SupervisorProgramView(),iconData: Icons.chrome_reader_mode),
    // NavbarDTO(label: 'daily receive',widget: DailyReceiveView(),iconData: Icons.chrome_reader_mode,appBar: getAppBarProgram()),
  ];
  int _selectedIndex = AppConstants.home;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}
class NavbarDTO{
  Widget? widget;
  AppBar? appBar;
  String? label;
  IconData? iconData;

  NavbarDTO({this.widget, this.label, this.iconData,this.appBar});

}