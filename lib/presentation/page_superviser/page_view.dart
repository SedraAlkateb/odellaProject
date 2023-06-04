import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/page/drawer/view/drawer.dart';
import 'package:untitled/presentation/page_superviser/drawer/view/drawer.dart';
import 'package:untitled/presentation/page_superviser/page_view_model.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
class SupervisorPagesView extends StatelessWidget  {
  const SupervisorPagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mpp = Provider.of<PageSupervisorViewModel>(context);
    return Scaffold(
      appBar: (mpp.items[mpp.selectedIndex].appBar) ?? AppBar(),
      drawer:  DrawerSupervisorView(),
      bottomNavigationBar:ClipRRect(
      borderRadius: const BorderRadius.only(
      topRight: Radius.circular(AppSize.s28),
      topLeft: Radius.circular(AppSize.s28),
      ),child:
    Container(
       color: Colors.black,
      child: BottomNavigationBar(
        selectedItemColor: ColorManager.black,

          unselectedItemColor: ColorManager.black,
          currentIndex: mpp.selectedIndex,
          elevation: AppSize.s60,
          onTap: (i){
            mpp.selectedIndex = i;
          },
          items: mpp.items
              .map((e) =>
              BottomNavigationBarItem(icon: Icon(e.iconData), label: e.label))
              .toList(),
        ),
    ),),

      body: IndexedStack(
        index: Provider.of<PageSupervisorViewModel>(context).selectedIndex,
        children: mpp.items.map((e) => e.widget!).toList(),
      ),

      
    );
  }
}
