import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/page/drawer/view/drawer.dart';
import 'package:untitled/presentation/page/page_view_model.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
class PagesView extends StatelessWidget  {
  const PagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mp = Provider.of<NavbarProvider>(context);
    return Scaffold(
      appBar: (mp.items[mp.selectedIndex].appBar) ?? AppBar(),
      drawer:  NavBar(),
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
          currentIndex: mp.selectedIndex,
          elevation: AppSize.s60,
          onTap: (i){
            mp.selectedIndex = i;
          },
          items: mp.items
              .map((e) =>
              BottomNavigationBarItem(icon: Icon(e.iconData), label: e.label))
              .toList(),
        ),
    ),),

      body: IndexedStack(
        index: Provider.of<NavbarProvider>(context).selectedIndex,
        children: mp.items.map((e) => e.widget!).toList(),
      ),

      
    );
  }
}
