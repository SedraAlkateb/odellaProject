import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:untitled/presentation/page/home/view_model/home_view_model.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/font_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/style_manage.dart';
import 'package:untitled/presentation/resources/values_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}



class _HomeViewState extends State<HomeView> {
@override
late NavigatorState _navigator;

  void didChangeDependencies() {
  _navigator = Navigator.of(context);
    super.didChangeDependencies();
  }
HomeViewModel homeViewModel =instance<HomeViewModel>();
final  _scaffoldKey = GlobalKey<FormState>();
@override
  void dispose() {
  homeViewModel.dispose();
    super.dispose();
  }
  @override
  void initState() {


    Provider.of<HomeViewModel>(context,listen: false).start();
    super.initState();
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body:
     contentWidget()
    );

  }

 Widget contentWidget(){
  if(Provider.of<HomeViewModel>(context).getIsPos()){
     WidgetsBinding.instance.addPostFrameCallback((_) {
       Provider.of<HomeViewModel>(context,listen: false).setIsPos(false);
       _navigator.pushNamed(Routes.mapPositionRoute);
     });
   }
   return  Column(

      children: [

        Padding(
          padding:
          const EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20,bottom: AppPadding.p20),
          child: TextFormField(
            onChanged: (value)  {
              try {
                Provider.of<HomeViewModel>(context,listen: false).setSearch(value);
              } catch (e, s) {
                print(s);
              }

            },
            decoration: InputDecoration(
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300,width: AppSize.s1_5),
                borderRadius:const BorderRadius.all(Radius.circular(AppSize.s16),),

              ),
              // fillColor: ColorManager.white,
              border: OutlineInputBorder(
                //  borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
                borderSide: BorderSide(color: ColorManager.shadow, width: AppSize.s1_5),
              ),
              hintStyle: getRegularStyle(color: ColorManager.icon,fontSize: FontSize.s16),
              hintText: StringsManager.search,
              //       hintStyle:Theme.of(context).textTheme.bodySmall,
              prefixIcon:  Padding(
                padding: const EdgeInsets.only(left: AppPadding.p8),
                child: Icon(
                  Icons.search,
                  color: ColorManager.button,

                ),
              ),
            ),
          ),
        ),
        Expanded(
            child:
            Provider.of<HomeViewModel>(context,listen: false).dataTransportationLinesSearch.length == 0
                ? Center(
              child: Text(
                "No result found",
                style: TextStyle(
                    color: ColorManager.shadow,
                    fontSize: FontSize.s22,
                    fontWeight: FontWeight.bold),
              ),
            )
                : Padding(
              padding: const EdgeInsets.only(
                  left: AppPadding.p28,right: AppPadding.p28,bottom: AppPadding.p28),
              child:
              ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) => const SizedBox(
                  width: double.infinity,
                  height: AppSize.s20,
                  // color: Color,
                ),
                itemCount: Provider.of<HomeViewModel>(context,listen: false).dataTransportationLinesSearch.length,
                itemBuilder: (context, index) =>
                    Container(
                      height: AppSize.s150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(AppSize.s30)),
                        //        color: ColorManager.card,
                      ),
                      child: InkWell(
                        onTap: (() {
                          Provider.of<HomeViewModel>(context,listen: false).setLine( Provider.of<HomeViewModel>(context,listen: false).dataTransportationLines[index]);
                          Provider.of<HomeViewModel>(context,listen: false).getPositionLineData( Provider.of<HomeViewModel>(context,listen: false).dataTransportationLines[index].id);

                        }),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: SvgPicture.asset(ImageAssets.bus,height: 40,width: 40,color: ColorManager.button,),),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Provider.of<HomeViewModel>(context,listen: false).dataTransportationLinesSearch[index].name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style:Theme.of(context).textTheme.labelLarge,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: AppPadding.p8),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:  [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(Icons.gps_not_fixed,size: AppSize.s18,color: ColorManager.button,),
                                                    Text(
                                                      Provider.of<HomeViewModel>(context,listen: false).dataTransportationLinesSearch[index].from!.name,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,

                                                      style:Theme.of(context).textTheme.headlineMedium,
                                                    ),

                                                  ],
                                                ),
                                                Icon(Icons.keyboard_arrow_down_sharp,size: AppSize.s18,color: ColorManager.button,),
                                                Icon(Icons.keyboard_arrow_down_sharp,size: AppSize.s18,color: ColorManager.button),
                                                //   Icon(Icons.circle_sharp,size: AppSize.s8,color: ColorManager.grey,),
                                                Row(
                                                  children: [
                                                    Icon(Icons.gps_fixed,size: AppSize.s18,color: ColorManager.button,),
                                                    Text(
                                                      Provider.of<HomeViewModel>(context,listen: false).dataTransportationLinesSearch[index].to!.name,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style:Theme.of(context).textTheme.headlineMedium,
                                                    ),

                                                  ],

                                                ),

                                              ],
                                            ),

                                          ],
                                        ),
                                      ),

                                    ],
                                  ),

                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              ),
            ))
      ]);
  }

  }

AppBar getHomeAppBar(){
  return  AppBar(
    title: Text( StringsManager.home,style: getBoldStyle(color: ColorManager.sidBarIcon,fontSize: FontSize.s20),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              //    Provider.of<LoginViewModel>(context,listen: false).isLog=false;
              //      Navigator.pop(context,Routes.afterSplashRoute);
            });
          },
          icon: SvgPicture.asset(
            ImageAssets.note,
            //     semanticsLabel: 'Acme Logo'
          ),
        ),
      ),
    ],

  );
}
/*
StreamBuilder<FlowState>(
          stream:
              Provider.of<HomeViewModel>(context, listen: false).outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context,  contentWidget(), () {
                  Provider.of<HomeViewModel>(context, listen: false).start();
                }) ??
                 contentWidget();
          });
 */

