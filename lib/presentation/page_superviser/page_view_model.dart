import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:untitled/presentation/page/profile/view/profile_view.dart';
import 'package:untitled/presentation/page/program/view/programs_view.dart';
import 'package:untitled/presentation/page_superviser/home_supervisor/view/home_supervisor_view.dart';
import 'package:untitled/presentation/page_superviser/profile/view/supervispr_profile_view.dart';
import 'package:untitled/presentation/resources/conestants_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';

class PageSupervisorViewModel  with ChangeNotifier {
  List<NavbarDTO> items = [
    NavbarDTO(label: StringsManager.home,widget: HomeSupervisorView(),iconData: Icons.home),
    NavbarDTO(label: StringsManager.profile,widget: SupervisorProfileView(),iconData: Icons.account_box_rounded),
    NavbarDTO(label: StringsManager.programmer,widget: ProgramsView(),iconData: Icons.chrome_reader_mode,appBar: getAppBarProgram()),
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