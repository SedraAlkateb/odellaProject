import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/component/icon_notification.dart';
import 'package:untitled/presentation/page_superviser/daily_recieve/view_model/daily_recieve_viewmodel.dart';
import 'package:untitled/presentation/page_superviser/drawer/view/drawer.dart';
import 'package:untitled/presentation/page_superviser/home_supervisor/view_model/home_super_viewmodel.dart';
import '../../../../lang/locale_keys.g.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/style_manage.dart';
import '../../../resources/values_manager.dart';

class DailyReceiveView extends StatefulWidget {
  const DailyReceiveView({super.key});

  @override
  _DailyReceiveViewState createState() => _DailyReceiveViewState();
}

class _DailyReceiveViewState extends State<DailyReceiveView> {



  @override
  Widget build(BuildContext context) {

    if(Provider.of<HomeSuperVisorViewModel>(context).getSucc()){
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if(Provider.of<HomeSuperVisorViewModel>(context, listen: false).getHomeSuperVisor().id!=0){
          Provider.of<DailyReservationsViewModel>(context,listen: false).dailyReservation(Provider.of<HomeSuperVisorViewModel>(context, listen: false).getHomeSuperVisor().id);

        }
      });
      Provider.of<HomeSuperVisorViewModel>(context).setSucc(false);

    }

    return Sizer(builder: (context, orientation, deviceType) {
       return  Consumer<DailyReservationsViewModel>(
         builder: (context, model, child) =>
          Scaffold(
            drawer:  DrawerSupervisorView(),
            appBar: AppBar(
              actions: [
                notificationIcon(context)
              ],

              title: Text(LocaleKeys.dailyrecieve.tr(),
                  style: getBoldStyle(
                      color: ColorManager.sidBarIcon, fontSize: FontSize.s20)),
            ),
            body:
            Provider.of<DailyReservationsViewModel>(context).getStateScreen() == 0
                ?    SafeArea(
              child: orientation == Orientation.portrait
                  ? _widgetScreen1()
                  : _widgetScreen2(),
            )
                :Provider.of<DailyReservationsViewModel>(context).getStateScreen()==1
                ?StateRenderer(
                stateRendererType: StateRendererType.fullScreenLoadingState,
                message: "Loading",
                retryActionFunction: () {})
                :StateRenderer(
                stateRendererType: StateRendererType.fullScreenErrorState,
                message:  Provider.of<DailyReservationsViewModel>(context).getMessage1(),
                retryActionFunction: () {
                  Provider.of<DailyReservationsViewModel>(context,listen: false).getDailyReservations();
                })

          ),
       );

    }
    );
  }
 Widget _widgetScreen1(){
   RefreshController _refreshController =
   RefreshController(initialRefresh: false);

   void _onRefresh() async {
     if(Provider.of<HomeSuperVisorViewModel>(context, listen: false).getHomeSuperVisor().id!=0){
       Provider.of<DailyReservationsViewModel>(context,listen: false).dailyReservation(Provider.of<HomeSuperVisorViewModel>(context, listen: false).getHomeSuperVisor().id);

     }     _refreshController.refreshCompleted();
   }
    return Consumer<DailyReservationsViewModel>(
      builder: (context, model, child) =>
          Column(
            children: [
              Container(
                height: 10.h,
                margin: EdgeInsets.symmetric(
                    horizontal: 20.sp),
                child: TextFormField(
                  onChanged: (value) {
                    try {
                      // Provider.of<HomeViewModel>(context,listen: false).setSearch(value);
                    } catch (e, s) {
                      print("s");
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 0.5.w),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(AppSize.s16),
                        ),
                      ),
                      // fillColor: ColorManager.white,
                      border: OutlineInputBorder(
                        //  borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
                        borderSide: BorderSide(
                            color: ColorManager.shadow,
                            width: 0.5.w),
                      ),
                      hintStyle: getRegularStyle(
                          color: ColorManager.icon,
                          fontSize: FontSize.s16),
                      hintText: LocaleKeys.searchstudent.tr(),
                      //       hintStyle:Theme.of(context).textTheme.bodySmall,
                      prefixIcon: Padding(
                        padding:
                        EdgeInsets.only(left: 8.sp),
                        child: Icon(
                          Icons.search,
                          color: ColorManager.button,
                        ),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 1.h)),
                ),
              ),
              SizedBox(height: 4.h),
              TextButton(onPressed: (){
                model.triggerEvent();
              }, child: Text("jkbbkb")),
              Expanded(
                child: model.getDailyReservations().length == 0
                    ? SmartRefresher(
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                      child: Center(
                  child:StateRenderer(
                        stateRendererType: StateRendererType.fullScreenEmptyState,
                        message: "Not found any transmission lines",
                        retryActionFunction: () {})
                ),
                    )
                    : SmartRefresher(
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                      child: ListView.separated(
                  itemBuilder: (_, index) => Container(
                      margin:  EdgeInsets.symmetric(horizontal: 22.sp),
                      padding:  EdgeInsets.all(13.sp),
                      alignment: Alignment.center,
                      decoration:  BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${LocaleKeys.name.tr()}: ${model.getDailyReservations()[index].name}',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${LocaleKeys.ePhoneNumber.tr()}: ${model.getDailyReservations()[index].phoneNumber}',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${LocaleKeys.Position.tr()}: {model.getDailyReservations()[index].dataTransferPositions?.name}',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${LocaleKeys.seat.tr()}: ${model.getDailyReservations()[index].seatsNumber}',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: ()
                                  {
                                    model.
                                    approve(model.getDailyReservations()[index].id);
                                  },
                                  child: Container(

                                    margin: EdgeInsets.symmetric(horizontal: 15.sp),
                                    padding: EdgeInsets.all(7.sp),
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Text(
                                      '${LocaleKeys.accept.tr()}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: ()
                                  {
                                    model.
                                    deny(model.getDailyReservations()[index].id);
                                  },
                                  child: Container(
                                    margin:  EdgeInsets.symmetric(horizontal: 15.sp),
                                    padding:  EdgeInsets.all(7.sp),
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child:  Text(
                                      '${LocaleKeys.reject.tr()}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ),
                  separatorBuilder: (_, index) =>
                        SizedBox(
                          height: 2.h,
                        ),
                  itemCount: model.getDailyReservations().length,
                ),
                    ),
              ),
            ],
          )
    );
  }
  Widget _widgetScreen2(){
    RefreshController _refreshController =
    RefreshController(initialRefresh: false);

    void _onRefresh() async {
      if(Provider.of<HomeSuperVisorViewModel>(context, listen: false).getHomeSuperVisor().id!=0){
        Provider.of<DailyReservationsViewModel>(context,listen: false).dailyReservation(Provider.of<HomeSuperVisorViewModel>(context, listen: false).getHomeSuperVisor().id);

      }      _refreshController.refreshCompleted();
    }
    return Consumer<DailyReservationsViewModel>(
      builder: (context, model, child) =>
          Column(
            children: [
              Container(
                height: 5.h,
                margin: EdgeInsets.symmetric(
                    horizontal: 40.sp),
                child: TextFormField(
                  onChanged: (value) {
                    try {
                      // Provider.of<HomeViewModel>(context,listen: false).setSearch(value);
                    } catch (e, s) {
                      print(s);
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 0.5.w),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(AppSize.s16),
                        ),
                      ),
                      // fillColor: ColorManager.white,
                      border: OutlineInputBorder(
                        //  borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
                        borderSide: BorderSide(
                            color: ColorManager.shadow,
                            width: 0.5.w),
                      ),
                      hintStyle: getRegularStyle(
                          color: ColorManager.icon,
                          fontSize: FontSize.s16),
                      hintText: LocaleKeys.searchstudent.tr(),
                      //       hintStyle:Theme.of(context).textTheme.bodySmall,
                      prefixIcon: Padding(
                        padding:
                        EdgeInsets.only(left: 8.sp),
                        child: Icon(
                          Icons.search,
                          color: ColorManager.button,
                        ),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 1.h)),
                ),
              ),
              SizedBox(height: 4.h),
              Expanded(
                child: model.getDailyReservations().length == 0
                    ? SmartRefresher(
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  child: Center(
                      child:StateRenderer(
                          stateRendererType: StateRendererType.fullScreenEmptyState,
                          message: "Not found any transmission lines",
                          retryActionFunction: () {})
                  ),
                )
                :
                 SmartRefresher(
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  child: ListView.separated(
                    itemBuilder: (_, index) => Container(
                      margin:  EdgeInsets.symmetric(horizontal: 45.sp),
                      padding: EdgeInsets.all(25.sp),
                      alignment: Alignment.center,
                      decoration:  BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${LocaleKeys.name.tr()}: ${model.getDailyReservations()[index].name}',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${LocaleKeys.ePhoneNumber.tr()}: ${model.getDailyReservations()[index].phoneNumber}',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${LocaleKeys.Position.tr()}: {modelgetDailyReservations()[index].dataTransferPositions?.name}',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${LocaleKeys.seat.tr()}:${ model.getDailyReservations()[index].seatsNumber}',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: ()
                                  {
                                    model.
                                    approve(model.getDailyReservations()[index].id);
                                  },
                                  child: Container(

                                    margin:  EdgeInsets.symmetric(horizontal: 120.sp),
                                    padding: EdgeInsets.all(10.sp),
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Text(
                                      '${LocaleKeys.accept.tr()}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: ()
                                  {
                                    model.
                                    deny(model.getDailyReservations()[index].id);
                                  },
                                  child: Container(
                                    margin:  EdgeInsets.symmetric(horizontal: 120.sp),
                                    padding:  EdgeInsets.all(10.sp),
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Text(
                                      '${LocaleKeys.reject.tr()}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (_, index) =>
                        SizedBox(
                          height:2.h,
                        ),
                    itemCount:model.getDailyReservations().length,
                  ),
                ),
              ),
            ],
          ),
    );
  }

}
