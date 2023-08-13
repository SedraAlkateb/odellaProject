import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:untitled/presentation/not_viewmodel.dart';
import 'package:untitled/presentation/component/icon_notification.dart';
import 'package:untitled/presentation/page/complaints/view_model/complaints_viewmodel.dart';
import 'package:untitled/presentation/page/drawer/view/drawer.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import '../../../../lang/locale_keys.g.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/style_manage.dart';
import '../../../resources/values_manager.dart';
import 'package:sizer/sizer.dart';

class ComplaintsView extends StatefulWidget {
  const ComplaintsView({Key? key}) : super(key: key);

  @override
  State<ComplaintsView> createState() => _ComplaintsViewState();
}

class _ComplaintsViewState extends State<ComplaintsView> {
//   TextEditingController textEditingController = TextEditingController();
//   int dropdownTransportationLine = 0;

   var viewModel;
 @override
   void initState() {
   viewModel = Provider.of<ComplaintsViewModel>(context, listen: false);
   viewModel.start();
 //  Provider.of<ComplaintsViewModel>(context).start();
     super.initState();
   }
//   items:Provider.of<ComplaintsViewModel>(context).getTrip()

 // Provider.of<ComplaintsViewModel>(context, listen: false) .setTripId(val!);
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(
          LocaleKeys.comprating.tr(),
          style: getBoldStyle(
            color: ColorManager.sidBarIcon,
            fontSize: FontSize.s20,
          ),
        ),
        actions: [
          notificationIcon(context)
        ],
      ),
      body:
      Provider.of<ComplaintsViewModel>(context).getStateScreen() == 0
          ?  screenWidget(context)

          :Provider.of<ComplaintsViewModel>(context).getStateScreen()==1
          ?StateRenderer(
          stateRendererType: StateRendererType.fullScreenLoadingState,
          message: "Loading",
          retryActionFunction: () {})
          : Provider.of<ComplaintsViewModel>(context).getStateScreen()==2
          ? StateRenderer(
          stateRendererType: StateRendererType.fullScreenErrorState,
          message: "something wrong",
          retryActionFunction: () {})
          : StateRenderer(
          stateRendererType: StateRendererType.fullScreenEmptyState,
          message: "not found any item",
          retryActionFunction: () {})
    );
  }
}
Widget screenWidget(BuildContext context){
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  void _onRefresh() async {
    Provider.of<ComplaintsViewModel>(context,listen: false).start();
    _refreshController.refreshCompleted();
  }
  return
    Column(children: [
    Padding(
      padding: const EdgeInsets.only(
          left: AppPadding.p20,
          right: AppPadding.p20,
          bottom: AppPadding.p20),
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
                color: Colors.grey.shade300, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppSize.s16),
            ),
          ),
          // fillColor: ColorManager.white,
          border: OutlineInputBorder(
            //  borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
            borderSide:
            BorderSide(color: ColorManager.shadow, width: AppSize.s1_5),
          ),
          hintStyle: getRegularStyle(
              color: ColorManager.icon, fontSize: FontSize.s16),
          hintText: "${"LocaleKeys.searchtrip.tr()"}",
          //       hintStyle:Theme.of(context).textTheme.bodySmall,
          prefixIcon: Padding(
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
      Padding(
        padding: const EdgeInsets.only(
            left: AppPadding.p28,
            right: AppPadding.p28,
            bottom: AppPadding.p28),

  child:
  Provider.of<ComplaintsViewModel>(context).getTrip().length!=0?

  SmartRefresher(
          controller: _refreshController,
          onRefresh: _onRefresh,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => const SizedBox(
              width: double.infinity,
              height: AppSize.s20,
              // color: Color,
            ),
            itemCount: Provider.of<ComplaintsViewModel>(context).getTrip().length,
            itemBuilder: (context, index) =>

            Container(
              height: 50.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius:
                const BorderRadius.all(Radius.circular(AppSize.s30)),
                //        color: ColorManager.card,
              ),
              child: Padding(
                padding: EdgeInsets.all(15.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        SizedBox(width: 4.w,),
                        Text("${"data"} : ${Provider.of<ComplaintsViewModel>(context,listen: false).getTrip()[index].time?.date}",style: getBoldStyle(color: Colors.black,fontSize: FontSize.s16),),
                      ],
                    ),
                    SizedBox(height: 1.h,),
                    Row(
                      children: [
                        SizedBox(width: 4.w,),

                        Text("${"time"} : ${Provider.of<ComplaintsViewModel>(context,listen: false).getTrip()[index].time?.start}",style: getMediumStyle(color: Colors.black,fontSize: FontSize.s16),),
                      ],
                    ),
                    SizedBox(height: 2.h,),
                    Column(
                      children: [
                        SizedBox(width: 4.w,),
                        Text("${"Rating"} :"),
                        RatingBar.builder(
                          initialRating: Provider.of<ComplaintsViewModel>(context,listen: false).ifEval(Provider.of<ComplaintsViewModel>(context,listen: false).getTrip()[index].id),
                          minRating: 1,
                          direction: Axis.horizontal,
                          //   allowHalfRating: true,
                          itemCount: 5,
                          itemSize:25,
                          itemPadding:  EdgeInsets.symmetric(
                              horizontal: 1.sp),
                          itemBuilder: (context, _) =>
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),

                          onRatingUpdate: (rating) {

                            Provider.of<ComplaintsViewModel>(context,
                                listen: false)
                                .evaluation(rating.toInt(),Provider.of<ComplaintsViewModel>(context,listen: false).getTrip()[index].id);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h,),
                    TextField(
                      //       controller: textEditingController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: LocaleKeys.Enteryourcompliaint.tr(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.w, color: ColorManager.sidBar),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 0.5.w, color: Colors.grey),
                          ),
                        ),

                        onChanged: (value){

                          Provider.of<ComplaintsViewModel>(context,listen: false).setDescription(value);
                          //   textEditingController.text=value;
                        }
                    ),
                    SizedBox(height: 3.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        IconButton(icon: Icon(Icons.check_circle,size: 30,), onPressed: () {
                          if(Provider.of<ComplaintsViewModel>(context,listen: false).getDescription().isNotEmpty){

                            LoadingState(stateRendererType: StateRendererType.popupLoadingState).showPopup(context, StateRendererType.popupLoadingState, LocaleKeys.loading);
                            Provider.of<ComplaintsViewModel>(context,listen: false).
                            storeClaim(Provider.of<ComplaintsViewModel>(context,listen: false).getTrip()[index].id).then((value) {
                              if(value){
                                SuccessState("success").dismissDialog(context);
                                SuccessState("success").showPopup(context,StateRendererType.popupSuccess,"Success");
                                Provider.of<ComplaintsViewModel>(context,listen: false).setDescription("");
                              }else{
                                ErrorState(StateRendererType.popupErrorState, "somthing worng").dismissDialog(context);
                                ErrorState(StateRendererType.popupErrorState, "somthing worng").showPopup(context,StateRendererType.popupErrorState,"somthing worng");
                                Provider.of<ComplaintsViewModel>(context,listen: false).setDescription("");

                              }
                            }
                            );

                          }

                        },color: ColorManager.sidBar),
                      ],
                    ),
                  ],
                ),
              ),
            )

          ),
        ):
  SmartRefresher(
    controller: _refreshController,
    onRefresh: _onRefresh,
    child: ListView(

  children: [
    Center(

      child: StateRenderer(
          stateRendererType: StateRendererType.fullScreenEmptyState,
          message: "not found any item",
          retryActionFunction: () {}),
    ),

  ],
    ),
  )

      ),
    ),
  ]);

}

