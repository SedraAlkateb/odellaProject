import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/lang/locale_keys.g.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/presentation/page/complaints/view/complaints_view.dart';
import 'package:untitled/presentation/page/home/view/home_view.dart';
import 'package:untitled/presentation/page/lost_items/view/lost_items_view.dart';
import 'package:untitled/presentation/page/position/view/polyline_view.dart';
import 'package:untitled/presentation/page/profile/view/profile_view.dart';
import 'package:untitled/presentation/page/program/view/programs_view.dart';
import 'package:untitled/presentation/resources/conestants_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';

class NavbarProvider  with ChangeNotifier {
  List<NavbarDTO> items = [
    NavbarDTO(label: StringsManager.lostItems,widget: LostItemsView(),iconData: Icons.storefront_outlined),
    NavbarDTO(label: StringsManager.complaints,widget: ComplaintsView(),iconData: Icons.call),
    NavbarDTO(label: StringsManager.home,widget: HomeView(),iconData: Icons.home),
    NavbarDTO(label: LocaleKeys.profile.tr(),widget: ProfileView(),iconData: Icons.account_box_rounded),
    NavbarDTO(label: StringsManager.programmer,widget: ProgramsView(),iconData: Icons.chrome_reader_mode),
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